require_relative '../base-relations/room'

RoomInfo = Room.extend_relation(
  room_size: ->(width, breadth) { width * breadth }
)
