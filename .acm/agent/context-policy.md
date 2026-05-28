# Context Policy

## Purpose

This file defines how coding agents load, expand, refresh, and limit context.

Use `.acm/index.md` for source-of-truth and write locations. Use `.acm/agent/task-workflow.md` for task classification and lifecycle.

---

## Principles

- Load context progressively.
- Prefer durable docs for current truth.
- Use task docs for history and working state.
- Always reconcile docs, code, and tests before non-trivial implementation.
- Treat docs/code/tests disagreement as ambiguity, not permission to choose silently.
- Stop expanding when enough context exists to plan safely.

---

## Context Depth Levels

| Level | Use When | Read |
|---|---|---|
| 0 Bootstrap | Starting a session | `AGENTS.md`, `.acm/index.md` |
| 1 Routing | Classifying or locating scope | Level 0, `.acm/agent/task-workflow.md`, `.acm/architecture/source-map.md`, relevant indexes |
| 2 Focused | Most scoped implementation tasks | Level 1, relevant feature/architecture docs, directly related source and tests |
| 3 Expanded | Ambiguous or multi-module work | Level 2, related features/tasks/ADRs, adjacent modules, broader tests |
| 4 Investigation | Unknown root cause, high-risk, security, migration, docs/code/tests conflict | Level 3, deeper call graph, broader tests, logs/runtime evidence if available |

Level 4 should still be targeted. Do not read the entire repository by default.

---

## Task-Based Loading

| Classification | Load First | Expand When |
|---|---|---|
| `new-feature` | product context, related feature docs, source map, related patterns/tests | overlaps existing behavior, needs API/data/auth, ownership unclear |
| `change-feature` | current feature behavior/API/data/test docs, related code/tests | docs/code/tests disagree, tests encode undocumented behavior, other features may be affected |
| `bugfix` | bug report, feature behavior, failing path, tests, recent tasks if regression suspected | not reproducible, root cause unclear, multiple modules involved |
| `refactor` | architecture boundaries, conventions, affected behavior, tests, related source | public API might change, boundaries unclear, test coverage weak |
| `migration` | architecture, affected features, data model, ADRs, code/tests, runtime notes | rollback/data compatibility risk exists |
| `performance` | affected behavior, runtime flow, hot path, metrics, behavior-protecting tests | caching/concurrency/data access changes, baseline missing |
| `security` | trust boundaries, auth/permissions, affected behavior, API/data docs, tests, ADRs | permissions unclear, data exposure possible, secrets/user data involved |
| `test-improvement` | feature behavior, test scenarios, existing tests, related code | tests reveal undocumented or questionable behavior |
| `docs` | docs being edited, owning source of truth, related code/tests if needed | docs appear inconsistent or change product/architecture meaning |
| `spike` | research question, relevant product/architecture/decision docs, representative code | recommendation affects architecture, data, API, security, or workflow |

---

## Expansion Triggers

Expand context when:

- affected feature/module is unclear
- behavior is ambiguous
- docs, code, or tests disagree
- public API, data model, auth, security, billing, or migration is involved
- regression risk is high
- test coverage is weak
- implementation reveals hidden coupling
- current context cannot support reliable verification

---

## Stop Conditions

Stop and report when:

- expected behavior is ambiguous
- source of truth cannot be determined
- docs conflict with code/tests in a behavior-affecting way
- task classification is uncertain and affects workflow
- security/auth/billing/data-integrity impact is unclear
- required verification is impossible or unreliable
- implementation requires a broad rewrite not requested

Report what is unclear, which sources conflict, why it matters, and recommended options.

---

## Refresh Rules

Refresh context when:

- the plan changes materially
- new affected modules/files are discovered
- tests reveal unexpected behavior
- docs/code/tests conflict
- user changes requirements
- a task resumes after interruption

Refresh only affected docs/code/tests, not the full context set.

---

## Minimum Context Before Implementation

Before implementation, know:

- task classification
- affected feature/module
- expected behavior or intended non-behavior-change
- relevant architecture constraints
- affected files or likely search area
- relevant tests or verification strategy
- risks, assumptions, and open questions

If these are unknown, do not implement yet.
