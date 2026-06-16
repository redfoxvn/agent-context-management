---
name: acm-memory
description: Use when task findings may need to become durable project memory, feature truth, architecture truth, or decision rationale.
---

# Skill: ACM Memory

## Use For

Promote verified task findings into durable project memory without turning temporary investigation notes into long-lived truth.

## Core Rule

```txt
task docs record what happened
durable docs record what is true now
```

## Memory Layers

| Layer | Purpose | Location |
|---|---|---|
| Task history | Task-local working state and investigation | `.acm/tasks/` |
| Project context | Purpose, goals, important terms, known verification | `.acm/project.md` |
| Feature truth | Current accepted feature behavior and contracts | `.acm/features/` |
| Architecture truth | Stable source maps, boundaries, flows, conventions | `.acm/architecture/` |
| Decision rationale | Why durable choices were made | `.acm/decisions/` |

## Promote When

Promote information only when it is:

- verified by current code, tests, or runtime evidence
- explicitly accepted as intended truth
- stable enough to matter after the task ends
- useful for future onboarding, implementation, review, or decision-making

## Do Not Promote

Do not promote:

- unverified assumptions
- temporary debugging notes
- implementation logs
- local workaround details unless intentionally accepted
- stale historical behavior no longer true
- broad reasoning dumps
- speculative future ideas unless clearly marked draft

## Durable Locations

| Information | Durable Location |
|---|---|
| Current feature behavior | `.acm/features/[feature]/behavior.md` |
| Feature API or interface contracts | `.acm/features/[feature]/api.md` |
| Feature test expectations | `.acm/features/[feature]/test-scenarios.md` |
| Stable architecture constraints | `.acm/architecture/` |
| Durable tradeoffs or rationale | `.acm/decisions/` |
| Project purpose or terminology | `.acm/project.md` |

## ADR Trigger Heuristic

Create or update an ADR when:

- a decision changes architecture boundaries
- multiple valid approaches existed
- the tradeoff will matter in future tasks
- the decision affects security, data integrity, deployment, scaling, or public contracts
- the team is likely to revisit the decision later

Do not create ADRs for local refactors, temporary implementation details, obvious low-impact choices, or task-local preferences.

## Completion Prompt

Before completing a non-trivial task, ask:

- Did verified behavior change?
- Did a stable architecture fact change?
- Was a durable tradeoff accepted?
- Is a recurring confusion now clarified?
- Does any durable doc now contain stale information?

If yes, update the correct durable memory before completion.

## Resources

Feature templates and the ADR template live under this skill's `resources/` directory.
