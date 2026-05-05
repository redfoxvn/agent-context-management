# Handoff

## Current Status
- status: completed
- task classification: docs
- related docs: `docs/agent/skills/`
- last updated: 2026-05-05

## Task Summary
Upgrade six core skills with inputs and completion criteria so agents can execute them more reliably.

## What Was Done
- Created initial task docs.
- Added `Inputs` and `Completion Criteria` to six core skills.
- Ran verification for required sections and file paths.

## Changed Files
| File | Change Summary | Notes |
|---|---|---|
| `docs/tasks/2026-05-05-upgrade-core-skills/plan.md` | Added plan. | In progress. |
| `docs/tasks/2026-05-05-upgrade-core-skills/implementation-log.md` | Added implementation log. | In progress. |
| `docs/tasks/2026-05-05-upgrade-core-skills/implementation-log.md` | Added implementation log. | Completed. |
| `docs/tasks/2026-05-05-upgrade-core-skills/verification.md` | Added verification log. | Verification passed. |
| `docs/tasks/2026-05-05-upgrade-core-skills/handoff.md` | Added handoff. | Completed. |
| `docs/agent/skills/requirement-analysis/SKILL.md` | Added inputs and completion criteria. | Core skill. |
| `docs/agent/skills/codebase-research/SKILL.md` | Added inputs and completion criteria. | Core skill. |
| `docs/agent/skills/impact-analysis/SKILL.md` | Added inputs and completion criteria. | Core skill. |
| `docs/agent/skills/implementation-planning/SKILL.md` | Added inputs and completion criteria. | Core skill. |
| `docs/agent/skills/verification/SKILL.md` | Added inputs and completion criteria. | Core skill. |
| `docs/agent/skills/documentation-update/SKILL.md` | Added inputs and completion criteria. | Core skill. |

## Important Context
- Target skills: `requirement-analysis`, `codebase-research`, `impact-analysis`, `implementation-planning`, `verification`, `documentation-update`.
- Keep skill docs concise.

## Decisions Made
| Decision | Reason | Where Recorded |
|---|---|---|
| Add `Inputs` and `Completion Criteria`. | Gives agents prerequisites and done signals without overloading workflow. | `plan.md`. |

## Verification
| Check | Command / Method | Result | Notes |
|---|---|---|---|
| Required sections | Checked all six target skills for required sections. | passed | No missing sections reported. |
| Skill paths | Checked all six target skill files still exist. | passed | No missing files reported. |
| Size review | Counted lines for six target skills. | passed | Files are 40-41 lines each. |

## Known Risks / Issues
- None known.

## Remaining Work
- Upgrade specialized skills in a follow-up task if desired.

## Recommended Next Action
1. Apply the same format to specialized skills after validating this format in use.
