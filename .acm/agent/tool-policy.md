# Tool Policy

## Purpose

This file defines safety rules for using commands and tools.

Use it to decide what can be inspected, verified, modified, or must require explicit approval.

---

## Principles

- Prefer read-only inspection before mutation.
- Prefer scoped commands over broad commands.
- Prefer existing repo scripts over ad-hoc commands.
- Prefer targeted verification before broad verification.
- Prefer dry-run, plan, or diff before risky changes.
- Do not affect production, shared environments, releases, or user data unless explicitly requested.
- Do not expose secrets or sensitive data.
- Do not discard unrelated working-tree changes.

---

## Safety Levels

| Level | Type | Examples | Rules |
|---|---|---|---|
| 0 | Read-only | list/search/read files, git status/diff/log, inspect config | Safe when scoped; avoid dumping huge output |
| 1 | Local verification | targeted tests, typecheck, lint, build, local e2e | Use relevant project scripts; record results when task docs exist |
| 2 | Local file-changing | formatters, generators, snapshots, lockfile changes | Run only when needed; inspect generated changes |
| 3 | Risky/destructive | reset/clean, force push, deploy, publish, DB reset/migrate shared env, infra apply | Require explicit approval or clear repo-specific permission |

---

## Git Policy

Safe by default:

- `git status`
- `git diff`
- `git log`
- `git show`

Require caution:

- restore
- checkout
- stash
- merge
- rebase
- cherry-pick

Require explicit approval:

- hard reset
- clean
- push / force push
- history rewrite
- commands that discard local changes

Never discard unrelated user changes silently.

---

## Dependency Policy

- Use the package manager already used by the repo.
- Do not introduce dependencies unless required.
- Prefer existing dependencies and patterns.
- Inspect lockfile changes.
- Do not run broad upgrades unless dependency maintenance or migration is the task.
- Document dependency changes and reasons.

---

## Secrets Policy

Never print, copy, store, or expose:

- API keys
- access or refresh tokens
- cookies
- private keys
- database URLs with credentials
- cloud credentials
- webhook secrets

Do not dump `.env` files. Redact sensitive values in logs and docs.

---

## Command Result Recording

When a task folder exists, record important commands in:

- `verification.md`
- `implementation-log.md`
- `handoff.md`

Record:

```txt
command or method:
result:
notes:
```

For failures, state whether the failure appears related to the task and what the next action is.

---

## Stop Before Running

Stop and report before running a command that may:

- delete or overwrite unrelated work
- affect production or shared environments
- expose secrets or private data
- publish, deploy, release, or send notifications
- rewrite git history
- perform destructive database or infrastructure changes
- modify billing, payment, or user data
- run against an unclear target environment
