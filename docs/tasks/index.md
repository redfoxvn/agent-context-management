# Tasks Index

## Purpose

This index lists task records, including plans, investigations, verification notes, and handoffs.

Task folders under `docs/tasks/` record work history. Durable feature behavior belongs in `docs/features/`.

---

## Active / Recent Tasks

| Task | Classification | Status | Notes |
|---|---|---|---|

No task docs have been added yet

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

---

## Templates And Profiles

Use templates for artifact structure:

| Artifact | Template |
|---|---|
| Task state | `docs/templates/tasks/task.template.md` |
| Separate verification | `docs/templates/tasks/verification.template.md` |
| Separate handoff | `docs/templates/tasks/handoff.template.md` |

Use profiles for classification-specific attention:

```txt
docs/templates/tasks/profiles/[classification].md
```

Templates define structure. Profiles define what each task classification must pay attention to.

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
