# Plan

## Task Summary
Align repository context documentation on the canonical `docs/features/` and `docs/tasks/` layout.

## Task Classification
docs

## Affected Features or Modules
- Agent bootstrap instructions
- Documentation router
- Task and feature context locations
- Agent compatibility entrypoints

## Affected Files or Directories
- `AGENTS.md`
- `docs/README.md`
- `docs/index.md`
- `docs/features/`
- `docs/tasks/`
- `CLAUDE.md`

## Expected Behavior Changes
- Coding agents should use `docs/features/` for durable feature truth.
- Coding agents should use `docs/tasks/` for task artifacts and handoffs.
- No references should route agents to the previous `specs`-nested feature or task layout.
- Claude Code should be able to load the shared bootstrap instructions through `CLAUDE.md`.

## Test Strategy
- Search for stale references to the previous `specs`-nested layout.
- Check key docs for path consistency.
- Verify task and feature index files exist.

## Risks, Assumptions, or Open Questions
- The `docs` task template did not exist at task start, so this task initially used the minimal common artifacts required by `AGENTS.md`.
- Broader missing-template and missing-skill cleanup is related but out of scope for this path-alignment pass.
