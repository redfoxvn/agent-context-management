# Documentation Index

## Purpose

This file is the main context router for this repository.

Use it to decide:
- where durable project knowledge lives
- which documents to read before changing code
- which documents are source of truth
- where to write updates after completing a task

Do not treat this file as a replacement for detailed docs. Use it to navigate to the right context.

---

## Context Layers

| Layer | Path | Purpose |
|---|---|---|
| Agent bootstrap | `AGENTS.md` | Mandatory rules for all coding agents |
| Documentation router | `docs/index.md` | Entry point for finding relevant context |
| Product context | `docs/product/` | Product purpose, domain concepts, glossary |
| Feature truth | `docs/features/` | Current expected behavior of active features |
| Task history | `docs/tasks/` | Work history, plans, investigations, handoffs |
| Architecture constraints | `docs/architecture/` | Technical structure, boundaries, conventions |
| Decisions | `docs/decisions/` | Durable decisions and reasoning |
| Agent operating docs | `docs/agent/` | Context policy, workflows, tool policy, review rules |
| Templates | `docs/templates/` | Schemas for creating new context artifacts |

---

## Source of Truth Rules

Use these rules when deciding which document owns which kind of knowledge.

| Knowledge Type | Source of Truth |
|---|---|
| Product goal, users, domain concepts | `docs/product/` |
| Current feature behavior | `docs/features/[feature-name]/behavior.md` |
| Feature API/interface contracts | `docs/features/[feature-name]/api.md` |
| Feature data model | `docs/features/[feature-name]/data-model.md` |
| Feature test scenarios | `docs/features/[feature-name]/test-scenarios.md` |
| Technical architecture and module boundaries | `docs/architecture/` |
| Long-lived decisions | `docs/decisions/` |
| Task plan, investigation, implementation history | `docs/tasks/[task-folder]/` |
| Agent workflow and operating rules | `docs/agent/` |

Task docs are not durable feature truth.  
Feature docs describe what is true now.

---

## Default Read Order for Coding Agents

For non-trivial tasks, read context in this order:

1. `AGENTS.md`
2. `docs/index.md`
3. `docs/agent/operating-manual.md`
4. `docs/agent/context-policy.md`
5. `docs/agent/task-workflow.md`
6. `docs/architecture/source-map.md`
7. Relevant files under `docs/features/`
8. Relevant files under `docs/architecture/`
9. Relevant recent or active tasks under `docs/tasks/`
10. Source code
11. Tests

Do not read every document by default. Load only context relevant to the task.

---

## When to Read Each Area

### `docs/product/`

Read when:
- the task involves domain behavior
- terminology is unclear
- user-facing behavior needs interpretation
- a new feature is being designed

Key files:
- `docs/product/overview.md`
- `docs/product/glossary.md`
- `docs/product/domain-model.md`

---

### `docs/features/`

Read when:
- changing existing behavior
- adding a feature related to an existing feature
- fixing a bug in user-visible behavior
- writing or updating tests
- checking expected behavior

Feature docs are the durable source of truth for current behavior.

Start with:
- `docs/features/index.md`

Then read the relevant feature folder:
- `spec.md`
- `behavior.md`
- `api.md`
- `data-model.md`
- `test-scenarios.md`
- `changelog.md`

---

### `docs/tasks/`

Read when:
- continuing an existing task
- investigating a regression
- understanding why recent changes were made
- checking previous plans, verification, or handoff notes

Task docs are historical records.  
Do not use task docs as the final authority for current behavior if feature docs exist.

Start with:
- `docs/tasks/index.md`

---

### `docs/architecture/`

Read when:
- touching multiple modules
- changing dependencies or boundaries
- adding new infrastructure, API, persistence, auth, or background jobs
- refactoring
- making changes that affect runtime flow

Key files:
- `docs/architecture/overview.md`
- `docs/architecture/source-map.md`
- `docs/architecture/flows.md`
- `docs/architecture/boundaries.md`
- `docs/architecture/conventions.md`

---

### `docs/decisions/`

Read when:
- a task may conflict with prior architectural/product decisions
- introducing a new pattern
- changing a major design choice
- evaluating alternatives

Start with:
- `docs/decisions/index.md`

---

### `docs/agent/`

Read when:
- classifying a task
- deciding how much context to load
- choosing workflow, skill, or template
- preparing a handoff
- deciding whether a task is done

Key files:
- `docs/agent/operating-manual.md`
- `docs/agent/context-policy.md`
- `docs/agent/task-workflow.md`
- `docs/agent/session-handoff.md`
- `docs/agent/tool-policy.md`
- `docs/agent/review-checklist.md`
- `docs/agent/failure-modes.md`

---

## Task Handling Rules

### Non-trivial Tasks

Create or update a task folder under:

```txt
docs/tasks/[YYYY-MM-DD-task-slug]/
```

