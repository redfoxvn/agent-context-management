# Tasks Index

## Purpose

This index lists task records, including plans, investigations, verification notes, and handoffs.

Task folders under `docs/tasks/` record work history. Durable feature behavior belongs in `docs/features/`.

## Active / Recent Tasks

| Task | Classification | Status | Notes |
|---|---|---|---|
| `2026-05-05-upgrade-specialized-skills` | docs | completed | Upgraded specialized and remaining non-core reusable skills with inputs and completion criteria. |
| `2026-05-05-upgrade-core-skills` | docs | completed | Upgraded six core skills with inputs and completion criteria. |
| `2026-05-05-add-skill-usage-by-phase` | docs | completed | Added recommended skill usage by workflow phase. |
| `2026-05-04-refine-agent-docs` | docs | completed | Refined core agent docs for clearer roles and less overlap. |
| `2026-04-26-normalize-agent-skills` | docs | completed | Normalized agent skill docs and skill path convention. |
| `2026-04-26-add-missing-task-templates` | docs | completed | Added missing task templates for remaining workflow classifications. |
| `2026-04-26-align-docs-paths` | docs | completed | Aligned canonical context paths on `docs/features/` and `docs/tasks/`. |

## When Adding a Task Folder

Create a folder:

```txt
docs/tasks/[YYYY-MM-DD-task-slug]/
```

Common files:
- `plan.md`
- `implementation-log.md`
- `verification.md`
- `handoff.md`

Use the matching template under `docs/templates/tasks/[task-classification]/` when available. Keep artifacts proportional to task risk and complexity.
