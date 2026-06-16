---
name: acm-handoff
description: Use when work is incomplete, blocked, risky, long-running, partially verified, or hard for another session to reconstruct.
---

# Skill: ACM Handoff

## Use For

Create or consume task handoff state for incomplete, risky, long-running, partially verified, or non-obvious work.

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

## Location

Task handoff belongs at:

```txt
.acm/tasks/[YYYY-MM-DD-task-slug]/handoff.md
```

Do not write handoff notes into `.acm/features/`, `.acm/architecture/`, `.acm/decisions/`, or `.acm/project.md`.

## Format

Use this concise structure:

```md
# Handoff

## Current Status
- status: not-started | in-progress | blocked | partially-verified | completed
- task classification:
- related feature/module:
- last updated:
- overall outcome complete: yes | no

## Task Summary

## What Was Done

## Changed Files
| File | Change Summary | Notes |
|---|---|---|

## Important Context

## Decisions Made
| Decision | Reason | Where Recorded |
|---|---|---|

## Verification
| Check | Command / Method | Result | Notes |
|---|---|---|---|

## Known Risks / Issues

## Remaining Work

## Recommended Next Action
```

## Consuming Handoff

When continuing from handoff:

1. Read `handoff.md`.
2. Read key task artifacts if needed.
3. Re-read durable memory referenced by the handoff.
4. Inspect changed files and relevant tests.
5. Verify the handoff still matches current docs/code/tests.
6. Continue only if context is still valid.

If handoff conflicts with current docs/code/tests, stop, identify the conflict, update the handoff, and continue only after the conflict is resolved or documented.
