# ACM Skill Pack

This directory contains the reusable Agent Context Management skill pack.

ACM uses a hybrid model:

- Skills define how agents work.
- `.acm/` stores project-specific memory.

The skill pack is intended to be portable across coding agents such as Claude Code, Codex, OpenCode, and future plugin integrations. A project should not need to copy workflow policies or templates into `.acm/` during initialization. Skills create or update repo-local memory only when useful.

## Meta Skill

- `using-acm`: entry point — shared operating rules and a situation→skill routing map.

## Core Workflow Skills

- `acm-init`: initialize a minimal `.acm/` memory layer.
- `acm-task`: classify work, load context, and manage task records.
- `acm-memory`: promote verified findings into durable project memory.
- `acm-completion`: perform final review and verification checks.
- `acm-handoff`: preserve continuation state for incomplete or risky work.
- `acm-skill-authoring`: create, edit, review, and validate reusable ACM skills.

## Advanced Skills

- `acm-adversarial-review`: subject high-stakes decisions to fresh-context adversarial review.

## Development Practice & Tactical Skills

Development-practice skills (`code-review`, `context-engineering`, `git-workflow`,
`test-driven-development`) and tactical skills (such as `bugfix`, `migration`,
`refactor`, and `test-design`) support specific task types.

See `skills/index.md` for the full grouped list.

## Skill Authoring

Use `acm-skill-authoring` before creating or changing reusable ACM skills.

Skill files should remain concise. Put reusable templates, validation snippets, and long references in `resources/`.
