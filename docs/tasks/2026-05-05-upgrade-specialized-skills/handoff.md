# Handoff

## Current Status
- status: completed
- task classification: docs
- related docs: `docs/agent/skills/`
- last updated: 2026-05-05

## Task Summary
Upgrade specialized and remaining non-core reusable skills with `Inputs` and `Completion Criteria`, matching the format already applied to the six core skills.

## What Was Done
- Created task docs.
- Added `Inputs` and `Completion Criteria` to six classification-specific specialized skills.
- Expanded the task and added `Inputs` and `Completion Criteria` to the four remaining non-core reusable skills.
- Ran verification for required sections, file paths, line counts, and diff scope.

## Changed Files
| File | Change Summary | Notes |
|---|---|---|
| `docs/tasks/2026-05-05-upgrade-specialized-skills/plan.md` | Added plan. | Completed. |
| `docs/tasks/2026-05-05-upgrade-specialized-skills/implementation-log.md` | Added implementation log. | Completed. |
| `docs/tasks/2026-05-05-upgrade-specialized-skills/verification.md` | Added verification log. | Verification passed. |
| `docs/tasks/2026-05-05-upgrade-specialized-skills/handoff.md` | Added handoff. | Completed. |
| `docs/tasks/index.md` | Added task index entry. | Completed. |
| `docs/agent/skills/bugfix/SKILL.md` | Added inputs and completion criteria. | Specialized skill. |
| `docs/agent/skills/decision-recording/SKILL.md` | Added inputs and completion criteria. | Remaining non-core skill. |
| `docs/agent/skills/implementation/SKILL.md` | Added inputs and completion criteria. | Remaining non-core skill. |
| `docs/agent/skills/refactor/SKILL.md` | Added inputs and completion criteria. | Specialized skill. |
| `docs/agent/skills/migration/SKILL.md` | Added inputs and completion criteria. | Specialized skill. |
| `docs/agent/skills/performance-optimization/SKILL.md` | Added inputs and completion criteria. | Specialized skill. |
| `docs/agent/skills/security-remediation/SKILL.md` | Added inputs and completion criteria. | Specialized skill. |
| `docs/agent/skills/session-handoff/SKILL.md` | Added inputs and completion criteria. | Remaining non-core skill. |
| `docs/agent/skills/spike-research/SKILL.md` | Added inputs and completion criteria. | Specialized skill. |
| `docs/agent/skills/test-design/SKILL.md` | Added inputs and completion criteria. | Remaining non-core skill. |

## Important Context
- "Specialized skills" was interpreted as the classification-specific skills listed in `docs/agent/task-workflow.md`.
- The task was later expanded to include the four remaining non-core reusable skills: `implementation`, `test-design`, `decision-recording`, and `session-handoff`.

## Decisions Made
| Decision | Reason | Where Recorded |
|---|---|---|
| Target classification-specific skills only. | `docs/agent/task-workflow.md` explicitly groups these as classification-specific skills. | `plan.md`. |
| Expand to remaining non-core reusable skills. | User requested updating the four remaining skills in the existing task. | `implementation-log.md`. |
| Add only `Inputs` and `Completion Criteria`. | Matches the core skill format without changing workflow semantics. | `plan.md`. |

## Verification
| Check | Command / Method | Result | Notes |
|---|---|---|---|
| Required sections | Checked all ten target skills for required sections. | passed | No missing sections reported. |
| Skill paths | Checked all ten target skill files still exist. | passed | No missing files reported. |
| Size review | Counted lines for ten target skills. | passed | Files are 38-40 lines each. |
| Diff review | Reviewed target skill diff. | passed | Only expected section additions. |

## Known Risks / Issues
- None known.

## Remaining Work
- None for current skill-format upgrade.

## Recommended Next Action
1. Review all skill docs together after using the new format in a real task.
