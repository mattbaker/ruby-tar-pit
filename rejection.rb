# /* Rejection :: {address:address offerDate:date bidderName:name
#                   bidderAddress:address decisionDate:date} */
# Rejection = project_away(restrict(Decision | accepted == false),
#                          accepted)
require_relative 'lib/derived-relation'
require 'decision'

class Rejection < DerivedRelation
  extend_relation Decision
  restrict ->(decision) { decision.accepted == false }
  strip :accepted
end