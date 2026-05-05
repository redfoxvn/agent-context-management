# Tasks Index

## Purpose

This index lists task records, including plans, investigations, verification notes, and handoffs.

Task folders under `docs/tasks/` record work history. Durable feature behavior belongs in `docs/features/`.

## Active / Recent Tasks

| Task | Classification | Status | Notes |
|---|---|---|---|
| `2026-05-05-refine-task-folder-granularity` | docs | completed | Refined workflow guidance to prefer one task folder per user outcome and track related phases inside it. |

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
