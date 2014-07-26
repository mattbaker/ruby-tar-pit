# /* Acceptance :: {address:address offerDate:date bidderName:name
#                   bidderAddress:address decisionDate:date} */
# Acceptance = project_away(restrict(Decision | accepted == true),
#                           accepted)

require_relative 'lib/derived_relation'
require_relative 'decision'

class Acceptance < DerivedRelation
  extend_relation Decision
  restrict ->(decision) { decision.accepted == true }
  strip :accepted
end