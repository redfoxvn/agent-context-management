---
name: acm-completion
description: Use when finalizing ACM-guided work, reporting completion, or deciding whether verification, durable memory, or handoff is still needed.
---

# Skill: ACM Completion

## Use For

Final review before reporting work as complete.

## Core Principle

Evidence before claims.

Do not report work as complete, fixed, verified, or passing unless fresh evidence supports that claim.

## Iron Law

```txt
NO COMPLETION CLAIMS WITHOUT FRESH VERIFICATION EVIDENCE
```

If you haven't run the verification command in this session, you cannot claim it passes. "Should work" is not evidence. "Tests pass" without running them is lying.

Before reporting completion:
1. IDENTIFY what evidence proves the claim
2. RUN the verification (fresh, in this session)
3. READ the actual output
4. REPORT the actual result, including gaps

**Violating the letter of this rule is violating the spirit of ACM.**

## Definition of Done

Work is DONE only when, in THIS session, you have:

- run the project's verification commands and pasted the actual output,
- created or updated the task record, and
- updated durable memory if current truth changed — including promoting verified
  feature behavior to `.acm/features/[feature]/` and refreshing the architecture
  summary.

Until all three are true, report status and the gap — not "done".

## Completion Gate

Do not report completion until these are true or explicitly reported as gaps:

- The result addresses the user request.
- Task classification is still correct.
- Scope did not silently expand.
- Relevant docs, code, and tests were reconciled.
- Changes are minimal and follow existing patterns.
- Relevant checks were run, or skipped checks have reasons.
- Durable memory was updated if current truth changed.
- Task docs were updated if a task folder exists.
- Handoff was updated when needed.
- No unresolved behavior-affecting conflict remains.

## Code / Behavior Review

Check that:

- public API and data model changes are intentional and documented
- validation, auth, permissions, error handling, logging, and type safety are not weakened
- no unrelated formatting, cleanup, or debug code remains
- behavior matches durable memory or documented task intent
- edge cases, error cases, and permissions are considered when relevant
- refactors preserve behavior

Stop before completion if docs, code, and tests still disagree about expected behavior.

## Verification Review

Prefer targeted checks before broad checks. Broader checks are appropriate when risk justifies them.

Record important commands and results in the task record when one exists.

## Comprehensive Verification Checklist

Before reporting completion, verify:

### Evidence
- [ ] Fresh verification run in this session (not "should pass")
- [ ] Actual output recorded (not "tests pass")
- [ ] Skipped checks documented with reasons
- [ ] No "I'm confident" without evidence

### Scope
- [ ] Changes match user request
- [ ] No silent scope expansion
- [ ] Unrelated changes excluded
- [ ] No "while I'm here" modifications

### Reconciliation
- [ ] Docs, code, and tests agree on behavior
- [ ] Durable memory updated if truth changed
- [ ] Task record updated if task folder exists
- [ ] No unresolved behavior-affecting conflicts

### Code Quality
- [ ] No weakened validation/auth/error handling
- [ ] No exposed secrets
- [ ] No discarded unrelated work
- [ ] No formatting/debug code remaining
- [ ] Behavior matches durable memory or task intent

### Safety
- [ ] No destructive commands without approval
- [ ] No secrets in commits
- [ ] No discarded user work
- [ ] Read-only inspection before mutation

### Handoff
- [ ] Handoff updated if work incomplete/risky
- [ ] Next steps documented
- [ ] Known risks recorded

### Verification Order (suggested)
1. Targeted unit tests
2. Targeted integration tests
3. Typecheck
4. Lint
5. Build
6. E2E tests (if applicable)
7. Documentation/reference checks

**If no reliable verification exists, say that instead of implying success.**

## Claim Check

Before making a success claim:

1. Identify what evidence proves the claim.
2. Run or inspect the relevant check.
3. Read the result.
4. Report the actual result, including gaps.

If no reliable verification exists, say that instead of implying success.

Suggested order:

1. targeted unit tests
2. targeted integration tests
3. typecheck
4. lint
5. build
6. e2e tests
7. documentation/reference checks

## Tool Safety

- Prefer read-only inspection before mutation.
- Prefer scoped commands over broad commands.
- Prefer existing repo scripts over ad-hoc commands.
- Do not expose secrets or sensitive data.
- Do not discard unrelated working-tree changes.
- Require explicit approval before destructive commands, pushes, deploys, releases, or history rewrites.

## Red Flags - STOP and Verify

Stop when you notice:

- "Should work now" without running verification
- "I'm confident it passes" without evidence
- "Tests passed earlier" without re-running
- "I'll verify after I commit"
- "The change is small, no need to check"
- Expressing satisfaction before verification ("Great!", "Done!", "Perfect!")
- About to report completion without fresh evidence
- Trusting memory instead of running commands
- Skipping checks "to save time"

**ALL of these mean: STOP. Run verification. Read output. THEN report.**

## Common Rationalizations

| Rationalization | Reality |
|---|---|
| "Should work now" | RUN the verification. "Should" is not evidence. |
| "I'm confident it passes" | Confidence ≠ evidence. Run the command. |
| "Tests passed earlier" | Earlier is not this session. Run them again. |
| "I'll verify after I commit" | Verify before commit. Commits are save points, not verification gates. |
| "The change is small, no need to check" | Small changes break things. Verify proportionally. |
| "Lint passed, so it's good" | Lint checks style, not behavior. Run tests. |
| "It's a routine feature, no record needed" | Routine features are where silent breakage hides. Record and verify. |
| "I ran the tests in my head / last edit was tiny" | Run them now, in this session, and paste the output. |

## Final Response

State:

- what changed
- what was verified
- what was not verified
- remaining risks or follow-up work
- blockers or conflicts, if any

Do not say checks passed unless they were run in the current task. Do not hide skipped checks.

At task end, offer a commit as a save point. Do not commit without the user's approval.
