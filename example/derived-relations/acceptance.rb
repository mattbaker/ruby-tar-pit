require_relative '../base-relations/decision'

Acceptance = Decision
  .restrict(->(decision) { decision.accepted == true })
  .project_away(:accepted)
