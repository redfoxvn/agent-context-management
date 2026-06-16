# Tasks Index

## Purpose

Task folders record task-scoped working state, investigations, verification, and handoffs.

Task history is not durable feature truth. Promote verified current behavior or durable decisions through the ACM memory workflow when needed.

## Active / Recent Tasks

| Task | Classification | Status | Last Updated | Notes |
|---|---|---|---|---|
| `2026-06-16-skill-driven-acm-migration` | migration | in-progress | 2026-06-16 | Migrates ACM from copied workflow docs to root-level skills plus minimal project memory. |
| `2026-05-28-rename-docs-root` | docs | completed | 2026-05-28 | Renamed the agent context root from `docs/` to `.acm/` and updated path references. |

## Task Folder Rule

Use:

```txt
.acm/tasks/[YYYY-MM-DD-task-slug]/
```

Default to the smallest artifact set that preserves task state safely. Use `skills/acm-task/resources/` for templates and profiles when useful.
