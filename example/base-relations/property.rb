require_relative '../../lib/base-relation'

class Property < BaseRelation
  attribute :address
  attribute :price
  attribute :photo
  attribute :agent
  attribute :date_registered
end