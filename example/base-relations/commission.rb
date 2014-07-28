require_relative '../../lib/base-relation'

class Commission < BaseRelation
  attribute :price_band
  attribute :area_code
  attribute :sale_speed
  attribute :commission
end
