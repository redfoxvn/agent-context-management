# ACM Skill Pack

This directory contains the reusable Agent Context Management skill pack.

ACM uses a hybrid model:

- Skills define how agents work.
- `.acm/` stores project-specific memory.

The skill pack is intended to be portable across coding agents such as Claude Code, Codex, OpenCode, and future plugin integrations. A project should not need to copy workflow policies or templates into `.acm/` during initialization. Skills create or update repo-local memory only when useful.

## Core Skills

- `acm-init`: initialize a minimal `.acm/` memory layer.
- `acm-task`: classify work, load context, and manage task records.
- `acm-memory`: promote verified findings into durable project memory.
- `acm-completion`: perform final review and verification checks.
- `acm-handoff`: preserve continuation state for incomplete or risky work.

Tactical skills such as `bugfix`, `codebase-research`, `migration`, and `test-design` support specific task types.
