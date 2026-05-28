# Agent Failure Modes

## Purpose

Compact reference for common coding-agent mistakes.

This file is optional reminder material, not mandatory workflow.

---

## Common Failures

| Failure | Prevention |
|---|---|
| Working from the user request alone | Reconcile request, durable docs, code, and tests |
| Over-reading context | Stop when a safe plan is possible |
| Treating task notes as current truth | Durable truth lives in `.acm/features/`, `.acm/architecture/`, and `.acm/product/` |
| Promoting unverified notes | Promote only verified current truth |
| Refactoring across boundaries too early | Prefer localized changes unless broader change is required |
| Weakening validation or security | Preserve server-side validation, auth, permissions, and data integrity |
| Editing generated files manually | Update the source schema/config and regenerate |
| Verifying only mocks or implementation details | Prefer observable behavior and regression coverage |
| Ignoring compatibility or rollback risk | Check compatibility for API, auth, database, migration, and public contracts |
| Claiming verification not run | Report actual checks only |
| Missing handoff | Update `handoff.md` for incomplete, risky, or partially verified work |
| Leaving indexes stale | Update indexes when important docs are added, renamed, or deprecated |
| Hiding residual risk | Report skipped checks, blockers, assumptions, and remaining risks explicitly |

---

## Use This File When

- reviewing risky work
- debugging repeated agent mistakes
- refining agent behavior
- performing final self-review
