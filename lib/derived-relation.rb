require_relative 'relation'

class DerivedRelation < Relation
  def initialize(record)
    raise "Invalid record type" unless record.is_a? self.class.base_relation
    @record = record
  end

  def self.all
    base_relation.all
      .map { |record| self.new(record) }
      .select(&:satisfies_contraint?)
  end

  def self.extend_relation(relation)
    relation.attributes.each { |attribute| delegate(attribute) }
    attributes.concat(relation.attributes)
    @base_relation = relation
  end

  def self.restrict(constraint)
    restrictions << constraint
  end

  def self.attribute(name, fnc)
    super(name)
    define_method(name) do
      arguments = fnc.parameters.map do |_, prop|
        receiver = self.respond_to?(prop) ? self : @record #can ditch this if we refactor to define some "::join" I think
        receiver.send(prop)
      end
      fnc.call(*arguments)
    end
  end

  def self.strip(*names)
    self.attributes.delete_if {|attr| names.include? attr}
  end

  def self.base_relation
    @base_relation
  end

  def self.restrictions
    @restrictions ||= []
  end

  def satisfies_contraint?
    self.class.restrictions
      .all? { |constraint| constraint.call(@record) }
  end

  def to_s
    strbuf = []
    strbuf << "#{self.class.name}"
    strbuf << "--------------"
    strbuf << "#{description}"
    strbuf << "\n"
    strbuf.join("\n")
  end

  private

  def self.delegate(name)
    define_method(name) { @record.send(name) }
  end
end