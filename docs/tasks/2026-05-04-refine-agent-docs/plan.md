# Documentation Plan

## Task Summary
Refine `AGENTS.md`, `docs/index.md`, and `docs/agent/` so each file has a clear role, minimal overlap, and efficient agent-readable instructions.

## Task Classification
docs

## Affected Docs
- `AGENTS.md`
- `docs/index.md`
- `docs/agent/*.md`
- `docs/agent/skills/index.md`
- `docs/tasks/index.md`

## Update Strategy
1. Make `AGENTS.md` a concise bootstrap and hard-rule file.
2. Make `docs/index.md` a routing and source-of-truth map, not a workflow manual.
3. Keep detailed workflow only in `docs/agent/task-workflow.md`.
4. Keep context loading only in `docs/agent/context-policy.md`.
5. Keep completion gate only in `docs/agent/review-checklist.md`.
6. Keep handoff details only in `docs/agent/session-handoff.md`.
7. Expand `failure-modes.md` with context-management-specific failures.

## Verification Strategy
- Search for stale specs-nested path references.
- Check required docs still exist.
- Check key ownership phrases exist in the intended files.
- Review git diff manually.

## Risks, Assumptions, or Open Questions
- This is documentation-only; no source behavior changes are expected.
- Some intentional cross-links will remain; overlap should be reduced, not eliminated entirely.
