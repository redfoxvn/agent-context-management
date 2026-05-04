# Documentation Scope

## Summary
Add missing task templates for classifications already defined in `docs/agent/task-workflow.md`.

## In Scope
- `docs/templates/tasks/migration/`
- `docs/templates/tasks/performance/`
- `docs/templates/tasks/security/`
- `docs/templates/tasks/test-improvement/`
- `docs/templates/tasks/spike/`
- `docs/tasks/index.md`
- Task records for this documentation task

## Out of Scope
- Skill file normalization
- Changing task classification names
- Changing workflow semantics
- Filling product, architecture, or feature docs

## Source of Truth
- Owning docs: `docs/agent/task-workflow.md`, `AGENTS.md`, `docs/index.md`
- Related code/tests, if any: N/A, documentation-only task

## Notes
- Templates should remain concise and scaffold-like.
- Each new classification should include `plan`, `implementation-log` where execution work is expected, `verification`, and `handoff` to satisfy general task rules.
