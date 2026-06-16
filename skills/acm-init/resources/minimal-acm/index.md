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
