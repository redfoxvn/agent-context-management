# Skill: Session Handoff

## Purpose
Preserve enough context for another agent or session to continue safely.

## Use When
- Work is incomplete, risky, long-running, or partially verified.
- Important assumptions, decisions, blockers, or verification gaps exist.
- Context is getting large or the next step is not obvious from the diff.

## Procedure
1. Use `docs/agent/session-handoff.md` as the format guide.
2. Record current status, classification, related feature/module, and last updated date.
3. Summarize what was done and changed files.
4. Record important context, decisions, verification, risks, and remaining work.
5. Provide a concrete recommended next action.
6. Update the handoff before ending the task or when material state changes.

## Outputs
- `handoff.md` in the task folder.
- Final task status that matches verification state.

## Do Not
- Do not use handoff as durable feature truth.
- Do not omit verification gaps.
- Do not leave stale status after completing or blocking work.
