# Task Templates

## Purpose

This directory defines the reusable task artifact contracts used by coding agents.

Templates are not only section lists. They define:

- artifact structure
- section purpose
- write conditions
- readiness or done criteria
- minimum quality expectations for continuation and review

Use these templates to reduce model-dependent interpretation when agents create or update task records.

---

## Files

| File | Role | Use When |
|---|---|---|
| `task.template.md` | Base task artifact contract | creating or updating the primary task record |
| `verification.template.md` | Verification evidence contract | verification needs a separate artifact or more detail than `task.md` |
| `handoff.template.md` | Continuation contract | work is incomplete, risky, partially verified, blocked, or hard to reconstruct |
| `profiles/[classification].md` | Classification-specific readiness overlay | task type changes what context, risks, or evidence matter most |

---

## Mental Model

```txt
Task template       = common task structure and section semantics
Verification        = evidence that work was checked intentionally
Handoff             = state transfer for another session or agent
Task profile        = classification-specific attention and readiness
Task workflow       = lifecycle and routing rules
```

Templates define the shape and writing contract.
Profiles define what each task classification must pay attention to.
Workflow decides when to create or update each artifact.

---

## Base Task Template

Use `task.template.md` as the default starting point for non-trivial tasks.

The instantiated task artifact should answer:

- What is the requested outcome?
- What is in scope and out of scope?
- What context was read or discovered?
- What plan is safe enough to execute?
- What changed?
- What was verified?
- What conflicts or ambiguity remain?
- What decisions or risks matter?
- What is the next action?

Use only sections that add value. Do not create verbose task docs just to satisfy a template.

---

## Verification Template

Use `verification.template.md` when verification needs more structure than the verification section in `task.md`.

Good candidates:

- risky implementation work
- multiple verification commands
- partial or blocked verification
- migration, security, performance, or compatibility work
- work that needs reviewer-visible evidence

Verification should report actual checks, skipped checks, failures, and residual risk. Do not claim verification that was not performed.

---

## Handoff Template

Use `handoff.template.md` when a future session or another agent needs enough state to continue safely.

Good candidates:

- incomplete tasks
- blocked work
- long-running or multi-phase changes
- partially verified work
- tasks with assumptions, decisions, or residual risk
- work difficult to reconstruct from the diff alone

A useful handoff is short, concrete, path-oriented, and explicit about next action.

---

## Profiles

Profiles are not standalone task templates.

They provide classification-specific guidance such as:

- additional required context
- definition of ready
- common mistakes
- special verification or risk attention

Use profiles together with `task.template.md`.

Example:

```txt
bugfix task = task.template.md + profiles/bugfix.md
migration task = task.template.md + profiles/migration.md
security task = task.template.md + profiles/security.md
```

---

## Anti-Bloat Rules

- Do not copy every possible section if it does not help execution, review, or continuation.
- Do not duplicate profile guidance inside the task unless it affects the concrete task.
- Do not promote unverified task findings into durable docs.
- Do not use handoff as the only place to store final feature behavior.
- Do not turn verification notes into long command logs unless the details matter.

## Task Artifact Principle

Task artifacts preserve working state. They should not become durable project truth by accident.

Use `acm-memory` to promote verified findings into `.acm/features/`, `.acm/architecture/`, `.acm/decisions/`, or `.acm/project.md`.

---

## Agent Usage

For non-trivial tasks, agents should:

1. Classify the task using `skills/acm-task/SKILL.md`.
2. Create or update a task folder under `.acm/tasks/`.
3. Use `task.template.md` for the primary task artifact.
4. Apply the matching task profile for readiness and risk attention.
5. Add `verification.md` only when separate verification evidence improves clarity.
6. Add `handoff.md` when continuation state is needed.
7. Promote verified durable truth to the correct durable docs after verification.
