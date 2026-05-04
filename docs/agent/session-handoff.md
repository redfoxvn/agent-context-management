# Session Handoff

## Purpose

This file defines how coding agents should create, update, and consume handoff notes when work may continue across sessions or agents.

A handoff should preserve enough working context for another session to continue safely without re-discovering everything from scratch.

This file only defines the handoff protocol.

For related rules:
- task workflows: `docs/agent/task-workflow.md`
- context loading and refresh: `docs/agent/context-policy.md`
- source-of-truth and write locations: `docs/index.md`
- general operating behavior: `docs/agent/operating-manual.md`

---

## Core Rule

Create or update a handoff when work is not fully self-contained, obvious, and complete.

A useful handoff should answer:

- What task is this?
- What has already been done?
- What is the current state?
- What context matters most?
- What files changed?
- What decisions were made?
- What was verified?
- What is still unknown or risky?
- What should the next session do first?

Do not use handoff as a replacement for durable docs.  
Handoff captures working state, not final source of truth.

---

## When to Create or Update Handoff

Create or update handoff when:

- task is incomplete
- task is long-running
- context is getting large
- work may continue in another session
- task crosses multiple files or modules
- implementation has known risks
- verification is incomplete
- important assumptions were made
- important decisions were made
- user requirements changed mid-task
- unexpected behavior or coupling was discovered
- the next step is not obvious from the git diff alone

For trivial completed tasks, handoff is usually not required.

---

## Handoff Location

For task-specific work, write handoff to:

```txt
docs/tasks/[YYYY-MM-DD-task-slug]/handoff.md
```

If a task folder does not exist and the work is non-trivial, create the task folder according to `docs/agent/task-workflow.md`.

Do not write task handoff into:

* `docs/features/`
* `docs/architecture/`
* `docs/decisions/`
* `docs/product/`

Those locations are for durable truth, not working state.

---

## Handoff Format

Use this structure for `handoff.md`:

```md
# Handoff

## Current Status
- status: not-started | in-progress | blocked | partially-verified | completed
- task classification:
- related feature/module:
- last updated:

## Task Summary
Briefly describe the task and intended outcome.

## What Was Done
- ...

## Changed Files
| File | Change Summary | Notes |
|---|---|---|
| `path/to/file` | ... | ... |

## Important Context
- Key docs/code/tests that matter
- Non-obvious constraints
- Important assumptions
- Relevant prior task notes

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

## Recommended Next Action
1. ...
2. ...
3. ...
```

Keep handoff concise.
Prefer concrete paths, commands, and next actions over broad summaries.

---

## Writing Guidelines

A good handoff is:

* specific enough for another agent to continue
* short enough to scan quickly
* explicit about uncertainty
* clear about what was verified and what was not
* clear about changed files and remaining work
* linked to durable docs when durable truth was updated

Avoid:

* vague summaries like “worked on auth”
* long reasoning dumps
* copying entire plans or logs
* undocumented assumptions
* claiming verification without command/result
* storing final feature behavior only in handoff

---

## What Belongs in Handoff

Include:

* current status
* task classification
* related feature/module
* changed files
* important constraints
* assumptions
* decisions made during the session
* tests/checks run
* verification gaps
* known risks
* remaining work
* recommended next action

Do not include:

* full durable feature specification
* complete architecture documentation
* temporary scratchpad noise
* unrelated investigation notes
* sensitive exploit details beyond remediation context
* full logs unless essential

---

## Updating Handoff During Work

Update handoff when:

* the plan changes materially
* a new affected module/file is discovered
* a major decision is made
* verification results change
* a blocker appears
* user changes the requirement
* work stops before completion
* context is becoming too large to keep in session

For active work, handoff can be updated incrementally.
Before ending a session, make sure it reflects the latest state.

---

## Consuming Handoff in a New Session

When continuing a task from handoff:

1. Read the task `handoff.md`.
2. Read the task folder index or key task artifacts if needed.
3. Re-read relevant durable docs referenced by the handoff.
4. Inspect changed files and related tests.
5. Verify whether the handoff still matches current code/docs.
6. Continue from the recommended next action only if the context is still valid.

Do not trust handoff blindly.
Treat it as a working-state summary that must be reconciled with current docs, code, and tests.

---

## Stale or Conflicting Handoff

A handoff may be stale if:

* code changed after the handoff was written
* durable docs changed after the handoff
* tests now fail differently
* task requirements changed
* another task modified the same feature/module
* handoff claims verification that no longer applies

If handoff conflicts with current docs/code/tests:

1. Stop.
2. Identify what changed or conflicts.
3. Reconstruct current state from durable docs, code, and tests.
4. Update the handoff with the new state.
5. Continue only when the conflict is resolved or clearly documented.

For general conflict handling, follow `docs/agent/context-policy.md`.

---

## Completed Task Handoff

For completed non-trivial tasks, handoff should still capture:

* final status
* key changed files
* verification performed
* durable docs updated
* known follow-up work
* residual risks, if any

If everything is complete and obvious from the task docs, keep this section short.

---

## Blocked Task Handoff

For blocked tasks, handoff must include:

* blocker summary
* why the task cannot continue
* what was already checked
* what decision/input is needed
* safest next action
* files that should not be changed until resolved

Do not continue by guessing if the blocker affects behavior, security, data integrity, public API, or architecture boundaries.

---

## Handoff Quality Checklist

Before ending a non-trivial session, check:

* [ ] Current status is clear.
* [ ] Task classification is listed.
* [ ] Related feature/module is identified.
* [ ] Changed files are listed.
* [ ] Important context is summarized.
* [ ] Decisions are recorded or linked.
* [ ] Verification results are explicit.
* [ ] Known risks are listed.
* [ ] Remaining work is actionable.
* [ ] Recommended next action is concrete.
* [ ] Handoff does not replace durable docs.
