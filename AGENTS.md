# AGENTS.md

## Purpose

This is the bootstrap file for coding agents working in this repository.

Keep this file short. Detailed workflow, context loading, tool safety, review, and handoff rules live under `docs/agent/`.

---

## Core Rule

Do not make non-trivial code changes from the user request alone.

Before planning or implementing non-trivial work, reconcile:

1. User request
2. Relevant durable docs
3. Current source code
4. Relevant tests

If these sources conflict in a behavior-affecting way, stop and report the conflict.

---

## Required Entry Points

For non-trivial tasks, read in this order:

1. `docs/index.md`
2. `docs/agent/operating-manual.md`
3. `docs/agent/context-policy.md`
4. `docs/agent/task-workflow.md`
5. Relevant docs, source code, and tests identified by those files

For trivial edits, use judgment and keep changes minimal.

---

## Non-Trivial Task Rules

For non-trivial tasks:

- Classify the task using `docs/agent/task-workflow.md`.
- Create or update a task folder under `docs/tasks/[YYYY-MM-DD-task-slug]/`.
- Create a concise plan before implementation.
- Record verification in the task folder.
- Update durable docs only when durable truth changes.
- Update `handoff.md` when work is incomplete, risky, long-running, or non-obvious.

Use templates from `docs/templates/tasks/[task-classification]/` when available.

---

## Safety Rules

Never silently:

- Choose between conflicting docs/code/tests when behavior, API, data, security, auth, billing, or architecture is affected.
- Weaken validation, authorization, authentication, error handling, logging, type safety, or tests.
- Remove tests unless obsolete and documented.
- Discard or overwrite unrelated user work.
- Claim verification that was not actually performed.

---

## Stop Conditions

Stop and ask for clarification when:

- Expected behavior is ambiguous.
- Docs conflict with code or tests in a behavior-affecting way.
- The change may affect security, billing, authentication, authorization, data integrity, or public API behavior.
- The task requires deleting or rewriting large parts of the system.
- There is no reliable way to verify the change.
- Implementation would require assumptions that affect product behavior.

When stopping, report:

1. What is unclear or conflicting
2. Which sources conflict
3. Why it matters
4. Recommended options
