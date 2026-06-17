---
name: acm-handoff
description: Use when work is incomplete, blocked, risky, long-running, partially verified, or hard for another session to reconstruct.
---

# Skill: ACM Handoff

## Use For

Create or consume task handoff state for incomplete, risky, long-running, partially verified, or non-obvious work.

## Iron Law

```txt
NO SILENT LOSS OF CONTEXT
```

When work is incomplete, risky, long-running, or non-obvious, create or update handoff state. Do not assume the next session will remember. Do not assume the diff tells the whole story.

If you cannot answer "what would the next agent need to know?" then handoff is required.

**Violating the letter of this rule is violating the spirit of ACM.**

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

## Quality Checklist

A useful handoff:

- states current status clearly
- says whether the whole outcome is complete
- lists changed files
- records verification and gaps
- lists known risks
- gives one concrete next action
- links durable memory when durable truth changed

## Handoff Quality Verification

Before considering handoff complete, verify:

### Status
- [ ] Current status is accurate (not-started, in-progress, blocked, etc.)
- [ ] Overall outcome completeness is stated (yes/no)
- [ ] Last updated timestamp is current

### Context
- [ ] Task summary is clear and concise
- [ ] What was done is documented
- [ ] Changed files are listed with change summary
- [ ] Important context is captured (decisions, assumptions, risks)

### Verification
- [ ] Verification checks are listed
- [ ] Results are recorded (not "should pass")
- [ ] Skipped checks have reasons
- [ ] Gaps are explicit

### Next Steps
- [ ] Remaining work is listed
- [ ] Recommended next action is concrete
- [ ] Known risks are documented

### Durable Memory
- [ ] Links to durable memory when truth changed
- [ ] No handoff notes in durable locations
- [ ] Handoff is in task folder only

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

## Red Flags - STOP and Document

Stop when you notice:

- "The next session will figure it out"
- "The diff shows what changed" without context
- "It's almost done, no handoff needed"
- "I'll remember to continue this"
- Work is incomplete but no handoff exists
- Risky changes with no documentation
- Long-running work with no status update
- Non-obvious decisions with no rationale recorded

**ALL of these mean: STOP. Create or update handoff.md. Preserve context.**

## Common Rationalizations

| Rationalization | Reality |
|---|---|
| "The next session will figure it out" | They won't have your context. Write handoff. |
| "The diff shows what changed" | Diffs show code changes, not decisions, risks, or next steps. |
| "It's almost done, no handoff needed" | "Almost done" is incomplete. Handoff the remaining work. |
| "I'll remember to continue this" | Sessions don't persist. Write it down. |
| "Handoff is overhead" | Reconstructing context from scratch is more overhead. |

## Stale Handoff Handling

When consuming handoff, treat it as task history, not truth.

If handoff conflicts with current source, tests, durable memory, or user request, stop and record the conflict before continuing.
