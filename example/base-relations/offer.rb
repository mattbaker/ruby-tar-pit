require_relative '../../lib/base-relation'
class Offer < BaseRelation
  attribute :address
  attribute :offer_price
  attribute :offer_date
  attribute :bidder_name
  attribute :bidder_address
end