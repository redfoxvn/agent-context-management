# Handoff

## Current Status
- status: completed
- task classification: docs
- related docs: `AGENTS.md`, `docs/agent/`, `docs/templates/tasks/docs/`
- last updated: 2026-05-05
- overall outcome complete: yes

## Task Summary
Refine task-folder granularity guidance so agents default to one task folder per user outcome and track tightly related multi-part work within that folder.

## What Was Done
- Created task docs.
- Recorded initial scope and plan.
- Updated bootstrap, workflow, context, and handoff docs to prefer one task folder per user outcome.
- Updated docs-task templates to support optional phase/workstream tracking inside one task folder.
- Updated the tasks index.

## Changed Files
| File | Change Summary | Notes |
|---|---|---|
| `docs/tasks/2026-05-05-refine-task-folder-granularity/scope.md` | Added scope. | Completed. |
| `docs/tasks/2026-05-05-refine-task-folder-granularity/plan.md` | Added plan. | Completed. |
| `docs/tasks/2026-05-05-refine-task-folder-granularity/implementation-log.md` | Added implementation log. | Completed. |
| `docs/tasks/2026-05-05-refine-task-folder-granularity/verification.md` | Added verification log. | Verification passed. |
| `docs/tasks/2026-05-05-refine-task-folder-granularity/handoff.md` | Added and completed handoff. | Completed. |
| `AGENTS.md` | Added default task-folder granularity rule. | Bootstrap guidance. |
| `docs/agent/operating-manual.md` | Added proportionality rule against splitting tightly related work into separate task folders. | Operating guidance. |
| `docs/agent/context-policy.md` | Added continuation preference and split criteria. | Context loading guidance. |
| `docs/agent/task-workflow.md` | Added `Task Folder Granularity` section. | Canonical workflow guidance. |
| `docs/agent/session-handoff.md` | Added overall-outcome and phase-status guidance. | Handoff protocol. |
| `docs/templates/tasks/docs/plan.template.md` | Added optional phases/workstreams section. | Template support. |
| `docs/templates/tasks/docs/implementation-log.template.md` | Added optional phase-progress section. | Template support. |
| `docs/templates/tasks/docs/handoff.template.md` | Added overall-outcome and phase-status fields. | Template support. |
| `docs/tasks/index.md` | Added task entry and granularity note. | Task index guidance. |

## Important Context
- The intended policy is "one task folder per user outcome" by default, not one folder per implementation part.
- Split into a new task only when workflow, verification, ship, rollback, risk, or decision boundaries have materially separated.

## Decisions Made
| Decision | Reason | Where Recorded |
|---|---|---|
| Treat this as a docs task. | The change updates workflow/policy docs and templates only. | `plan.md`. |
| Prefer principle-based split criteria. | The workflow should reduce fragmentation without becoming overly rigid. | `plan.md`. |

## Verification
| Check | Command / Method | Result | Notes |
|---|---|---|---|
| Task-folder policy strings | `rg -n "one task folder|logical feature/change|phases or workstreams|overall outcome complete|closely related phases|same user outcome" ...` | passed | Terms appear in the expected docs. |
| Handoff format review | Reviewed protocol and template docs. | passed | Format guidance is aligned. |
| Diff scope review | `git diff --stat -- ...` | passed | Changes stayed within workflow docs, templates, and task records. |

## Known Risks / Issues
- None known.

## Remaining Work
- None for this policy update.

## Phase Status
- Scope and plan: complete
- Workflow and policy docs: complete
- Template support: complete
- Verification and indexing: complete

## Recommended Next Action
1. Use the new rule on the next multi-part feature task and adjust wording only if real usage exposes ambiguity.