A task is non-trivial if it:

* changes product behavior
* touches multiple modules
* affects API, data, auth, security, billing, or public contracts
* requires investigation
* requires migration
* has regression risk
* needs meaningful verification
* may require handoff across sessions

Use the matching template from:

```txt
docs/templates/tasks/[task-classification]/
```

---

### Trivial Tasks

A full task folder is usually not required for:

* typo fixes
* small wording changes
* local-only renames
* formatting-only edits
* very small single-file changes with no behavior impact

Even for trivial tasks, follow `AGENTS.md` and verify appropriately.

---

## Task Classification

Supported task classifications:

| Classification     | Use When                                                                                        |
| ------------------ | ----------------------------------------------------------------------------------------------- |
| `new-feature`      | Adding a new user/system capability                                                             |
| `change-feature`   | Changing existing feature behavior                                                              |
| `bugfix`           | Fixing incorrect behavior, regression, or failure                                               |
| `refactor`         | Changing internal structure without intended behavior change                                    |
| `migration`        | Changing schema, infrastructure, framework, dependency, or data shape                           |
| `performance`      | Improving latency, throughput, memory, bundle size, or resource usage                           |
| `security`         | Fixing or improving auth, permissions, data exposure, validation, secrets, or threat resistance |
| `test-improvement` | Adding or improving tests without intended product behavior change                              |
| `docs`             | Documentation-only updates                                                                      |
| `spike`            | Research, exploration, proof of concept, or decision support                                    |

If classification is uncertain and affects workflow materially, stop and clarify or document the assumption before proceeding.

---

## Durable Documentation Update Rules

After completing a task, update durable docs if needed.

| If task changes...                   | Update...                                        |
| ------------------------------------ | ------------------------------------------------ |
| Product/domain meaning               | `docs/product/`                                  |
| Feature behavior                     | `docs/features/[feature-name]/behavior.md`       |
| Feature API/interface                | `docs/features/[feature-name]/api.md`            |
| Feature data model                   | `docs/features/[feature-name]/data-model.md`     |
| Feature test expectations            | `docs/features/[feature-name]/test-scenarios.md` |
| Technical architecture or boundaries | `docs/architecture/`                             |
| Durable decision/reasoning           | `docs/decisions/`                                |
| Feature-level history                | `docs/features/[feature-name]/changelog.md`      |
| Task status/history                  | `docs/tasks/[task-folder]/`                      |

Before reporting completion, ensure task docs and durable docs do not conflict.

---

## Conflict Handling

Stop and report when there is a conflict between:

* user request
* `AGENTS.md`
* product docs
* feature docs
* architecture docs
* decisions
* source code
* tests

Do not silently choose one source if the conflict affects:

* product behavior
* API contracts
* data integrity
* security
* auth
* billing
* public behavior
* architecture boundaries

Tests may reflect intended behavior or outdated assumptions. If tests conflict with docs or code in behavior-affecting ways, treat it as ambiguity.

Report:

* what conflicts
* where the conflict appears
* why it matters
* recommended options
* which decision is needed

---

## Index Files

Use index files before scanning folders.

| Index                     | Purpose                                          |
| ------------------------- | ------------------------------------------------ |
| `docs/features/index.md`  | List active/deprecated features and entry points |
| `docs/tasks/index.md`     | List active, recent, and important tasks         |
| `docs/decisions/index.md` | List ADRs and durable decisions                  |

Keep index files updated when adding, renaming, deprecating, or completing important context artifacts.

---

## Write Locations

| Need to write...                                         | Write to...                     |
| -------------------------------------------------------- | ------------------------------- |
| Task request, plan, investigation, verification, handoff | `docs/tasks/[task-folder]/`     |
| Current behavior of a feature                            | `docs/features/[feature-name]/` |
| Architecture constraint or convention                    | `docs/architecture/`            |
| Long-lived decision                                      | `docs/decisions/`               |
| Product/domain concept                                   | `docs/product/`                 |
| Agent workflow/policy                                    | `docs/agent/`                   |
| New reusable artifact schema                             | `docs/templates/`               |

Do not write temporary notes into feature docs or architecture docs.

---

## Promotion Rule

During a task:

```txt
docs/tasks/[task-folder]/ = working artifacts and task memory
```

After implementation and verification:

```txt
docs/features/[feature-name]/ = current durable feature truth
```

Do not promote task outputs into durable feature docs until the implementation has been verified, unless the task is documentation-only or planning-only.

Promote task outputs into feature docs when the task changes:

* behavior
* API/interface
* data model
* test expectations
* user-visible rules
* error handling
* permissions/access control

---

## Maintenance Rules

Keep this index:

* short enough to scan quickly
* accurate enough to route agents correctly
* updated whenever top-level docs structure changes

Do not add detailed feature behavior here.
Link to the owning docs instead.
