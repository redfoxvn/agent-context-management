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

Before reporting decision recording complete:

### Decision Fit

- [ ] Decision is accepted, not merely proposed
- [ ] Durable record is warranted by future impact, not local trivia
- [ ] Task note is used instead of ADR when the choice is local or obvious
- [ ] Decision scope and affected docs are identified

### Rationale

- [ ] Constraints and context recorded
- [ ] Alternatives considered and summarized
- [ ] Tradeoffs and consequences documented
- [ ] Reversibility and follow-up work noted

### Placement

- [ ] Decision stored in the correct durable location
- [ ] Related task, feature, architecture, or product docs linked
- [ ] Decisions index updated when an ADR is added
- [ ] No project-specific truth is duplicated into reusable skills

### Evidence

- [ ] Evidence inspected is recorded
- [ ] Human or stakeholder acceptance recorded when needed
- [ ] Unresolved questions or residual risks documented
- [ ] Checks skipped are recorded with reasons

## Common Mistakes

Avoid:

- creating ADRs for every implementation choice
- recording decisions before the choice is accepted
- omitting alternatives and consequences
- storing durable rationale only in handoff notes

## Related Skills

- **acm-memory**: Promote accepted durable truth into project memory
- **acm-task**: Keep uncertain or task-local decisions in task records
- **impact-analysis**: Identify whether the decision has durable impact
- **acm-adversarial-review**: Challenge high-stakes choices before recording
- **context-engineering**: Preserve enough context for future agents without dumping reasoning

## Stop Conditions

- decision impact is long-lived or architectural
- multiple viable directions remain unresolved
- important tradeoffs cannot be evaluated confidently
