# Review Checklist

## Purpose

This file is the final completion gate before an agent reports work as done.

Use it to check the result against the request, scope, docs, code, tests, verification, and handoff needs.

---

## Completion Gate

Do not report completion until these are true or explicitly reported as gaps:

- The result addresses the user request.
- Task classification is still correct.
- Scope did not silently expand.
- Relevant docs, code, and tests were reconciled.
- Changes are minimal and follow existing patterns.
- Relevant checks were run, or skipped checks have reasons.
- Durable docs were updated if current truth changed.
- Task docs were updated if a task folder exists.
- Handoff was updated when needed.
- No unresolved behavior-affecting conflict remains.

---

## Code / Behavior Review

Check:

- public API and data model changes are intentional and documented
- validation, auth, permissions, error handling, logging, and type safety are not weakened
- no unrelated formatting, cleanup, or debug code remains
- behavior matches feature docs or documented task intent
- edge cases, error cases, and permissions are considered when relevant
- refactors preserve behavior

Stop before completion if docs, code, and tests still disagree about expected behavior.

---

## Verification Review

Check:

- targeted checks were preferred before broad checks
- broader checks were run when risk justified them
- commands/methods and results are recorded in `verification.md` when a task folder exists
- failures are investigated or clearly reported
- skipped checks have reasons
- final response does not claim verification that was not performed

Suggested order:

1. targeted unit tests
2. targeted integration tests
3. typecheck
4. lint
5. build
6. e2e tests

---

## Documentation Review

Check:

- task docs record what happened
- feature docs record current behavior when behavior changed
- API/data/test scenario docs are updated when contracts or expectations changed
- architecture docs are updated when boundaries, flows, or conventions changed
- ADRs are updated when long-lived decisions were made
- indexes are updated when important docs are added, renamed, deprecated, or completed
- no scratch notes were written into durable docs

---

## Handoff Review

Handoff is usually needed when work is:

- incomplete
- risky
- long-running
- partially verified
- dependent on assumptions or decisions
- hard to reconstruct from the diff alone

If needed, ensure `handoff.md` includes status, changed files, important context, decisions, verification, risks, remaining work, and next action.

---

## Final Response

Final response should state:

- what changed
- what was verified
- what was not verified
- remaining risks or follow-up work
- blockers or conflicts, if any
