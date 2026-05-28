# Memory Policy

## Purpose

Define how working context becomes durable project knowledge.

Coding agents should not treat all discovered information as long-term truth.
This policy defines:

- what belongs only in task history
- what should become durable docs
- when information is safe to discard
- when a durable decision record is needed

The goal is to reduce:

- stale context
- duplicated knowledge
- accidental promotion of assumptions
- task-history leakage into durable docs

---

## Memory Layers

| Layer | Purpose | Lifetime |
|---|---|---|
| Scratch reasoning | temporary thinking during execution | disposable |
| Task history | task-local working state and investigation | until task is no longer useful |
| Durable feature truth | current accepted system behavior | long-lived |
| Durable decision rationale | why important choices were made | long-lived |

---

## Promotion Model

```txt
scratch reasoning
    ↓
task findings and investigation
    ↓
verified or accepted truth
    ↓
durable docs or ADRs
```

Do not promote information directly from temporary reasoning into durable docs.

---

## What Belongs In Task History

Keep in `.acm/tasks/`:

- temporary investigation notes
- implementation progress
- debugging paths
- partial findings
- speculative hypotheses
- intermediate plans
- blocked attempts
- session-local reasoning
- incomplete verification

Task history explains what happened during work.
It is not the source of truth for long-term system behavior.

---

## What Belongs In Durable Docs

Promote into durable docs only when information is:

- verified
- accepted intended behavior
- stable enough to matter after the task ends
- useful for future onboarding, implementation, or review

Examples:

| Information | Durable Location |
|---|---|
| Current feature behavior | `.acm/features/` |
| Stable architecture constraints | `.acm/architecture/` |
| Durable tradeoffs or rationale | `.acm/decisions/` |
| Product/domain meaning | `.acm/product/` |

---

## Promotion Triggers

Consider promotion after:

- verification passes
- intended behavior is confirmed
- architecture boundaries change
- a durable tradeoff is accepted
- a new stable subsystem appears
- feature behavior changes materially
- a recurring source of confusion is clarified

---

## Do Not Promote

Do not promote:

- unverified assumptions
- temporary debugging notes
- implementation logs
- local workaround details unless intentionally accepted
- stale historical behavior no longer true
- broad reasoning dumps
- speculative future ideas unless clearly marked draft

---

## ADR Trigger Heuristic

Create or update an ADR when:

- a decision changes architecture boundaries
- the tradeoff will matter in future tasks
- multiple valid approaches existed
- the decision affects security, data integrity, deployment, or scaling
- the team is likely to revisit the decision later

Do not create ADRs for:

- local refactors
- temporary implementation details
- obvious low-impact choices

---

## Task Completion Rule

Before completing a non-trivial task, agents should ask:

- Did any verified behavior change?
- Did any stable architecture fact change?
- Was a durable tradeoff accepted?
- Is any recurring confusion now clarified?
- Does any durable doc now contain stale information?

If yes:
- update the correct durable docs
- update or create ADRs when needed
- avoid leaving durable truth only inside task history

---

## Anti-Patterns

Avoid:

- treating task notes as permanent truth
- copying investigation notes into durable docs
- storing the same knowledge in multiple durable locations
- leaving accepted behavior only inside handoff artifacts
- creating ADRs for every implementation choice
- promoting reasoning without verification
