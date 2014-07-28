require_relative 'relation'

class BaseRelation < Relation
  def self.all
    ObjectSpace.each_object(self).to_a
  end
end
