---
name: acm-init
description: Use when adding Agent Context Management to a repository or creating the initial minimal .acm project memory layer.
---

# Skill: ACM Init

## Use For

Initialize Agent Context Management in a repository with the smallest useful `.acm/` project memory layer.

## Core Model

```txt
skills = how agents work
.acm/  = what this project knows
```

Do not copy workflow policies, task profiles, or templates into every target repository. Those belong in the skill pack.

## Minimal Init Output

Create the `.acm/` memory layer:

```txt
.acm/
├── index.md
├── project.md
├── config.md
└── tasks/
    └── index.md
```

If the repository has no agent bootstrap yet, also install one at the root from
this skill's `resources/bootstrap/` so skills load at session start. Do NOT
overwrite an existing `AGENTS.md` or `CLAUDE.md` — merge the ACM rules into it:

```txt
AGENTS.md   ← resources/bootstrap/AGENTS.md
CLAUDE.md   ← resources/bootstrap/CLAUDE.md
```

Create optional folders only when they contain real project memory:

```txt
.acm/features/
.acm/architecture/
.acm/decisions/
.acm/tasks/[YYYY-MM-DD-task-slug]/
```

## When NOT To Use

Do not use this skill to:

- migrate all legacy docs at once
- pre-fill architecture or feature docs from weak guesses
- create empty optional folders just to mirror the framework
- overwrite an existing project memory structure without review

## Output Contract

A successful init produces:

- `.acm/index.md`
- `.acm/project.md`
- `.acm/config.md`
- `.acm/tasks/index.md`
- a root bootstrap (`AGENTS.md`, and `CLAUDE.md` for Claude Code) when none existed
- no empty optional memory folders unless explicitly requested
- no unverified durable feature, architecture, or decision docs

## Greenfield Adoption

Use this when a project is starting from scratch.

1. Create the minimal `.acm/` files.
2. Fill `project.md` with known purpose, goals, non-goals, and verification commands.
3. Create task records from the first non-trivial task.
4. Let feature, architecture, and decision docs grow from verified work.

Rule:

```txt
Start with minimal memory. Do not pre-fill imaginary architecture, product, or feature docs.
```

## Brownfield Adoption

Use this when adopting ACM into an existing project.

1. Create the minimal `.acm/` files.
2. Draft `project.md` only from strong evidence.
3. Treat existing docs as unverified until checked against code, tests, or accepted product truth.
4. Add architecture, feature, and decision docs task-by-task.

Rule:

```txt
Do not document everything upfront. Build durable memory through task-driven verification.
```

## Expansion Rules

Create `.acm/features/` when verified feature behavior should outlive the task.

Create `.acm/architecture/` when stable source maps, boundaries, flows, or conventions help future work.

Create `.acm/decisions/` when an accepted tradeoff will matter in future tasks.

## Human Confirmation

Agents may draft project memory from evidence. Humans should confirm product meaning, business rules, architecture boundaries, accepted conventions, and durable decisions.

## Resources

Canonical starter files live under this skill's `resources/`. Copy them instead
of writing from memory:

```txt
resources/minimal-acm/index.md       → .acm/index.md
resources/minimal-acm/project.md     → .acm/project.md
resources/minimal-acm/config.md      → .acm/config.md
resources/minimal-acm/tasks/index.md → .acm/tasks/index.md
resources/bootstrap/AGENTS.md        → AGENTS.md   (only if absent; else merge)
resources/bootstrap/CLAUDE.md        → CLAUDE.md   (only if absent; else merge)
```

Then fill `project.md` with known project facts only.
