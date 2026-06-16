---
name: framework-adoption
description: Use when adopting ACM into a real repository, preparing agent context, or migrating existing docs into project memory.
---

# Skill: Framework Adoption

## Use For

Adopt Agent Context Management into a real software repository after the ACM skill pack is available.

For first-time initialization, use `skills/acm-init/SKILL.md` first.

## Core Model

```txt
skills = how agents work
.acm/  = what this project knows
```

## Use When

Use this skill when the user asks to:

- prepare a repo for coding agents
- add context management to a codebase
- migrate legacy docs into ACM memory
- build initial architecture, feature, decision, or project context

Do not use this skill for ordinary documentation edits.

## Inputs

Identify:

- target repository structure
- adoption mode: `greenfield`, `brownfield`, or `legacy-docs-migration`
- existing docs and whether they are current
- protected areas or risky domains
- user-provided constraints

If adoption mode is unclear and affects the approach, stop and ask.

## Procedure

### 1. Confirm Minimal ACM Memory

The target repo should contain:

```txt
.acm/index.md
.acm/project.md
.acm/config.md
.acm/tasks/index.md
```

If these files do not exist, use `skills/acm-init/SKILL.md` or ask for approval before creating them.

### 2. Create Adoption Task State

Create or update:

```txt
.acm/tasks/[YYYY-MM-DD-adopt-acm]/task.md
```

Record adoption mode, scope, repo structure findings, uncertainty, verification performed, remaining risks, and next actions.

Use `handoff.md` if adoption is incomplete, multi-session, or risky.

### 3. Build Project Memory From Evidence

For greenfield adoption, keep `.acm/project.md` minimal and let memory grow from tasks.

For brownfield adoption, treat code and tests as primary evidence until docs are verified.

For legacy docs migration, triage docs instead of bulk-importing them.

| Finding | Destination |
|---|---|
| project purpose, goals, terms, verification commands | `.acm/project.md` |
| current feature behavior | `.acm/features/[feature-name]/` |
| technical boundary, source map, convention, or flow | `.acm/architecture/` |
| durable tradeoff or rationale | `.acm/decisions/` |

Create optional folders only when they contain useful durable memory.

### 4. Triage Legacy Docs

| Category | Action |
|---|---|
| verified durable truth | promote to project, architecture, feature, or decision docs |
| useful historical context | link from task or decision docs when relevant |
| stale or conflicting docs | archive, mark stale, or remove |
| task-specific notes | move or summarize into task docs only if still useful |

Do not promote implementation logs, scratch notes, or unverified assumptions.

## Human Confirmation Required

Humans should confirm product meaning, business rules, architecture boundaries, accepted conventions, public API/product behavior decisions, accepted ADRs, and whether legacy behavior is intended or stale.

## Stop Conditions

Stop and report when:

- adoption mode is unclear and affects the workflow
- minimal ACM memory has not been initialized
- existing docs conflict with code or tests
- product terms cannot be inferred safely
- business rules affect user-visible behavior
- architecture boundaries are unclear or currently violated
- adoption would overwrite existing docs or user work
- verification is impossible or unreliable

## Output

A good adoption pass should produce:

- minimal ACM memory confirmed
- adoption task state recorded
- verified project memory updates where useful
- legacy docs triage notes, if applicable
- explicit uncertainty and human-review items
- no unverified assumptions promoted into durable docs
