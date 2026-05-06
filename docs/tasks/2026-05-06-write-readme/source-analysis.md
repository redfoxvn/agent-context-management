# Source Analysis

## Sources Checked
| Source | Reason Checked | Finding |
|---|---|---|
| `AGENTS.md` | Confirm bootstrap and non-trivial task rules | README should not contradict mandatory repo rules. |
| `docs/index.md` | Confirm context layers and source-of-truth mapping | Repo is organized around durable docs vs task docs. |
| `docs/agent/operating-manual.md` | Confirm default operating loop | README should summarize the agent workflow at a high level. |
| `docs/agent/context-policy.md` | Confirm context-loading model | README should emphasize progressive context loading. |
| `docs/agent/task-workflow.md` | Confirm classifications and artifacts | README should summarize workflow, skills, and templates accurately. |
| `docs/features/index.md` | Confirm feature-doc status | No feature docs exist yet. |
| `docs/tasks/index.md` | Confirm task-index status | No task folders are currently listed in the index. |

## Conflicts Found
- None in the checked durable docs.

## Assumptions
- README should target both repo maintainers and users who want to adopt this framework in another project.
- README should be in English because the repo's durable documentation is in English.

## Notes
- The repository currently contains framework docs and templates, not application source code.
