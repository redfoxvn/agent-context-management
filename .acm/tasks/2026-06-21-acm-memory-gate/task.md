# Task: Close the acm-memory promotion gap

## Classification
refactor + docs (behavior-shaping)

## Summary
Re-test of the reliability fixes (PR #12, v0.1.1) on team-tasks: the agent created
a task record and ran verification, but STILL skipped `acm-memory` and never wrote
`.acm/features/`. Self-report confirmed: the hook contract governed, but its
Definition of Done only required "verification + output"; promotion lived in
`acm-completion`/`acm-memory`, which the agent did not invoke ("applied completion
manually"). The chain implementation → acm-completion → acm-memory relied on the
agent choosing to open acm-completion.

## Root cause
Promotion was gated inside a skill the agent won't open, not in the always-present
hook contract that actually governs the session.

## What Changed
| File | Change |
|---|---|
| `hooks/session-start.sh` | Gate 2 (Definition of Done) now includes: if verified behavior changed, record durable facts in `.acm/features/<feature>/behavior.md`, and run the acm-completion gate before reporting done. Promotion is now in the always-loaded floor. |
| `skills/acm-task/SKILL.md` | New "Finishing the Task" section (Option A): MUST run acm-completion before reporting done; it routes to acm-memory when behavior changed. |
| `skills/acm-completion/SKILL.md` | Completion Gate (Option B): if verified behavior changed, invoke acm-memory + create `.acm/features/[feature]/behavior.md` before done — "completion is not done until promotion is decided". Red flags for "applying completion manually then skipping acm-memory". |
| `skills/acm-memory/SKILL.md` | Verification: require `.acm/features/index.md` listing features when `.acm/features/` exists (the re-test created a feature doc but missed the index). |

## Verification
See `verification.md`. Static checks pass; the real test is another instruction-free
team-tasks run confirming `.acm/features/auth/behavior.md` + `index.md` get created
without prompting.
