# AGENTS.md

## Core Rule

Do not make non-trivial code changes from the user's message alone.

Before planning or implementing, reconcile these sources:

1. User request — the desired change or problem report.
2. docs/ — durable product, architecture, and agent instructions.
3. Source code — current implemented behavior.
4. Tests — executable expectations and regression constraints.

If these sources conflict, stop and report the conflict clearly. Do not silently choose one source unless the task is explicitly exploratory.

---

## Context Loading Order

For every non-trivial task:

1. Read `docs/index.md`.
2. Read `docs/agent/operating-manual.md`.
3. Read `docs/architecture/source-map.md`.
4. Read relevant feature specs under `docs/features/`.
5. Read recent related task records under `docs/tasks/` if they exist.
6. Inspect relevant source code.
7. Inspect relevant tests.

For trivial edits, use judgment and keep changes minimal.

---

## Task Classification

Classify the task before planning:

* `new-feature`
* `change-feature`
* `bugfix`
* `refactor`
* `migration`
* `performance`
* `security`
* `test-improvement`
* `docs`
* `spike`

If the classification is unclear, state the assumed classification before proceeding.

---

## Task Workflow

For non-trivial tasks, create or update a task folder:

`docs/tasks/[YYYY-MM-DD-task-slug]/`

The task folder structure depends on task classification.

Use the matching template under:

`docs/templates/tasks/[task-classification]/`

Every non-trivial task must include a `handoff.md`.

Implementation tasks should include:

- `plan.md`
- `implementation-log.md`
- `verification.md`

Task-specific files should be created according to the selected template.

Do not start implementation until a concise plan exists, unless the change is trivial or explicitly exploratory.

---

## Planning Rules

The plan must include:

* Task summary
* Task classification
* Affected features or modules
* Affected files or directories
* Expected behavior changes
* Test strategy
* Risks, assumptions, or open questions

If the plan becomes invalid during implementation, update the plan before continuing.

---

## Implementation Rules

During implementation:

* Prefer minimal, localized changes.
* Preserve existing architecture and conventions.
* Do not introduce new patterns when an existing project pattern applies.
* Do not remove tests unless they are obsolete and the reason is documented.
* Do not weaken validation, authorization, authentication, error handling, logging, or type safety to make tests pass.
* Update or add tests for behavior changes.
* Keep implementation aligned with the plan.

---

## Verification Rules

After implementation, run the smallest relevant checks first, then broader checks when appropriate.

Suggested order:

1. Targeted unit tests
2. Targeted integration tests
3. Typecheck
4. Lint
5. Build
6. End-to-end tests

Record verification results in:

`docs/tasks/[YYYY-MM-DD-task-slug]/verification.md`

If a check cannot be run, record why.

Never claim a task is verified if checks were not actually run.

---

## Documentation Rules

When behavior, architecture, API contracts, data models, or conventions change, update the durable docs.

Use this distinction:

* Task docs record what happened.
* Feature docs record what is true now.
* Architecture docs record constraints future changes must respect.
* Decision docs record why important choices were made.

Update relevant files under:

* `docs/features/`
* `docs/architecture/`
* `docs/decisions/`

---

## Handoff Rules

At the end of every non-trivial task, update:

`docs/tasks/[YYYY-MM-DD-task-slug]/handoff.md`

The handoff must include:

* Current status
* Changed files
* Important context
* Decisions made
* Tests or checks run
* Known risks
* Remaining work
* Recommended next action

The handoff should allow a new agent session to continue the task without re-reading the entire conversation.

---

## Stop Conditions

Stop and ask for clarification when:

* The user request conflicts with existing docs.
* Docs conflict with code or tests.
* Expected behavior is ambiguous.
* The change may alter security, billing, authentication, authorization, data integrity, or public API behavior.
* The task requires deleting or rewriting large parts of the system.
* There is no reliable way to verify the change.
* Implementation would require assumptions that affect product behavior.

When stopping, summarize:

1. What is unclear
2. Which sources conflict
3. What decision is needed
4. Recommended options

---

## Session Continuity

If the session is running out of context, update the task handoff before continuing.

Prioritize preserving:

* Task objective
* Current plan
* Files already changed
* Files inspected
* Decisions made
* Failed attempts
* Verification status
* Remaining risks
