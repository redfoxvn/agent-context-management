# Tool Policy

## Purpose

This file defines safety rules for using tools and commands in this repository.

Use it to decide:
- which commands are safe to run directly
- which commands require caution
- which commands require explicit approval
- how to record important command results

This file is a safety boundary, not a complete manual for every tool.

For related rules:
- task workflows: `docs/agent/task-workflow.md`
- context loading: `docs/agent/context-policy.md`
- review before completion: `docs/agent/review-checklist.md`
- handoff protocol: `docs/agent/session-handoff.md`

---

## Core Principles

- Prefer read-only inspection before mutation.
- Prefer scoped commands over broad commands.
- Prefer existing repo scripts over ad-hoc commands.
- Prefer targeted verification before broad verification.
- Prefer dry-run, plan, or diff before applying risky changes.
- Do not run commands that affect production, shared environments, releases, or user data unless explicitly requested.
- Do not expose secrets, tokens, credentials, private data, or sensitive logs.
- Do not discard user or working-tree changes silently.

---

## Command Safety Levels

### Level 0 — Read-only

Generally safe when scoped.

Examples:
- list/search/read files
- inspect git status/diff/log
- inspect package scripts/config
- inspect test/build configuration

Rules:
- Use these first during exploration.
- Keep output scoped and relevant.
- Avoid dumping large files or full repository output.

---

### Level 1 — Local verification

Usually safe, but may take time or create local cache/artifacts.

Examples:
- targeted tests
- typecheck
- lint
- build
- local e2e checks

Rules:
- Prefer targeted checks first.
- Use documented project scripts when available.
- Record important command/results when a task folder exists.
- If a check fails, determine whether it is related to the current task before claiming completion.

---

### Level 2 — Local file-changing commands

Allowed when relevant to the task, but inspect the diff.

Examples:
- formatters
- code generators
- snapshot updates
- migration file generation
- dependency install/update that modifies lockfiles

Rules:
- Run only when needed for the task.
- Inspect generated or broad changes.
- Do not accept generated changes blindly.
- Avoid broad formatting unless formatting is the task.
- Document significant generated changes when task docs exist.

---

### Level 3 — Risky or destructive commands

Do not run without explicit approval or clear repo-specific permission.

Examples:
- deleting files/directories broadly
- hard reset / clean / history rewrite
- force push
- executing database migrations against shared environments
- resetting/dropping databases
- deployment, release, publish commands
- infrastructure apply/destroy commands

Rules:
- Prefer dry-run, diff, preview, or plan first.
- Confirm target environment.
- Never run production-affecting commands unless explicitly requested.
- Record command, target, and result if executed.

---

## Git Policy

Safe by default:
- inspect status, diff, log, show current branch

Use caution:
- restore, checkout, stash, merge, rebase, cherry-pick

Require explicit approval:
- reset hard
- clean
- push
- force push
- history rewrite
- commands that discard local changes

Rules:
- Check working-tree state before commands that may overwrite files.
- Never discard unrelated changes silently.
- Do not commit or push unless explicitly requested.
- Do not rewrite history unless explicitly requested.

---

## Package and Dependency Policy

Use the package manager already used by the repo.

Rules:
- Do not introduce a new package manager.
- Do not add dependencies unless the task requires it.
- Prefer existing dependencies and patterns.
- Inspect lockfile changes.
- Do not run broad upgrades unless the task is dependency maintenance or migration.
- If adding/removing a dependency, document the reason.

---

## Verification Command Policy

Use project-specific scripts when available.

Typical order:
1. targeted tests
2. related integration tests
3. typecheck
4. lint
5. build
6. e2e tests

Rules:
- Do not run irrelevant checks just to satisfy process.
- Do not claim verification that was not performed.
- If checks are skipped, state why.
- If checks fail, report whether failures appear related.
- Do not weaken or delete tests just to pass.

---

## Database, Infrastructure, and External Environment Policy

Commands that affect databases, infrastructure, deployments, external services, or shared environments are high risk.

Before running them:
- confirm the target environment
- prefer dry-run/plan/generation first
- understand rollback or recovery when relevant
- avoid production/shared targets unless explicitly requested

Do not run commands that can migrate, reset, deploy, publish, send notifications, charge money, or modify external systems unless explicitly requested or clearly allowed.

---

## Secrets and Sensitive Data Policy

Never print, copy, store, or expose secrets.

Secrets include:
- API keys
- access/refresh tokens
- cookies
- private keys
- database URLs with credentials
- cloud credentials
- webhook secrets

Rules:
- Do not dump `.env` files.
- Redact sensitive values in logs.
- Use placeholders in docs.
- If a command prints secrets, do not repeat them in task docs or final response.

---

## Command Result Recording

When a task folder exists, record important commands in the relevant task artifact:

- `verification.md`
- `implementation-log.md`
- `handoff.md`

Record:

```txt
command:
result:
notes:
```

For failed commands, include:

* failure summary
* whether it appears related to the task
* next action or reason it was not resolved

Do not store huge raw logs unless necessary.

---

## Stop Before Running

Stop and report before running a command if it may:

* delete or overwrite unrelated work
* affect production or shared environments
* expose secrets or private data
* publish, deploy, release, or send external notifications
* rewrite git history
* perform destructive database or infrastructure changes
* modify billing/payment/user data
* run against an unclear target environment

Report:

* command being considered
* why it is risky
* safer alternative if available
* approval or decision needed
