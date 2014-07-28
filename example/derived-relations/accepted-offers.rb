require_relative 'acceptance'

AcceptedOffers = Acceptance
  .join(Offer)
  .join(PropertyInfo)
  .extend_relation(
    profit: ->(offer_price, price) { offer_price - price },
    profit_per_sq_ft: ->(profit, square_feet) {profit / square_feet})
  .project(:address, :area_code, :profit, :profit_per_sq_ft, :price_band)