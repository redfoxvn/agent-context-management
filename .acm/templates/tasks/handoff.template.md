# Handoff

Purpose:
Preserve enough working state for another session or agent to continue safely without reconstructing context from scratch.

Write when:
- work is incomplete, risky, blocked, long-running, partially verified, or difficult to reconstruct from the diff alone
- a session ends before the full outcome is complete

Definition of useful handoff:
- current task status is explicit
- changed areas and verification state are visible
- blockers, risks, and remaining work are actionable
- next action is concrete
- durable truth changes are linked to the correct durable docs when applicable

- status:
- classification:
- related feature/module:
- last updated:
- overall outcome complete: yes | no

## Done

Purpose:
Summarize the meaningful work already completed.

Write when:
- implementation, investigation, verification, or documentation work finishes

Definition of ready:
- completed work is concrete and task-relevant
- major changed areas are understandable without reading the full diff

Content:

- ...

## Changed Files

Purpose:
Identify the most important files changed during the task.

Write when:
- code, docs, tests, configuration, or scripts are modified

Definition of ready:
- file paths are accurate
- change summaries are concise and useful for continuation

| File | Change |
|---|---|
| ... | ... |

## Verification

Purpose:
Summarize the current verification state for the next session or reviewer.

Write when:
- any verification work is performed or skipped

Definition of ready:
- verification coverage and gaps are visible
- failures, skipped checks, or partial verification are explicit

Content:

- ...

## Risks / Blockers

Purpose:
Record unresolved risks, blockers, or uncertainty that affect continuation.

Write when:
- implementation, rollout, compatibility, or verification risk remains
- external decisions or missing context block progress

Definition of ready:
- blockers are actionable
- residual risks are explicit instead of implied

Content:

- ...

## Remaining Work

Purpose:
Describe the work still required before the overall outcome is complete.

Write when:
- task is not fully complete
- rollout, follow-up, cleanup, or additional verification remains

Definition of ready:
- remaining work is specific and prioritized enough for continuation
- unfinished phases are distinguishable from optional follow-up ideas

Content:

- ...

## Next Action

Purpose:
State the immediate recommended next step.

Write when:
- ending a session or pausing work

Definition of ready:
- next action is concrete and executable
- dependencies or blockers are visible

Content:

- ...
