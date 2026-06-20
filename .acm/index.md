# ACM Index

This repository uses Agent Context Management.

## Project Memory

- Project context: `.acm/project.md`
- Task history: `.acm/tasks/`
- Feature truth: `.acm/features/` when present
- Architecture truth: `.acm/architecture/` when present
- Decisions: `.acm/decisions/` when present

## Core Rules

- Skills define workflow.
- `.acm/` stores project-specific memory.
- Task docs record what happened.
- Durable docs record what is true now.
- If request, docs, code, or tests conflict in a behavior-affecting way, stop and report the conflict.

## Skill Pack

Reusable workflow lives under `skills/` in this repository.

Start with `skills/using-acm/SKILL.md` to choose which skill applies.

Core workflow skills:

- `skills/acm-init/SKILL.md`
- `skills/acm-task/SKILL.md`
- `skills/acm-memory/SKILL.md`
- `skills/acm-completion/SKILL.md`
- `skills/acm-handoff/SKILL.md`

Use tactical skills from `skills/` only when the task needs that procedure.
