# Review Checklist

## Purpose

This file defines the final review checklist coding agents should use before reporting a task as complete.

Use this file as a completion gate.

For related rules:
- context loading: `docs/agent/context-policy.md`
- task workflows: `docs/agent/task-workflow.md`
- source-of-truth and write locations: `docs/index.md`
- handoff protocol: `docs/agent/session-handoff.md`
- general operating behavior: `docs/agent/operating-manual.md`

---

## Core Rule

Do not report a task as complete until the result has been reviewed against:

- user request
- task scope
- relevant docs
- source code changes
- tests/checks
- documentation updates
- handoff needs
- unresolved risks or conflicts

If something was not verified, say so explicitly.

---

## Completion Gate

Before saying the task is complete, check:

- [ ] The user request was understood correctly.
- [ ] The task classification is still correct.
- [ ] The implemented scope matches the requested scope.
- [ ] No unrelated changes were introduced.
- [ ] Relevant architecture and conventions were respected.
- [ ] Relevant tests/checks were run, or gaps were documented.
- [ ] Durable docs were updated if durable truth changed.
- [ ] Task docs were updated if a task folder exists.
- [ ] Handoff was updated if needed.
- [ ] Remaining risks, assumptions, or verification gaps are known and reported.
- [ ] No unresolved behavior-affecting conflict remains.

---

## Request and Scope Review

Check:

- [ ] The final result directly addresses the user request.
- [ ] Acceptance criteria are satisfied, if provided.
- [ ] Any assumptions made during the task are documented.
- [ ] Out-of-scope work was avoided.
- [ ] If scope changed during implementation, the plan/task docs were updated.
- [ ] If the task should have been reclassified, it was reclassified before completion.

Stop before completion if:
- expected behavior is still unclear
- the implementation solves a different problem
- the change requires product/architecture decisions not yet made

---

## Code Review

Check:

- [ ] Changes are minimal and localized where possible.
- [ ] Existing patterns and conventions are followed.
- [ ] Module boundaries are respected.
- [ ] Public API or data model changes are intentional and documented.
- [ ] Error handling remains correct.
- [ ] Validation remains correct.
- [ ] Auth and permissions are not weakened.
- [ ] Type safety is not weakened.
- [ ] Logging/observability is not removed without reason.
- [ ] No unrelated formatting or cleanup was mixed into the task.
- [ ] No temporary debug code remains.
- [ ] No new dependency or framework was introduced without justification.

---

## Behavior Review

Check:

- [ ] Expected behavior matches relevant feature docs or documented task intent.
- [ ] Existing behavior that should be preserved remains preserved.
- [ ] Edge cases were considered when relevant.
- [ ] Error cases were considered when relevant.
- [ ] Permissions/access control behavior was considered when relevant.
- [ ] User-visible behavior changes are intentional.
- [ ] Breaking changes are documented and approved when relevant.

Stop before completion if:
- docs, code, and tests disagree about expected behavior
- behavior changed during a refactor
- tests pass but the behavior appears inconsistent with durable docs

---

## Verification Review

Check:

- [ ] Relevant targeted tests were run.
- [ ] Broader checks were run when risk justified them.
- [ ] Commands and results were recorded when task docs exist.
- [ ] Failed checks were investigated or clearly reported.
- [ ] Skipped checks have a reason.
- [ ] Manual verification is documented when automated tests are insufficient.
- [ ] The final answer does not claim verification that was not performed.

Suggested check order, when applicable:

1. targeted unit tests
2. targeted integration tests
3. typecheck
4. lint
5. build
6. e2e tests

Use project-specific judgment.  
Do not run irrelevant checks just to satisfy the checklist.

---

## Documentation Review

Check:

- [ ] Task docs were updated if a task folder exists.
- [ ] Feature docs were updated if current behavior changed.
- [ ] API docs were updated if interface contracts changed.
- [ ] Data model docs were updated if data shape/lifecycle changed.
- [ ] Test scenarios were updated if durable test expectations changed.
- [ ] Architecture docs were updated if boundaries, flows, or conventions changed.
- [ ] Decision docs were updated if a long-lived decision was made.
- [ ] Index files were updated if docs/features/tasks/decisions were added, renamed, deprecated, or removed.
- [ ] No temporary scratch notes were written into durable docs.

Use `docs/index.md` as the canonical guide for write locations and promotion rules.

---

## Handoff Review

Check whether handoff is needed.

Handoff is usually needed when:

- task is incomplete
- task is long-running
- context became large
- verification is incomplete
- work may continue in another session
- important assumptions or decisions were made
- implementation has known risks
- the next step is not obvious from code/docs alone

If handoff is needed, check:

- [ ] Current status is clear.
- [ ] Changed files are listed.
- [ ] Important context is summarized.
- [ ] Verification results are explicit.
- [ ] Known risks are listed.
- [ ] Remaining work is actionable.
- [ ] Recommended next action is concrete.

Use `docs/agent/session-handoff.md` for detailed handoff format.

---

## High-Risk Change Review

Apply this section when the task affects:

- auth
- permissions
- security
- billing
- data integrity
- migrations
- public API
- external integrations
- production runtime behavior
- cross-module architecture boundaries

Check:

- [ ] Risk was explicitly identified.
- [ ] Relevant architecture/decision docs were checked.
- [ ] Backward compatibility was considered.
- [ ] Rollback or recovery was considered when relevant.
- [ ] Tests/checks match the risk level.
- [ ] Verification gaps are explicitly reported.
- [ ] Durable docs were updated if durable truth changed.
- [ ] No risk was hidden behind a generic “done” response.

Stop before completion if the risk impact is still unclear.

---

## Final Response Review

Before responding to the user, ensure the final response includes:

- [ ] What changed.
- [ ] What was verified.
- [ ] What was not verified, if anything.
- [ ] Any important assumptions.
- [ ] Any remaining risks or follow-up work.
- [ ] Any conflicts or blockers, if unresolved.

Keep the final response concise.  
Do not include internal checklist details unless useful to the user.

---

## Stop Before Completion

Do not report completion when:

- required verification was not run and no reason is given
- expected behavior remains ambiguous
- docs/code/tests still conflict
- implementation exceeded requested scope
- security/auth/data/API risk is unresolved
- task classification is wrong or unresolved
- durable docs are stale after a behavior/API/data change
- handoff is needed but missing
- the task is blocked

Report the blocker, risk, or missing verification instead.

---

## Compact Completion Summary Format

When useful, report completion using this structure:

```txt
Done:
- ...

Verified:
- ...

Not verified:
- ...

Notes / risks:
- ...
