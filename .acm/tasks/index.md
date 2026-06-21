# Tasks Index

## Purpose

Task folders record task-scoped working state, investigations, verification, and handoffs.

Task history is not durable feature truth. Promote verified current behavior or durable decisions through the ACM memory workflow when needed.

## Active / Recent Tasks

| Task | Classification | Status | Last Updated | Notes |
|---|---|---|---|---|
| `2026-06-21-acm-reliability-fixes` | refactor + docs | completed | 2026-06-21 | Converted 3 behaviors (task record, definition-of-done, stop-on-conflict) into hard gates after the team-tasks eval showed skills don't self-trigger; SessionStart hook now injects a binding operating contract; enforce `.acm/features/` promotion + git save-point nudge. |
| `2026-06-20-acm-review-fixes` | docs + refactor | completed | 2026-06-20 | Fixed broken metadata validator, stale/dangling skill refs, orphaned templates, and added Red Flags/Rationalizations/Examples to high-risk skills; added routing table, adversarial-review actuation, and MIT LICENSE. |
| `2026-06-17-strengthen-acm-skills` | migration | completed | 2026-06-17 | Strengthens ACM skills using patterns from Superpowers and agent-skills while preserving the hybrid model. |
| `2026-06-16-skill-driven-acm-migration` | migration | in-progress | 2026-06-16 | Migrates ACM from copied workflow docs to root-level skills plus minimal project memory. |
| `2026-05-28-rename-docs-root` | docs | completed | 2026-05-28 | Renamed the agent context root from `docs/` to `.acm/` and updated path references. |

## Task Folder Rule

Use:

```txt
.acm/tasks/[YYYY-MM-DD-task-slug]/
```

Default to the smallest artifact set that preserves task state safely. Use `skills/acm-task/resources/` for templates and profiles when useful.
