require_relative 'relation-operations'
require_relative 'relation-display'

class Relation
  extend RelationOperations
  extend RelationDisplay

  attr_reader :values

  def initialize(values)
    @values = values
    @values.each do |prop, value|
      instance_variable_set("@#{prop}", value)
    end
  end

  def becomes(other_relation)
    other_relation.new(@values)
  end

  def merge(other_record)
    self.class.new(@values.merge(other_record.values)) if other_record
  end

  def matches?(other_record, match_attributes)
    match_attributes.all? do |attribute|
      self.send(attribute) == other_record.send(attribute)
    end
  end

  def apply_self(fnc)
    args = fnc.parameters.map do |_, prop|
      self.send(prop)
    end
    fnc.call(*args)
  end

  def self.all
    records = @base.all
      .map {|base_record| base_record.becomes(self)}

    if @join
      common_attributes = [@base, @join]
        .map(&:attributes)
        .map(&:keys)
        .reduce(:&)
      records.map! do |record|
        record.merge(@join.all.find {|join_record| record.matches?(join_record, common_attributes)})
      end
    end

    records.select{|record| restriction.call(record)}
  end

  def self.attributes
    @attributes ||= {}
  end

  def self.attribute(name, fnc=nil)
    self.attributes[name] = fnc
    if fnc
      define_method(name) { apply_self(fnc) }
    else
      attr_reader name
    end
  end
end
