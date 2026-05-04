# Handoff

## Current Status
- status: completed
- task classification: docs
- related feature/module: agent context framework
- last updated: 2026-04-26

## Task Summary
Align the repository's context-management docs on `docs/features/` and `docs/tasks/` as the canonical feature and task locations.

## What Was Done
- Created this task folder and initial plan.
- Replaced stale feature/task path references with `docs/features/` and `docs/tasks/`.
- Added feature and task index files.
- Added `CLAUDE.md` for Claude Code compatibility.
- Added minimal `docs` task templates.

## Changed Files
| File | Change Summary | Notes |
|---|---|---|
| `docs/tasks/2026-04-26-align-docs-paths/plan.md` | Added task plan. | Started from minimal docs-task structure; a docs template now exists for future tasks. |
| `docs/tasks/2026-04-26-align-docs-paths/implementation-log.md` | Added implementation log. | Updated with completed steps. |
| `docs/tasks/2026-04-26-align-docs-paths/verification.md` | Added verification log. | Verification passed for path alignment. |
| `docs/tasks/2026-04-26-align-docs-paths/handoff.md` | Added handoff. | Updated during implementation. |
| `AGENTS.md` | Updated canonical feature/task paths. | Uses `docs/features/` and `docs/tasks/`. |
| `docs/README.md` | Updated conceptual examples to use canonical paths. | Still needs broader cleanup in a later pass. |
| `docs/index.md` | Fixed code fence and retained canonical paths. | Router remains source of truth for path layout. |
| `docs/features/index.md` | Added feature index. | No feature docs yet. |
| `docs/tasks/index.md` | Added task index. | Lists this task. |
| `CLAUDE.md` | Added Claude Code entrypoint. | Imports `AGENTS.md`. |
| `docs/templates/tasks/docs/` | Added minimal docs-task templates. | Supports workflow references. |

## Important Context
- The user explicitly selected `docs/features/` and `docs/tasks/` as canonical paths.
- `AGENTS.md` was outdated and has been updated to match `docs/index.md`.

## Decisions Made
| Decision | Reason | Where Recorded |
|---|---|---|
| Use `docs/features/` and `docs/tasks/` as canonical paths. | User selected this layout and it matches `docs/index.md`. | This handoff and task plan. |
| Add `CLAUDE.md` importing `AGENTS.md`. | Claude Code needs a Claude-specific project instruction entrypoint. | `CLAUDE.md`. |

## Verification
| Check | Command / Method | Result | Notes |
|---|---|---|---|
| Stale path search | Targeted `rg` search for obsolete specs-nested path variants across `AGENTS.md`, `CLAUDE.md`, and `docs/`. | passed | No matches. |
| Required files present | `test -f docs/features/index.md && test -f docs/tasks/index.md && test -f CLAUDE.md && test -d docs/templates/tasks/docs` | passed | Required files exist. |
| Canonical path spot check | `rg -n "docs/features/|docs/tasks/" AGENTS.md docs/index.md docs/agent/context-policy.md docs/agent/session-handoff.md docs/README.md` | passed | Canonical paths appear in expected routing docs. |
| Docs task template check | `rg -n "docs/templates/tasks/docs/" docs/agent/task-workflow.md && test -d docs/templates/tasks/docs` | passed | Workflow references a template path that now exists. |
| Malformed code fence check | `rg -n '\`\`\`\`' docs/index.md docs/README.md docs/agent/task-workflow.md` | passed | No four-backtick fence found in checked routing docs. |

## Known Risks / Issues
- Missing task templates for classifications other than `docs`, `bugfix`, `change-feature`, `new-feature`, and `refactor` remain out of scope.
- Missing or empty skill docs remain out of scope.

## Remaining Work
- Consider a follow-up task for missing templates and skill normalization.

## Recommended Next Action
1. Start a follow-up cleanup for missing non-doc templates and skill normalization.
