# Tasks Index

## Purpose

This index lists task records, including plans, investigations, verification notes, and handoffs.

Task folders under `docs/tasks/` record work history. Durable feature behavior belongs in `docs/features/`.

---

## Active / Recent Tasks

Use this section as the primary task continuation and routing index.

Update when:
- a non-trivial task starts
- task status changes materially
- a task becomes blocked, handed off, or completed
- a task is no longer operationally relevant

Prefer keeping only active or recently important tasks visible.
Archive or remove stale entries when they no longer help continuation.

| Task | Classification | Status | Last Updated | Notes |
|---|---|---|---|---|

| `[YYYY-MM-DD-task-slug]` | bugfix / feature / migration / ... | in-progress | YYYY-MM-DD | short continuation note |

---

## Active Task Rule

For non-trivial work:

- there should normally be a single clearly active task
- parallel active tasks should be intentional and limited
- blocked tasks should explicitly say why they are blocked
- completed tasks may remain temporarily for continuity, then be removed from the active section

Task folders remain as historical records even after removal from the active list.

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

Templates define structure and section semantics.
Profiles define what each task classification must pay attention to.

See also:

```txt
docs/templates/tasks/README.md
```

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
- Conflicts / Ambiguity
- Decisions / Risks
- Next Action
