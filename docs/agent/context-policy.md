# Context Policy

## Purpose

This file defines how coding agents should load, expand, verify, refresh, and limit context before and during a task.

Use this policy to decide:
- how much context to load
- when to expand context
- when to stop due to ambiguity or conflict
- when to refresh context
- how to avoid context overload

Use `docs/index.md` to locate the owning documents and canonical read/write locations.

---

## Core Principles

### 1. Load context progressively

Start with the smallest useful context set. Expand only when the task requires it.

Do not read the entire `docs/` folder by default.

---

### 2. Prefer durable truth for current behavior

Use durable docs to understand the current system:
- `docs/product/`
- `docs/features/`
- `docs/architecture/`
- `docs/decisions/`

Use task docs to understand work history:
- `docs/tasks/`

Task docs explain what happened.  
Feature docs explain what is true now.

---

### 3. Reconcile docs, code, and tests

Before implementation, reconcile:
1. user request
2. `AGENTS.md`
3. relevant docs
4. source code
5. tests

If they conflict in a behavior-affecting way, stop and report.

---

### 4. Do not trust one source blindly

Docs can be outdated.  
Tests can encode old assumptions.  
Code can contain bugs.  
User requests can conflict with architecture.

When sources disagree, treat it as ambiguity unless the decision is explicitly documented.

---

### 5. Context must be task-shaped

Load context based on task classification and affected feature/module.

Different task types require different context:
- bugfix: reproduction, behavior, related code/tests, recent task history if regression is suspected
- refactor: boundaries, conventions, behavior preservation, existing tests
- security: auth, permissions, trust boundaries, validation, data exposure
- migration: data model, compatibility, rollback, affected features/modules

---

## Default Context Loading Flow

Use `docs/index.md` as the canonical read-order router.

For non-trivial tasks:
1. Start with the default read order from `docs/index.md`.
2. Classify the task using `docs/agent/task-workflow.md`.
3. Choose the appropriate context depth level from this policy.
4. Load only the documents relevant to the affected feature/module.
5. Inspect source code and tests needed to verify the selected context.
6. Expand context only when an expansion trigger applies.
7. Stop if a stop condition applies.

Do not use this policy to override `docs/index.md`.  
Use this policy to decide depth, expansion, refresh, and stopping behavior.

---

## Context Depth Levels

### Level 0 — Bootstrap

Read:
- `AGENTS.md`
- `docs/index.md`

Use when:
- starting any session
- orienting inside the repo
- checking where context lives

---

### Level 1 — Task Routing

Read:
- Level 0 docs
- `docs/agent/task-workflow.md`
- `docs/architecture/source-map.md`
- relevant index files, such as `docs/features/index.md` or `docs/tasks/index.md`

Use when:
- classifying a task
- deciding whether the task is trivial or non-trivial
- finding relevant docs/code areas

---

### Level 2 — Focused Task Context

Read:
- Level 1 docs
- relevant feature docs
- relevant architecture docs
- directly related source files
- directly related tests

Use when:
- implementing most non-trivial changes
- fixing bugs with known scope
- changing an existing feature
- adding a feature in a known area

This is the default level for most coding tasks.

---

### Level 3 — Expanded Context

Read:
- Level 2 docs
- related features
- related historical tasks
- related ADRs
- broader test coverage
- adjacent modules

Use when:
- impact area is unclear
- task touches multiple modules
- behavior is ambiguous
- regression risk is high
- task affects API, data model, auth, security, billing, or public contracts

---

### Level 4 — Full Investigation

Read:
- Level 3 docs
- deeper source call graph
- broader tests
- logs or runtime evidence if available
- prior task history and decisions

Use when:
- root cause is unknown
- production bug or severe regression
- security issue
- migration
- architecture-level change
- docs/code/tests conflict

Level 4 should be targeted, not a full repository read.

---

## Task-Based Context Loading

### `new-feature`

Load:
- product overview/glossary if domain is relevant
- related existing feature docs
- architecture source map
- architecture boundaries/conventions
- related code patterns
- related tests

Expand when:
- feature overlaps existing behavior
- new API/data model/auth flow is needed
- unclear whether feature belongs to an existing module or a new module

---

### `change-feature`

Load:
- current feature spec/behavior
- feature API docs if interface changes
- feature data model docs if data changes
- feature test scenarios
- related code/tests

Expand when:
- current behavior differs between docs/code/tests
- existing tests encode behavior not documented
- change may affect other features

---

### `bugfix`

Load:
- bug report or user request
- relevant feature behavior
- related code path
- related tests
- recent related tasks if regression is suspected

Expand when:
- bug is not reproducible
- root cause is unclear
- multiple modules may be involved
- docs/code/tests disagree

Do not implement until the bug is understood well enough to define a likely root cause or a clearly scoped fix hypothesis.

---

### `refactor`

Load:
- architecture boundaries
- conventions
- source map
- affected feature behavior
- existing tests for affected behavior
- related source files

Expand when:
- public API might change
- module boundaries are unclear
- test coverage is weak
- refactor reveals behavior differences

If behavior must change, reclassify as `change-feature`.

---

### `migration`

Load:
- architecture overview/source-map
- affected feature docs
- data model docs
- related ADRs
- current code and tests
- deployment/runtime notes if relevant

