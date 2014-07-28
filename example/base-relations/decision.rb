require_relative '../../lib/base-relation'

class Decision < BaseRelation
  attribute :address
  attribute :bidder_name
  attribute :bidder_address
  attribute :decision_date
  attribute :accepted
end
