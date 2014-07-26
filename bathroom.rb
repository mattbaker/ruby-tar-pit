require_relative 'lib/derived-relation'
require_relative 'room'

class Bathroom < DerivedRelation
  extend_relation Room
  restrict ->(room) { room.type == :BATHROOM }
  strip :type
end