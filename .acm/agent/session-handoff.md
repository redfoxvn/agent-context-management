# Session Handoff

## Purpose

This file defines how agents create, update, and consume task handoffs.

A handoff preserves working state for another session. It is not durable feature truth.
For multi-phase work, handoff should reflect the state of the whole task outcome, not just the last part touched.

---

## When Handoff Is Needed

Create or update `handoff.md` when work is:

- incomplete
- blocked
- long-running
- risky
- partially verified
- dependent on assumptions or decisions
- changed by new user requirements
- difficult to reconstruct from docs/code diff alone

For trivial completed tasks, handoff is usually not required.

---

## Location

Task handoff belongs here:

```txt
.acm/tasks/[YYYY-MM-DD-task-slug]/handoff.md
```

Do not write handoff notes into `.acm/features/`, `.acm/architecture/`, `.acm/decisions/`, or `.acm/product/`.

---

## Format

Use this structure:

```md
# Handoff

## Current Status
- status: not-started | in-progress | blocked | partially-verified | completed
- task classification:
- related feature/module:
- last updated:
- overall outcome complete: yes | no

## Task Summary
...

## What Was Done
- ...

## Changed Files
| File | Change Summary | Notes |
|---|---|---|
| `path/to/file` | ... | ... |

## Important Context
- ...

## Decisions Made
| Decision | Reason | Where Recorded |
|---|---|---|
| ... | ... | ... |

## Verification
| Check | Command / Method | Result | Notes |
|---|---|---|---|
| ... | ... | passed / failed / not run | ... |

## Known Risks / Issues
- ...

## Remaining Work
- ...

## Phase Status
- Optional: list which phases/workstreams are complete, in progress, or deferred.

## Recommended Next Action
1. ...
```

Keep it short, concrete, and path-oriented.

---

## Quality Rules

A useful handoff:

- states current status clearly
- states whether completion applies to the whole outcome or only some internal phases
- lists changed files
- summarizes important context and decisions
- records verification and gaps
- lists known risks
- gives actionable remaining work
- links durable docs when durable truth changed

Avoid:

- long reasoning dumps
- vague notes like "worked on auth"
- copying full plans or logs
- claiming verification without result
- storing final feature behavior only in handoff
- marking a task `completed` when only one phase is complete

---

## Consuming Handoff

When continuing from handoff:

1. Read `handoff.md`.
2. Read key task artifacts if needed.
3. Re-read durable docs referenced by the handoff.
4. Inspect changed files and relevant tests.
5. Verify the handoff still matches current docs/code/tests.
6. Continue only if context is still valid.

If handoff conflicts with current docs/code/tests, stop, identify the conflict, update the handoff, and continue only after the conflict is resolved or documented.
