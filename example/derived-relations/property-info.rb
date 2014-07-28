# /* PropertyInfo :: {address:address price:price photo:filename
#                     agent:agent dateRegistered:date
#                     priceBand:priceBand areaCode:areaCode
#                     numberOfRooms:int squareFeet:double} */
# PropertyInfo =
# extend_relation(Property,
#        (priceBand = priceBandForPrice(price)),
#        (areaCode = areaCodeForAddress(address)),
#        (numberOfRooms = count(restrict(RoomInfo |
#                                        address == address))),
#        (squareFeet = sum(roomSize, restrict(RoomInfo |
#                                             address == address))))

require_relative '../base-relations/property'
require_relative 'room-info'

PropertyInfo = Property
  .extend_relation(
    price_band: ->(price) do
      return :LOW if price < 100_000
      return :MED if price >= 100_000 && price < 500_000
      return :HIGH if price >= 500_000
    end,
    area_code: ->(address) do
      return 97212 if address.include? "Portland"
      return 60640 if address.include? "Chicago"
      return 55555
    end,
    number_of_rooms: ->(address) do
      RoomInfo
        .restrict(->(room_info) { room_info.address == address }).all.count
    end,
    square_feet: ->(address) do
      RoomInfo
        .restrict(->(room_info) { room_info.address == address })
        .all
        .map(&:room_size)
        .reduce(:+)
    end
  )
