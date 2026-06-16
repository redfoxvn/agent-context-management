# AGENTS.md

## Purpose

This is the bootstrap file for coding agents working in this repository.

`.acm/` means Agent Context Management. Keep this file short. Reusable workflow lives in root-level `skills/`; project-specific memory lives in `.acm/`.

---

## Core Rule

Do not make non-trivial changes from the user request alone.

Before planning or implementing non-trivial work, reconcile:

1. User request
2. Relevant durable project memory
3. Current source code or documentation
4. Relevant tests or verification evidence

If these sources conflict in a behavior-affecting way, stop and report the conflict.

---

## Read Path

For non-trivial tasks, read in this order:

1. `.acm/index.md`
2. `.acm/project.md`
3. Relevant task, feature, architecture, decision, source, and test files
4. Relevant skills from `skills/`

Use core ACM skills when applicable:

- `skills/acm-task/SKILL.md` for task classification, context loading, task records, and stop conditions
- `skills/acm-memory/SKILL.md` for durable memory promotion
- `skills/acm-completion/SKILL.md` before reporting completion
- `skills/acm-handoff/SKILL.md` when work is incomplete, risky, long-running, or non-obvious
- `skills/acm-init/SKILL.md` when initializing ACM in another repository
- `skills/acm-skill-authoring/SKILL.md` when creating, editing, or validating ACM skills

For trivial edits, use judgment and keep changes minimal.

---

## Non-Trivial Task Rules

For non-trivial tasks:

- Classify the task using `skills/acm-task/SKILL.md`.
- Create or update a task folder under `.acm/tasks/[YYYY-MM-DD-task-slug]/`.
- Prefer one task folder per user outcome or logical feature/change; track tightly related phases inside that folder unless there is a real boundary that requires a separate task.
- Create a concise plan before implementation.
- Record verification in the task folder.
- Update durable memory only when durable truth changes.
- Update `handoff.md` when work is incomplete, risky, long-running, or non-obvious.

Use task resources from `skills/acm-task/resources/` when a template or profile is useful.

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
