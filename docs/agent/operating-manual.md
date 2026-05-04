# Agent Operating Manual

## Purpose

This file defines the default operating behavior for coding agents working in this repository.

Use it to understand how to:
- handle user requests
- plan before editing code
- make safe implementation changes
- reconcile docs, code, and tests
- update context after work
- report results clearly

This file is intentionally high-level.

For detailed rules:
- context loading: `docs/agent/context-policy.md`
- task workflows: `docs/agent/task-workflow.md`
- source-of-truth and write locations: `docs/index.md`
- handoff details: `docs/agent/session-handoff.md`

---

## Operating Principles

### 1. Do not work from the user request alone

For non-trivial work, reconcile the user request with:
- `AGENTS.md`
- relevant docs
- source code
- tests

If these sources conflict in a behavior-affecting way, stop and report instead of guessing.

---

### 2. Keep work proportional to risk

Small changes should stay lightweight.  
Risky changes need stronger planning, context loading, verification, and handoff.

Do not create verbose task artifacts just to satisfy process.

---

### 3. Prefer existing patterns

Before introducing a new pattern, dependency, abstraction, or workflow, check whether the repository already has an appropriate one.

Prefer:
- local changes over broad rewrites
- existing conventions over new conventions
- clear code over clever code
- verified behavior over assumptions

---

### 4. Preserve durable truth

Use the correct context layer:
- task docs record what happened
- feature docs record what is true now
- architecture docs record durable technical constraints
- decision docs record why important choices were made
- product docs record domain and product meaning

Do not write temporary scratch notes into durable docs.

---

### 5. Be explicit about uncertainty

If expected behavior, architecture ownership, verification, or task classification is unclear, say so.

Do not silently resolve ambiguity when it affects:
- product behavior
- API contracts
- data integrity
- security
- auth/permissions
- billing
- architecture boundaries

---

## Request Handling

When receiving a user request:

- Identify the task classification.
- Decide whether the task is trivial or non-trivial.
- Identify the likely affected feature/module.
- Check whether the request may affect behavior, API, data, auth, security, billing, tests, or architecture.
- Load only the context needed to proceed safely.
- Clarify, stop, or document assumptions when ambiguity materially affects correctness.

If a safe assumption is made, record it in the task plan or response.

---

## Planning Behavior

Before non-trivial implementation, create a plan that covers:

- task summary
- task classification
- affected feature/module
- expected behavior change, or intended non-behavior-change
- affected files/directories or search area
- implementation steps
- verification strategy
- risks, assumptions, and open questions

The plan should be proportional to complexity.

Do not skip planning for:
- multi-file changes
- behavior changes
- API/data/auth/security changes
- migrations
- refactors with weak tests
- bugfixes with unclear root cause

---

## Implementation Behavior

When editing code:

- Make the smallest safe change.
- Keep changes localized when possible.
- Follow existing architecture, naming, style, and conventions.
- Respect module boundaries.
- Do not introduce new dependencies or frameworks without clear justification.
- Do not weaken validation, auth, permissions, error handling, logging, type safety, or tests.
- Do not remove tests unless the reason is documented.
- Do not silently change public API, data model, or user-visible behavior.
- Update or add tests when behavior changes.
- If implementation reveals new scope, pause and update the plan.

---

## Verification Behavior

Before reporting completion:

- Run the most relevant checks available.
- Prefer targeted tests before broad checks.
- Record commands and results when a task folder exists.
- Do not claim verification that was not performed.
- If verification is skipped or impossible, state why.
- If checks fail, report whether failures appear related to the change.

Suggested verification order:

1. targeted unit tests
2. targeted integration tests
3. typecheck
4. lint
5. build
6. e2e tests

Use project-specific judgment.

---

## Documentation Behavior

After implementation and verification, update context only where it belongs.

Use `docs/index.md` as the canonical guide for write locations and promotion rules.

Update durable docs when durable truth changes, such as:
- feature behavior
- API/interface contracts
- data model
- test expectations
- architecture boundaries, flows, or conventions
- product/domain meaning
- long-lived decisions

Do not promote unverified task notes into durable docs unless the task is documentation-only or planning-only.

---

## Handoff Behavior

Update handoff when work is:

- incomplete
- risky
- long-running
- likely to continue in another session
- difficult to reconstruct from git diff alone
- partially verified
- dependent on important assumptions or decisions

A useful handoff should summarize:
- current status
- task classification
- changed files
- important context
- decisions made
- tests/checks run
- known risks
- remaining work
- recommended next action

Use `docs/agent/session-handoff.md` for the detailed handoff format.

---

## Communication Behavior

When reporting back to the user:

- State what changed.
- State what was verified.
- State what was not verified, if any.
- State remaining risks or follow-up work.
- Mention assumptions and conflicts clearly.
- Keep routine implementation details concise.
- Do not claim completion if required verification or docs updates are missing.

For code changes, prefer concrete file/module references over vague summaries.

---

## Prohibited Behaviors

Do not:

- make broad rewrites without explicit need
- ignore existing docs or architecture rules
- treat task history as durable feature truth
- skip relevant tests for behavior changes
- weaken security, validation, auth, permissions, or data integrity
- delete or rewrite tests just to make the suite pass
- introduce new dependencies or frameworks without justification
- hide uncertainty
- silently resolve behavior-affecting conflicts
- write scratch notes into durable docs
- create verbose task artifacts for trivial changes

---

## Completion Checklist

Before considering work complete:

- [ ] Task classification is correct.
- [ ] Relevant context was loaded.
- [ ] Plan exists for non-trivial work.
- [ ] Implementation follows existing architecture and conventions.
- [ ] Tests/checks were run or verification gaps are documented.
- [ ] Durable docs were updated if durable truth changed.
- [ ] Task docs were updated if a task folder exists.
- [ ] Handoff was updated if needed.
- [ ] No unresolved conflict remains.
