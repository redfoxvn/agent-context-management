---
name: acm-memory
description: Use when task findings may need to become durable project memory, feature truth, architecture truth, or decision rationale.
---

# Skill: ACM Memory

## Use For

Promote verified task findings into durable project memory without turning temporary investigation notes into long-lived truth.

## When NOT To Use

Do not use this skill to store:

- implementation logs
- temporary debugging notes
- speculative ideas
- unverified source observations
- one-off task-local decisions

## Core Rule

```txt
task docs record what happened
durable docs record what is true now
```

## Iron Law

```txt
NO PROMOTION WITHOUT VERIFICATION OR EXPLICIT ACCEPTANCE
```

Durable memory must be:
- Verified by current code, tests, or runtime evidence
- Explicitly accepted as intended truth by the user
- Stable enough to matter after the task ends

Unverified assumptions stay in task records. Task docs record what happened. Durable docs record what is true now.

**Violating the letter of this rule is violating the spirit of ACM.**

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

## Promotion Decision Flow

```
Verified by code/tests/runtime?
├── NO → Keep in task record only
└── YES → Explicitly accepted as truth?
          ├── NO → Keep in task record only
          └── YES → Stable after task ends?
                    ├── NO → Keep in task record only
                    └── YES → Useful for future work?
                              ├── NO → Keep in task record only
                              └── YES → Promote to durable memory
                                        │
                                        └── Architecture boundary or durable tradeoff?
                                            ├── YES → Also consider ADR
                                            └── NO → Done
```

**When in doubt, keep in task record.** Promotion is for verified, stable, useful facts.

## Common Rationalizations

| Rationalization | Reality |
|---|---|
| “This might help later” | Future usefulness is not enough; durable memory must be verified or accepted. |
| “The task notes already say it” | Task notes are history, not current truth. Promote verified durable facts. |
| “The code currently behaves this way” | Current behavior is not always intended behavior. Reconcile with tests/docs/user intent. |
| “I should document everything now” | Document only stable facts that help future work. |

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

## Examples

### Example 1: Promotion Decision

**Task finding:** "The auth middleware checks JWT expiry at 30 minutes"

**Promote?**
- ✅ Verified by: `src/middleware/auth.ts:45`
- ✅ Stable: unlikely to change frequently
- ✅ Useful: future auth work needs this
- **Decision:** Promote to `.acm/architecture/auth.md`

**Task finding:** "Tried 3 approaches, approach B worked"

**Promote?**
- ❌ Implementation log, not durable truth
- **Decision:** Keep in task record only

**Task finding:** "The bug was caused by a race condition in token generation"

**Promote?**
- ❌ Historical debugging detail
- ✅ But: "Token generation must be awaited" is durable
- **Decision:** Promote the durable fact, not the debugging story

### Example 2: ADR Decision

**Task finding:** "We chose PostgreSQL over MongoDB for the main database"

**Create ADR?**
- ✅ Architecture boundary decision
- ✅ Multiple valid approaches existed
- ✅ Tradeoff will matter in future tasks
- ✅ Affects data model, queries, scaling
- **Decision:** Create `.acm/decisions/2026-06-17-database-choice.md`

**Task finding:** "We used camelCase for variable names"

**Create ADR?**
- ❌ Convention, not architecture boundary
- ❌ Obvious from code inspection
- **Decision:** Document in `.acm/project.md` conventions, no ADR needed

## Red Flags - STOP and Verify

Stop when you notice:

- "This might help later" without verification
- "The task notes already say it" without promoting
- "The code currently behaves this way" without checking if it's intended
- "I should document everything now" without filtering
- Promoting unverified assumptions
- Promoting temporary debugging notes
- Promoting stale historical behavior
- Creating ADRs for trivial decisions
- Skipping verification before promotion

**ALL of these mean: STOP. Verify evidence. Check if promotion is warranted.**

## Completion Prompt

Before completing a non-trivial task, ask:

- Did verified behavior change?
- Did a stable architecture fact change?
- Was a durable tradeoff accepted?
- Is a recurring confusion now clarified?
- Does any durable doc now contain stale information?

If yes, update the correct durable memory before completion.

## Verification Checklist

Before promoting memory:

- source of truth is identified
- evidence is current
- behavior is verified or explicitly accepted
- location is correct
- no scratch reasoning is copied
- indexes are updated when new durable docs are created

## Resources

Feature templates and the ADR template live under this skill's `resources/` directory.
