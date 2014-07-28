require_relative 'room-info'

Bathroom = RoomInfo
  .restrict(->(room_info) { room_info.type == :BATHROOM })
  .project_away(:type)
