require_relative '../../lib/base-relation'

class Room < BaseRelation
  attribute :address
  attribute :room_name
  attribute :width
  attribute :breadth
  attribute :type
end