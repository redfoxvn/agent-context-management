# Agent Operating Manual

## Purpose

This file describes the default operating loop for coding agents.

Use it after `AGENTS.md` and `docs/index.md`. For detailed rules, follow the specialized docs:

- context loading: `docs/agent/context-policy.md`
- task workflow: `docs/agent/task-workflow.md`
- tool safety: `docs/agent/tool-policy.md`
- review gate: `docs/agent/review-checklist.md`
- handoff: `docs/agent/session-handoff.md`

---

## Operating Loop

For non-trivial tasks:

1. Classify the task.
2. Load the smallest safe context.
3. Reconcile user request, docs, code, and tests.
4. Create or update task docs.
5. Plan before implementation.
6. Implement minimal, localized changes.
7. Verify with relevant checks.
8. Update durable docs if durable truth changed.
9. Update handoff when needed.
10. Report what changed, what was verified, and what remains risky.

---

## Core Principles

### Do not work from request alone

For non-trivial work, reconcile:

- user request
- relevant docs
- source code
- tests

If these conflict in a behavior-affecting way, stop and report.

### Keep work proportional to risk

Small changes should stay lightweight. Risky changes need stronger context, planning, verification, and handoff.

Do not create verbose task artifacts just to satisfy process.

### Prefer existing patterns

Prefer:

- local changes over broad rewrites
- existing conventions over new patterns
- clear code over clever code
- verified behavior over assumptions

### Preserve durable truth

Use the correct context layer:

- task docs record what happened
- feature docs record what is true now
- architecture docs record durable technical constraints
- decision docs record why important choices were made
- product docs record domain and product meaning

Do not write scratch notes into durable docs.

---

## Planning Standard

Before non-trivial implementation, the plan should state:

- task summary and classification
- affected feature/module
- intended behavior change, or intended non-behavior-change
- affected files/directories or search area
- implementation steps
- verification strategy
- risks, assumptions, and open questions

If the plan becomes invalid, update it before continuing.

---

## Implementation Standard

When editing:

- make the smallest safe change
- follow existing architecture and conventions
- respect module boundaries
- update tests for behavior changes
- do not weaken validation, auth, permissions, error handling, logging, type safety, or tests
- do not introduce dependencies or frameworks without clear justification
- pause and re-plan if scope or risk changes

---

## Completion Standard

Before reporting completion:

- run relevant checks or document why they were not run
- update task docs if a task folder exists
- update durable docs if current truth changed
- update handoff if work is incomplete, risky, long-running, or non-obvious
- use `docs/agent/review-checklist.md` as the final gate

Final responses should state:

- what changed
- what was verified
- what was not verified
- remaining risks or follow-up work
