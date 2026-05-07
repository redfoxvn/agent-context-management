# Agent Context Management

Documentation-first context architecture for AI coding agents such as Claude Code and Codex.

This repository is a reusable framework for helping coding agents:

- load the smallest safe context
- distinguish durable truth from task history
- classify work before editing
- preserve verification and handoff state across sessions
- avoid silent conflicts between request, docs, code, and tests

It is designed to be adapted into real software repositories. This repo itself is the framework, not an application codebase.

## Philosophy

```txt
The context system should not make smart agents follow long procedures.
It should help them find the right truth, avoid unsafe assumptions, and preserve state.
```

The framework assumes strong coding models that can reason well with concise structure, clear boundaries, and reliable source-of-truth routing.

## Why This Exists

Coding agents fail in predictable ways:

- they edit from the user request alone
- they read too much irrelevant context
- they treat stale notes as current truth
- they skip verification or overstate certainty
- they lose state between sessions

This project provides a structured documentation system to reduce those failures.

## Core Model

The repository separates context into distinct layers:

- `AGENTS.md`: bootstrap rules for agents
- `docs/index.md`: context router and source-of-truth map
- `docs/agent/`: operating policies, workflow rules, safety, review, handoff, reusable skills
- `docs/tasks/`: task-scoped working memory and history
- `docs/features/`: current durable feature truth
- `docs/architecture/`: durable technical structure, constraints, and conventions
- `docs/product/`: project-specific product and domain context
- `docs/decisions/`: long-lived decisions and ADR-style reasoning
- `docs/templates/`: reusable schemas for task and feature artifacts

The main rule is:

```txt
task docs record what happened
durable docs record what is true now
```

## Read Model

The framework separates:

- required bootstrap context
- conditional task-specific context
- optional reference material

Agents should load:

1. the smallest safe context
2. the relevant durable truth
3. only the procedures needed for the current task

This keeps execution disciplined without forcing the agent to read the whole repository.

## Repository Structure

```txt
.
├── AGENTS.md
├── CLAUDE.md
└── docs/
    ├── agent/
    │   ├── operating-manual.md
    │   ├── context-policy.md
    │   ├── task-workflow.md
    │   ├── tool-policy.md
    │   ├── review-checklist.md
    │   ├── failure-modes.md
    │   ├── session-handoff.md
    │   └── skills/
    ├── architecture/
    ├── decisions/
    ├── features/
    ├── product/
    ├── tasks/
    ├── templates/
    └── index.md
```

## Task Workflow Model

The workflow system separates four concerns:

- workflow: the lifecycle of a task
- template: the artifact structure
- profile: classification-specific attention
- skill: reusable tactical heuristics

Base task templates live under:

```txt
docs/templates/tasks/*.template.md
```

Task profiles live under:

```txt
docs/templates/tasks/profiles/
```

Examples of supported task classifications:

- `new-feature`
- `change-feature`
- `bugfix`
- `refactor`
- `migration`
- `performance`
- `security`
- `test-improvement`
- `docs`
- `spike`

## Feature Documentation Model

Feature docs describe verified current behavior.
Task docs describe how work happened.

Recommended feature files:

```txt
docs/features/[feature-name]/
├── behavior.md
├── api.md
├── data-model.md
├── test-scenarios.md
└── changelog.md
```

Use templates from:

```txt
docs/templates/features/
```

Create only the feature files that preserve useful durable truth.
Small features may only need `behavior.md` and `test-scenarios.md`.

Promote task findings into feature docs only after verification or explicit acceptance as intended truth.

## Decision Record Model

Decision docs record durable choices and rationale.
Task docs record how the decision was reached.
Architecture, product, and feature docs record the resulting current truth.

Recommended decision file format:

```txt
docs/decisions/YYYY-MM-DD-short-title.md
```

Use template:

```txt
docs/templates/decisions/adr.template.md
```

Create decision records only when future agents or developers need to understand why an important choice was made.

Good candidates include:

- architecture boundaries
- public API direction
- technology choices
- migration strategies
- security or auth tradeoffs
- long-term constraints

Avoid creating decision records for:

- minor implementation details
- temporary workarounds
- task-local choices
- small style preferences
- obvious bugfix decisions

Keep decision records concise and consequence-focused.

## Adapting This To A Real Project

When applying this framework to a real software repository:

1. Keep `AGENTS.md` short and mandatory.
2. Fill `docs/architecture/` with real boundaries, flows, conventions, testing guidance, and a usable `source-map.md`.
3. Fill `docs/product/` with project-specific purpose, domain model, and glossary.
4. Add feature folders under `docs/features/` for important behaviors and contracts.
5. Record long-lived decisions under `docs/decisions/`.
6. Use `docs/tasks/` only for task-scoped working state and history.

If this repo is used as a bootstrap template, it is normal for `docs/product/` and parts of `docs/architecture/` to start empty until adopted by a concrete project.

## Current Status

This repository currently contains the framework, policies, skills, and templates. It does not contain a concrete application codebase, so some project-specific folders are intentionally empty placeholders.

## Recommended Entry Points

Required for non-trivial work:

- [AGENTS.md](AGENTS.md)
- [docs/index.md](docs/index.md)
- [docs/agent/context-policy.md](docs/agent/context-policy.md)
- [docs/agent/task-workflow.md](docs/agent/task-workflow.md)

Read conditionally:

- `tool-policy.md` before risky commands
- `review-checklist.md` before completion
- `session-handoff.md` when continuing incomplete/risky work
- relevant skill docs only when needed

Optional reference:

- `operating-manual.md`
- `failure-modes.md`

## License

No license file is currently included in this repository.
