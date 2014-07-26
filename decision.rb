require_relative 'lib/base-relation'
class Decision < BaseRelation
  property :address
  property :offer_date
  property :bidder_name
  property :bidder_address
  property :decision_date
end
