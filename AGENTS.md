# AGENTS.md

## Purpose

This is the bootstrap file for coding agents working in this repository.

`.acm/` means Agent Context Management. Keep this file short. Detailed context loading, workflow, tool safety, review, and handoff rules live under `.acm/agent/`.

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

## Read Path

For non-trivial tasks, read in this order:

1. `.acm/index.md`
2. `.acm/agent/context-policy.md`
3. `.acm/agent/task-workflow.md`
4. Relevant docs, source code, and tests identified by those files

Read conditionally:

- `.acm/agent/tool-policy.md` before risky commands or mutating tools
- `.acm/agent/review-checklist.md` before reporting completion
- `.acm/agent/session-handoff.md` when continuing or preserving incomplete/risky work
- relevant `.acm/agent/skills/*/SKILL.md` only when the task needs that procedure

Optional references:

- `.acm/agent/operating-manual.md` for the default operating loop overview
- `.acm/agent/failure-modes.md` for common agent mistakes and reminders

For trivial edits, use judgment and keep changes minimal.

---

## Non-Trivial Task Rules

For non-trivial tasks:

- Classify the task using `.acm/agent/task-workflow.md`.
- Create or update a task folder under `.acm/tasks/[YYYY-MM-DD-task-slug]/`.
- Prefer one task folder per user outcome or logical feature/change; track tightly related phases inside that folder unless there is a real boundary that requires a separate task.
- Create a concise plan before implementation.
- Record verification in the task folder.
- Update durable docs only when durable truth changes.
- Update `handoff.md` when work is incomplete, risky, long-running, or non-obvious.

Use base templates from `.acm/templates/tasks/*.template.md` for artifact structure.
Use task profiles from `.acm/templates/tasks/profiles/[classification].md` for classification-specific attention.

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
