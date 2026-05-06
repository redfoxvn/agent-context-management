# Agent Context Management

Documentation-first context architecture for AI coding agents such as Claude Code and Codex.

This repository is a reusable framework for helping coding agents:

- load the smallest safe context
- distinguish durable truth from task history
- classify work before editing
- preserve verification and handoff state across sessions
- avoid silent conflicts between request, docs, code, and tests

It is designed to be adapted into real software repositories. This repo itself is the framework, not an application codebase.

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

## How Agents Are Expected To Work

For non-trivial work, an agent should:

1. Read `AGENTS.md`.
2. Read `docs/index.md`.
3. Read the core agent docs in `docs/agent/`.
4. Classify the task.
5. Load only the relevant durable docs, source code, and tests.
6. Create or update a task folder under `docs/tasks/`.
7. Plan before implementation.
8. Verify before reporting completion.
9. Promote verified truth into durable docs when needed.

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

The workflow system separates three concerns:

- workflow: the lifecycle of a task
- skill: a reusable procedure used inside one or more workflow steps
- template: the artifact schema for a task classification

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

- Start with [AGENTS.md](AGENTS.md)
- Then read [docs/index.md](docs/index.md)
- For the operating loop, read [docs/agent/operating-manual.md](docs/agent/operating-manual.md)
- For context loading, read [docs/agent/context-policy.md](docs/agent/context-policy.md)
- For task classification and artifacts, read [docs/agent/task-workflow.md](docs/agent/task-workflow.md)

## License

No license file is currently included in this repository.