Expand when:
- rollback risk exists
- data compatibility is uncertain
- multiple services/modules are affected

---

### `performance`

Load:
- affected feature behavior
- relevant runtime flow
- source code in hot path
- benchmarks, metrics, or reports if available
- tests that protect behavior

Expand when:
- optimization changes data access, caching, concurrency, or public behavior
- baseline is missing
- performance tradeoff affects correctness

---

### `security`

Load:
- architecture boundaries
- auth/access-control docs
- affected feature behavior
- API contracts
- data model/privacy notes
- related tests
- relevant ADRs

Expand when:
- permissions are unclear
- data exposure is possible
- validation or trust boundary changes
- secrets, tokens, auth, billing, or user data are involved

---

### `test-improvement`

Load:
- affected feature behavior
- feature test scenarios
- existing tests
- related code

Expand when:
- tests reveal undocumented behavior
- expected behavior is unclear
- tests would lock in questionable behavior

---

### `docs`

Load:
- docs being edited
- owning source of truth
- related code/tests only if needed to verify accuracy

Expand when:
- docs appear inconsistent with code/tests
- docs update changes product or architecture meaning

---

### `spike`

Load:
- user question
- product/architecture docs relevant to the research area
- source map
- related decisions
- representative code

Expand when:
- recommendation would affect architecture, data, API, security, or long-term workflow

---

## Source Selection Principles

Use `docs/index.md` to locate the owning documents for each context area.

When selecting sources:
- Prefer index files before scanning folders.
- Prefer durable docs for current truth.
- Prefer task docs for history, handoff, investigation, and recent change context.
- Prefer architecture and decision docs for constraints and tradeoffs.
- Always inspect source code before making non-trivial code changes.
- Always inspect relevant tests before changing behavior, refactoring, or fixing bugs.
- Treat docs/code/tests disagreement as ambiguity, not as permission to choose silently.

---

## Context Expansion Triggers

Expand context when any of the following is true:
- affected feature/module is unclear
- behavior is ambiguous
- docs, code, or tests disagree
- public API may change
- data model may change
- auth/security/billing is involved
- migration or rollback is needed
- regression risk is high
- test coverage is weak
- implementation reveals hidden coupling
- task crosses module boundaries
- task cannot be verified with the current context

---

## Stop Conditions

Stop and report instead of continuing when:
- user request conflicts with `AGENTS.md`
- user request conflicts with architecture or ADRs
- docs conflict with code/tests in a behavior-affecting way
- expected behavior is ambiguous
- task classification is uncertain and affects workflow materially
- security/auth/billing/data-integrity impact is unclear
- required verification is impossible or unreliable
- implementation would require a broad rewrite not requested
- source of truth cannot be determined

Report:
- what is unclear or conflicting
- which files/sources disagree
- why it matters
- recommended options
- what decision is needed

---

## Context Overload Rules

Avoid context overload by following these rules:
- Do not read all feature folders.
- Do not read all task folders.
- Do not read all ADRs.
- Start from indexes before opening detailed docs.
- Prefer directly relevant files over broad exploration.
- Summarize large findings before expanding further.
- Stop expanding when enough context exists to plan safely.
- If context becomes too large, write or update `handoff.md`.

---

## Context Refresh Rules

Refresh context when:
- the implementation plan changes materially
- new affected files/modules are discovered
- tests reveal unexpected behavior
- docs/code/tests conflict
- user changes requirements
- a task resumes after interruption
- context may be stale after significant edits

When refreshing, re-read only the affected docs/code/tests, not the entire context set.

---

## Minimum Context Before Implementation

Before implementation, the agent must know:
- task classification
- affected feature/module
- expected behavior or intended non-behavior-change
- relevant architecture constraints
- affected source files or likely search area
- relevant tests or verification strategy
- known risks, assumptions, or open questions

If these cannot be determined, do not implement yet.

---

## Minimum Context Before Completion

Before reporting completion, the agent must check:
- implementation matches the user request
- implementation respects relevant docs
- tests/checks were run or explicitly not run with reason
- durable docs were updated if behavior/API/data/test expectations changed
- task docs were updated if a task folder exists
- handoff is updated for non-trivial or incomplete work
- no unresolved conflicts remain

---

## Context Write Policy

Use `docs/index.md` as the canonical guide for write locations and promotion rules.

When writing context:
- Write temporary, task-specific, or investigative information to `docs/tasks/[task-folder]/`.
- Write only verified durable truth to feature, architecture, product, or decision docs.
- Do not promote task outputs into durable docs before verification, unless the task is documentation-only or planning-only.
- Update handoff when work is incomplete, risky, long-running, or likely to continue in another session.
- Do not write scratch notes into durable docs.

---

## Quick Decision Table

| Situation | Context Action |
|---|---|
| New session starts | Read Level 0 |
| Need to classify task | Read Level 1 |
| Known feature change | Read Level 2 |
| Bug root cause unclear | Expand to Level 3 or 4 |
| Security/data/auth involved | Expand to Level 3 or 4 |
| Refactor with weak tests | Expand to Level 3 |
| Docs/code/tests conflict | Stop and report |
| Task resumes from previous session | Read task handoff + task index |
| Context too large | Summarize and update handoff |
