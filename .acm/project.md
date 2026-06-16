# Project Context

## Summary

Agent Context Management is a hybrid framework for AI coding agents.

It provides:

- a reusable root-level skill pack for agent workflows
- a minimal `.acm/` project memory layer for durable repo-specific context
- task records for continuity, verification, and handoff

The framework is intended for coding agents such as Claude Code, Codex, OpenCode, and future plugin integrations.

## Users / Operators

| User Type | Goals | Constraints |
|---|---|---|
| Coding agents | Load safe context, follow workflows, preserve task state | Limited context windows and tool-specific skill support |
| Developers | Review agent work and maintain durable repo memory | Need concise, git-friendly Markdown |
| Framework adopters | Add ACM to real repositories with low setup friction | Should not copy large workflow trees into every repo |

## Goals

- Reduce context loss across coding sessions.
- Make agent work more reviewable and deterministic.
- Keep workflow reusable through skills.
- Keep project memory lightweight, repo-native, and human-readable.
- Support incremental adoption in greenfield and brownfield repositories.

## Non-Goals

- Not a fully autonomous software engineer.
- Not a replacement for engineering judgment.
- Not a proprietary memory database.
- Not a runtime orchestration platform.
- Not a completed CLI or plugin implementation yet.

## Important Terms

| Term | Meaning |
|---|---|
| Skill | Reusable workflow or tactical procedure for agents |
| Project memory | Repo-specific durable context stored under `.acm/` |
| Task record | Task-scoped working state and history under `.acm/tasks/` |
| Durable truth | Verified or accepted current project knowledge |
| Promotion | Moving verified task findings into durable project memory |

## Current Architecture Summary

Workflow procedures live in `skills/`. Project-specific memory lives in `.acm/`. The repository currently contains Markdown docs and resources only; it does not include an application runtime, package manifest, or test suite.

## Verification

| Check | Command / Method | Notes |
|---|---|---|
| Markdown reference search | `rg "pattern" .` | Use to find stale paths |
| Whitespace check | `git diff --check` | Run before reporting completion |
| Git status review | `git status --short` | Confirm intended file changes |
