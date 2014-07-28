# /* Rejection :: {address:address offerDate:date bidderName:name
#                   bidderAddress:address decisionDate:date} */
# Rejection = project_away(restrict(Decision | accepted == false),
#                          accepted)
require '../base-relations/decision'

Rejection = Decision
  .restrict(->(decision) { decision.accepted == false })
  .project_away(:accepted)
