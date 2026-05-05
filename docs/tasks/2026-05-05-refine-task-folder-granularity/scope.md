# Documentation Scope

## Summary
Refine agent task-folder guidance so tightly related multi-part work stays in one task folder by default instead of fragmenting into multiple tasks.

## In Scope
- Clarify that one task folder should usually map to one user outcome or one logical feature/change.
- Define when to continue an existing task folder versus create a new one.
- Add guidance for tracking phases or workstreams inside a single task.
- Update handoff guidance so completion reflects the whole outcome, not an individual phase.
- Add lightweight template support for multi-phase task tracking.

## Out of Scope
- Changing task classifications.
- Changing durable feature, architecture, or product behavior outside agent workflow guidance.
- Adding automation that enforces the policy in code.

## Source of Truth
- Owning docs: `AGENTS.md`, `docs/agent/task-workflow.md`, `docs/agent/context-policy.md`, `docs/agent/session-handoff.md`
- Related code/tests, if any: `docs/templates/tasks/docs/`, `docs/tasks/index.md`

## Notes
- This is a documentation-only workflow/policy change.
