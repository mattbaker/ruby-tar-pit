require_relative 'lib/base-relation'
class Offer < BaseRelation
  property :address
  property :offer_price
  property :offer_date
  property :bidder_name
  property :bidder_address
end