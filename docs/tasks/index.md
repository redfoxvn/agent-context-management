# Tasks Index

## Purpose

This index lists task records, including plans, investigations, verification notes, and handoffs.

Task folders under `docs/tasks/` record work history. Durable feature behavior belongs in `docs/features/`.

---

## Active / Recent Tasks

| Task | Classification | Status | Notes |
|---|---|---|---|
| `2026-05-06-write-readme` | `docs` | completed | Added root `README.md` describing the framework purpose, context layers, workflow model, and adoption guidance. |

---

## Task Folder Rule

Create a folder:

```txt
docs/tasks/[YYYY-MM-DD-task-slug]/
```

Default to the smallest artifact set that preserves task state safely.

### Minimal

```txt
task.md
```

### Standard

```txt
task.md
verification.md
```

### Handoff / Risky

```txt
task.md
plan.md
verification.md
handoff.md
```

Prefer a single `task.md` unless splitting improves continuation, review, or verification.

Use the matching template under `docs/templates/tasks/[task-classification]/` when available.

---

## `task.md` Guideline

Use only sections that add value.

Common sections:

- Status
- Request / Goal
- Classification
- Scope / Non-goals
- Context / Findings
- Plan
- Changes
- Verification
- Decisions / Risks
- Next Action
