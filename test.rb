require 'date'
require_relative 'room'
require_relative 'room-info'
require_relative 'bathroom'
require_relative 'property-info'

living_room = Room.new({
          :address => '2933 NE 26th Portland, OR',
          :room_name => 'Front Living Room',
          :width => 200,
          :breadth => 300,
          :type => :LIVING_ROOM})

bathroom = Room.new({
          :address => '2933 NE 26th Portland, OR',
          :room_name => 'Half Bath',
          :width => 40,
          :breadth => 40,
          :type => :BATHROOM})

bathroom = Room.new({
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

#puts RoomInfo.all

#puts Bathroom.all

puts PropertyInfo.all