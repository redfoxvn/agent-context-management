# Verification

## Checks
| Check | Command / Method | Result | Notes |
|---|---|---|---|
| Task-folder policy strings | `rg -n "one task folder|logical feature/change|phases or workstreams|overall outcome complete|closely related phases|same user outcome" AGENTS.md docs/agent/operating-manual.md docs/agent/context-policy.md docs/agent/task-workflow.md docs/agent/session-handoff.md docs/templates/tasks/docs/plan.template.md docs/templates/tasks/docs/implementation-log.template.md docs/templates/tasks/docs/handoff.template.md docs/tasks/index.md` | passed | New policy terms appear in the expected governing docs and templates. |
| Handoff format review | Reviewed `docs/agent/session-handoff.md` and `docs/templates/tasks/docs/handoff.template.md`. | passed | Protocol doc and template both include overall-outcome and phase-status guidance. |
| Diff scope review | `git diff --stat -- AGENTS.md docs/agent/operating-manual.md docs/agent/context-policy.md docs/agent/task-workflow.md docs/agent/session-handoff.md docs/templates/tasks/docs/plan.template.md docs/templates/tasks/docs/implementation-log.template.md docs/templates/tasks/docs/handoff.template.md docs/tasks/index.md docs/tasks/2026-05-05-refine-task-folder-granularity` | passed | Changes are limited to policy docs, templates, and this task record. |

## Consistency Review
- Bootstrap, workflow, context, handoff, and docs-task template guidance now agree on the default rule: one task folder per user outcome or logical feature/change.
- The new guidance distinguishes internal phases from real task boundaries without changing task classifications.

## Not Verified
- No runtime tests were run because this is a documentation-only change.

## Conclusion
- [x] Verified
- [ ] Not fully verified
