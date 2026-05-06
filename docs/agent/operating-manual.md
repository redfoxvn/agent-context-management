# Agent Operating Manual

## Purpose

Compact overview of the default agent loop.

This is optional reference material. For authoritative rules, use:

| Need | Source |
|---|---|
| Context loading | `docs/agent/context-policy.md` |
| Task lifecycle | `docs/agent/task-workflow.md` |
| Tool safety | `docs/agent/tool-policy.md` |
| Completion gate | `docs/agent/review-checklist.md` |
| Handoff | `docs/agent/session-handoff.md` |

---

## Default Loop

For non-trivial work:

1. Classify the task.
2. Load the smallest safe context.
3. Reconcile request, durable docs, code, and tests.
4. Plan the minimal safe change.
5. Implement within existing boundaries and patterns.
6. Verify with relevant checks.
7. Update task or durable docs only when needed.
8. Report changes, verification, gaps, and risks.

---

## Operating Principles

- Prefer maps over long procedures.
- Prefer source-of-truth routing over duplicated detail.
- Prefer targeted context over broad reading.
- Prefer existing patterns over new abstractions.
- Prefer explicit gaps over false certainty.

Stop when expected behavior, ownership, safety impact, or verification is materially unclear.
