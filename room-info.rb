require_relative 'lib/derived-relation'
require_relative 'room'

class RoomInfo < DerivedRelation
  extend_relation Room
  attribute :room_size, ->(width, breadth) { width * breadth }
end