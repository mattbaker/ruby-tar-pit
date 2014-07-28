require 'date'

require_relative 'base-relations/room'
require_relative 'base-relations/offer'
require_relative 'base-relations/decision'
require_relative 'base-relations/property'

require_relative 'derived-relations/room-info'
require_relative 'derived-relations/bathroom'
require_relative 'derived-relations/property-info'
require_relative 'derived-relations/accepted-offers'

living_room = Room.new({
  address: '2933 NE 26th Portland, OR',
  room_name: 'Front Living Room',
  width: 200,
  breadth: 300,
  type: :LIVING_ROOM})

bathroom1 = Room.new({
  :address => '2933 NE 26th Portland, OR',
  :room_name => 'Half Bath',
  :width => 40,
  :breadth => 40,
  :type => :BATHROOM})

bathroom2 = Room.new({
  :address => '5030 N Winthrop Chicago, IL',
  :room_name => 'Full Bath',
  :width => 80,
  :breadth => 40,
  :type => :BATHROOM})

kitchen = Room.new({
  :address => '2933 NE 26th Portland, OR',
  :room_name => 'Kitchen',
  :width => 150,
  :breadth => 500,
  :type => :KITCHEN})

home = Property.new({
  :address => '2933 NE 26th Portland, OR',
  :price => 300_000,
  :photo => 'pdx.jpeg',
  :agent => 'Smacks Johnson',
  :date_registered => Date.new(2007, 1, 1)})

chi = Property.new({
  :address => '5030 N Winthrop Chicago, IL',
  :price => 1_000_000,
  :photo => 'chi.png',
  :agent => 'Slim Pete',
  :date_registered => Date.new(2001, 10, 10)})

chi_offer = Offer.new({
  address: '5030 N Winthrop Chicago, IL',
  offer_price: 1_200_000,
  offer_date: Date.new(2001, 11, 11),
  bidder_name: "Jim",
  bidder_address: "1202 Foo Bar Chicago, IL"})

pdx_offer = Offer.new({
  address: '2933 NE 26th Portland, OR',
  offer_price: 5_200_000,
  offer_date: Date.new(2012, 7, 2),
  bidder_name: "Jane",
  bidder_address: "999 Burg, IL"})

pdx_offer2 = Offer.new({
  address: '2933 NE 26th Portland, OR',
  offer_price: 100_000,
  offer_date: Date.new(2012, 7, 2),
  bidder_name: "Bob",
  bidder_address: "555 Zip Chicago, IL"})


chi_decision = Decision.new({
  address: '5030 N Winthrop Chicago, IL',
  bidder_name: "Jim",
  bidder_address: "1202 Foo Bar Chicago, IL",
  decision_date: Date.new(2001, 12, 12),
  accepted: true})

pdx_decision = Decision.new({
  address: '2933 NE 26th Portland, OR',
  bidder_name: "Jane",
  bidder_address: "999 Burg, IL",
  decision_date: Date.new(2012, 2, 3),
  accepted: true})

pdx_decision2 = Decision.new({
  address: '2933 NE 26th Portland, OR',
  bidder_name: "Bob",
  bidder_address: "555 Zip Chicago, IL",
  decision_date: Date.new(2012, 2, 5),
  accepted: false})



puts Room
puts Bathroom
puts Property
puts PropertyInfo
puts Offer
puts AcceptedOffers
