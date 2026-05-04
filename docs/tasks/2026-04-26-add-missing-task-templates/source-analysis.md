# Source Analysis

## Sources Checked
| Source | Reason Checked | Finding |
|---|---|---|
| `AGENTS.md` | Bootstrap task artifact rules. | Non-trivial tasks need task folders; implementation tasks should include plan, implementation log, verification, and handoff. |
| `docs/index.md` | Canonical write locations. | Templates belong under `docs/templates/tasks/[task-classification]/`; task records belong under `docs/tasks/`. |
| `docs/agent/task-workflow.md` | Classification and artifact source. | `migration`, `performance`, `security`, `test-improvement`, and `spike` are defined but their template directories were missing. |
| Existing task templates | Style and structure reference. | Existing templates are concise markdown skeletons with section headings and placeholders. |

## Conflicts Found
- `task-workflow.md` used some classification-specific plan labels, while `AGENTS.md` generally expects `plan.md` for implementation tasks.

## Assumptions
- Use `plan.template.md` as the common implementation plan artifact and include classification-specific sections inside that file.
- Add extra specialized templates only when they capture distinct information, such as rollback plans, baselines, threat analysis, or spike recommendations.

## Notes
- This task does not update skill definitions, even though several skills referenced by workflow remain missing or empty.
