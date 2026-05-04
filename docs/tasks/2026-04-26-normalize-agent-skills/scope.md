# Documentation Scope

## Summary
Normalize `docs/agent/skills/` so every skill referenced by `docs/agent/task-workflow.md` has a resolvable `SKILL.md`.

## In Scope
- `docs/agent/skills/index.md`
- `docs/agent/skills/*/SKILL.md`
- `docs/agent/task-workflow.md` if path/convention clarification is needed
- `docs/tasks/index.md`
- Task records for this documentation task

## Out of Scope
- Changing task workflows or classifications
- Adding executable scripts or automation
- Changing templates under `docs/templates/tasks/`
- Product, architecture, or source-code behavior

## Source of Truth
- Owning docs: `docs/agent/task-workflow.md`, `docs/index.md`, `AGENTS.md`
- Related code/tests, if any: N/A, documentation-only task

## Notes
- Use one convention: `docs/agent/skills/<skill-name>/SKILL.md`.
- Keep skill docs procedural and short enough for agent context loading.
