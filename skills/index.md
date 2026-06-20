# ACM Skills Index

## Purpose

This index lists reusable Agent Context Management skills.

Skills are workflow and reasoning procedures. They should not store project-specific truth. Project memory belongs in `.acm/`.

## Meta Skill

| Skill | Purpose |
|---|---|
| `using-acm` | Entry point: shared operating rules and a situation→skill routing map |

For "which skill do I use?", start with `using-acm`. Most non-trivial work then
starts with `acm-task` (classify + load context) and ends with `acm-completion`.

## Core Workflow Skills

| Skill | Purpose |
|---|---|
| `acm-init` | Initialize the minimal `.acm/` project memory layer |
| `acm-task` | Classify work, load safe context, and manage task records |
| `acm-memory` | Promote verified task findings into durable docs or ADRs |
| `acm-completion` | Review scope, docs, verification, and residual risk before completion |
| `acm-handoff` | Create or consume handoff state for incomplete, risky, or non-obvious work |
| `acm-skill-authoring` | Create, edit, review, and validate reusable ACM skills |

## Advanced Skills

| Skill | Purpose |
|---|---|
| `acm-adversarial-review` | Subject high-stakes decisions to fresh-context adversarial review |

## Development Practice Skills

| Skill | Purpose |
|---|---|
| `code-review` | Review code for correctness, readability, architecture, security, and performance risks |
| `context-engineering` | Build, prune, and preserve task context without mixing project memory into skills |
| `git-workflow` | Manage branches, atomic commits, save points, and repository state safely |
| `test-driven-development` | Drive behavior changes through failing tests, minimal implementation, and refactoring |

## Tactical Skills

| Skill | Purpose |
|---|---|
| `bugfix` | Diagnose a defect and define a minimal verified fix path |
| `decision-recording` | Record durable decisions or ADRs when needed |
| `framework-adoption` | Adopt ACM into a real repository safely and incrementally |
| `impact-analysis` | Identify affected features, modules, contracts, data, tests, and risks |
| `migration` | Plan schema, data, dependency, runtime, or infrastructure changes safely |
| `performance-optimization` | Improve performance while preserving correctness and measuring results |
| `refactor` | Improve internal structure without changing behavior |
| `security-remediation` | Analyze and remediate auth, permission, validation, secret, or data exposure risks |
| `spike-research` | Investigate options and produce decision support |
| `test-design` | Design meaningful behavior and regression tests |

## Maintenance Rules

- Keep reusable workflow in skills.
- Keep repo-specific facts in `.acm/`.
- Keep skills concise and tactical.
- Do not duplicate durable project truth inside skills.
- Use `acm-skill-authoring` when changing skills.
- Keep descriptions trigger-focused.
