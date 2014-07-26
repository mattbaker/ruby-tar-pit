require_relative 'relation'

class BaseRelation < Relation
  def initialize(values)
    values.each do |prop, value|
      instance_variable_set("@#{prop}", value)
    end
  end

  def self.attribute(name)
    super
    attr_reader name
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end
end