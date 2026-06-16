---
name: decision-recording
description: Use when an accepted choice has durable tradeoffs, architecture impact, public contract impact, or rationale future agents need.
---

# Skill: Decision Recording

## Use For

Capture durable decisions, tradeoffs, and rationale in the correct location.

## When NOT To Use

Do not use this skill to create ADRs for obvious, local, low-impact implementation choices.

## Key Moves

- Identify the decision, constraints, and alternatives.
- Decide whether task notes are enough or an ADR is needed.
- Record tradeoffs, consequences, reversibility, and follow-up work.
- Link related task, feature, architecture, and product docs.
- Update the decisions index when durable ADRs are added.

## Output

- decision notes
- ADR when appropriate
- recorded tradeoffs and rationale
- linked follow-up work

## Task Note Is Enough When

Keep the decision in task history when it is local, obvious, reversible, or unlikely to matter in future tasks.

Create durable decision records only when future agents or developers need the rationale.

## Verification

Before reporting this work complete:

- record what evidence was inspected
- record checks that were run
- record checks that were skipped and why
- identify unresolved risks or ambiguity

## Common Mistakes

Avoid:

- creating ADRs for every implementation choice
- recording decisions before the choice is accepted
- omitting alternatives and consequences
- storing durable rationale only in handoff notes

## Escalate When

- decision impact is long-lived or architectural
- multiple viable directions remain unresolved
- important tradeoffs cannot be evaluated confidently
