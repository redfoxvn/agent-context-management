# Agent Failure Modes

## Purpose

This file lists common ways coding agents fail in this repository and how to avoid them.

Use it as a quick risk reminder before planning, implementing, or reporting completion.

---

## Context Failures

### Working From User Request Alone

Problem: agent edits before reconciling docs, code, and tests.

Avoid by loading the relevant context from `docs/index.md` and `docs/agent/context-policy.md`.

### Over-Reading

Problem: agent reads too much context and loses task focus.

Avoid by using context depth levels and stopping once the plan is safe.

### Trusting One Source Blindly

Problem: docs, code, tests, or user request is treated as automatically correct.

Avoid by surfacing behavior-affecting conflicts.

### Using Task Docs As Current Truth

Problem: old task notes override feature docs.

Avoid by treating `docs/features/` as current behavior and `docs/tasks/` as history.

### Promoting Unverified Notes

Problem: task hypotheses become durable docs before verification.

Avoid by promoting only verified current truth, except for documentation-only or planning-only tasks.

---

## Implementation Failures

### Refactoring Across Boundaries Too Early

Prefer localized changes unless the task explicitly requires broader refactor.

### Weakening Validation Or Security

Client-side validation is UX only. Server-side validation, auth, permissions, and data integrity must remain authoritative.

### Editing Generated Files

Update the source schema/config and regenerate instead of manually editing generated output.

### Adding Tests That Only Verify Mocks

Tests should verify observable behavior, not only implementation details.

### Ignoring Backward Compatibility

For public API, database, auth, and migration changes, check compatibility and rollback requirements.

---

## Completion Failures

### Claiming Verification Not Run

Never say work is verified unless checks were actually run or manual verification was performed.

### Missing Handoff

If work is incomplete, risky, long-running, or partially verified, update `handoff.md`.

### Leaving Indexes Stale

When adding, renaming, deprecating, or completing important docs, update relevant indexes.

### Hiding Residual Risk

Report remaining risks, skipped checks, blockers, and assumptions explicitly.
