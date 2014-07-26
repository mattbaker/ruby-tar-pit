# /* PropertyInfo :: {address:address price:price photo:filename
#                     agent:agent dateRegistered:date
#                     priceBand:priceBand areaCode:areaCode
#                     numberOfRooms:int squareFeet:double} */
# PropertyInfo =
# extend(Property,
#        (priceBand = priceBandForPrice(price)),
#        (areaCode = areaCodeForAddress(address)),
#        (numberOfRooms = count(restrict(RoomInfo |
#                                        address == address))),
#        (squareFeet = sum(roomSize, restrict(RoomInfo |
#                                             address == address))))

require_relative 'lib/derived-relation'
require_relative 'property'
require_relative 'room-info'

class PropertyInfo < DerivedRelation
  PRICE_BAND_FOR_PRICE = ->(price) do
    return :LOW if price < 100_000
    return :MED if price >= 100_000 && price < 500_000
    return :HIGH if price >= 500_000
  end

  AREA_CODE_FOR_ADDRESS = ->(address) do
    return 97212 if address.include? "Portland"
    return 60640 if address.include? "Chicago"
    return 55555
  end

  extend_relation Property

  #todo, defined DerivedRelation::join instead of this madness below
  attribute :rooms, ->(address) {
    Class.new(DerivedRelation) {
      extend_relation RoomInfo
      restrict ->(room_info) { room_info.address == address }
    }.all
  }
  strip :rooms

  attribute :price_band, PRICE_BAND_FOR_PRICE
  attribute :area_code, AREA_CODE_FOR_ADDRESS
  attribute :number_of_rooms, ->(rooms) {rooms.count}
  attribute :square_feet, ->(rooms) {rooms.map(&:room_size).reduce(:+)}
end
