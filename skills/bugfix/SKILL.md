---
name: bugfix
description: Use when diagnosing incorrect behavior, regressions, failing tests, runtime errors, or user-reported defects.
---

# Skill: Bugfix

## Use For

Diagnose incorrect behavior and define a minimal, verified fix.

## When NOT To Use

Do not use this skill when expected behavior is being intentionally changed; reclassify as `change-feature`.

## Key Moves

- Separate expected behavior from actual behavior.
- Reproduce the issue, or record why reproduction is not possible.
- Inspect related docs, code, tests, and recent task history when regression is suspected.
- Identify root cause or a specific fix hypothesis.
- Add or update regression coverage when practical.
- Verify the issue is fixed or the hypothesis is supported by evidence.

## The Four Phases

You MUST complete each phase before proceeding to the next.

### Phase 1: Root Cause Investigation

**BEFORE attempting ANY fix:**

1. **Read Error Messages Carefully**
   - Don't skip past errors or warnings
   - Read stack traces completely
   - Note line numbers, file paths, error codes

2. **Reproduce Consistently**
   - Can you trigger it reliably?
   - What are the exact steps?
   - Does it happen every time?
   - If not reproducible → gather more data, don't guess

3. **Check Recent Changes**
   - What changed that could cause this?
   - Git diff, recent commits
   - New dependencies, config changes

4. **Trace Data Flow**
   - Where does bad value originate?
   - What called this with bad value?
   - Keep tracing up until you find the source
   - Fix at source, not at symptom

### Phase 2: Pattern Analysis

**Find the pattern before fixing:**

1. **Find Working Examples**
   - Locate similar working code in same codebase
   - What works that's similar to what's broken?

2. **Compare Against References**
   - If implementing pattern, read reference implementation COMPLETELY
   - Don't skim - read every line

3. **Identify Differences**
   - What's different between working and broken?
   - List every difference, however small

### Phase 3: Hypothesis and Testing

**Scientific method:**

1. **Form Single Hypothesis**
   - State clearly: "I think X is the root cause because Y"
   - Write it down
   - Be specific, not vague

2. **Test Minimally**
   - Make the SMALLEST possible change to test hypothesis
   - One variable at a time
   - Don't fix multiple things at once

3. **Verify Before Continuing**
   - Did it work? Yes → Phase 4
   - Didn't work? Form NEW hypothesis
   - DON'T add more fixes on top

### Phase 4: Implementation

**Fix the root cause, not the symptom:**

1. **Create Failing Test Case**
   - Simplest possible reproduction
   - Automated test if possible
   - MUST have before fixing
   - Use test-driven-development skill

2. **Implement Single Fix**
   - Address the root cause identified
   - ONE change at a time
   - No "while I'm here" improvements

3. **Verify Fix**
   - Test passes now?
   - No other tests broken?
   - Issue actually resolved?

4. **If Fix Doesn't Work**
   - STOP
   - Count: How many fixes have you tried?
   - If < 3: Return to Phase 1, re-analyze
   - **If ≥ 3: STOP and question the architecture**
   - DON'T attempt Fix #4 without architectural discussion

## Iron Law

```txt
NO FIXES WITHOUT ROOT CAUSE INVESTIGATION FIRST
```

If you haven't completed Phase 1, you cannot propose fixes.

**Violating the letter of this rule is violating the spirit of debugging.**

## Output

- reproduction notes
- root cause or fix hypothesis
- minimal fix direction
- regression coverage or test gap
- verification notes

## Verification

Before reporting bugfix complete:

### Root Cause
- [ ] Root cause identified and documented
- [ ] Root cause explains all symptoms
- [ ] No "I think" or "probably" - evidence-based

### Reproduction
- [ ] Bug reproduced consistently before fix
- [ ] Reproduction steps documented
- [ ] Failing test created (Prove-It pattern)

### Fix
- [ ] Fix addresses root cause, not symptoms
- [ ] Single fix, not multiple changes
- [ ] Test passes after fix
- [ ] No regressions in other tests

### Evidence
- [ ] Test output recorded (before and after)
- [ ] Manual verification if applicable
- [ ] Residual risks documented

### If 3+ Fix Attempts
- [ ] Architecture questioned
- [ ] User consulted before continuing
- [ ] Alternative approaches considered

## Common Mistakes

Avoid:

- fixing symptoms without identifying cause
- redefining expected behavior without confirmation
- skipping reproduction when it is practical
- skipping regression coverage when risk warrants it

## Red Flags - STOP and Follow Process

If you catch yourself thinking:
- "Quick fix for now, investigate later"
- "Just try changing X and see if it works"
- "Add multiple changes, run tests"
- "Skip the test, I'll manually verify"
- "It's probably X, let me fix that"
- "I don't fully understand but this might work"
- "Here are the main problems: [lists fixes without investigation]"
- Proposing solutions before tracing data flow
- "One more fix attempt" (when already tried 2+)

**ALL of these mean: STOP. Return to Phase 1.**

**If 3+ fixes failed:** Question the architecture. Discuss with user before attempting more fixes.

## Examples

### Example 1: Regression Bug with Conflicting Sources

**Scenario:** User reports "task creation fails with special characters"

**Without ACM:**
```
Agent: <starts fixing validation regex based on user request alone>
```

**With ACM:**
```
1. Classify: bugfix
2. Load context:
   - .acm/features/task-creation/behavior.md → "titles accept Unicode"
   - src/validators/task.ts → current regex: /^[a-zA-Z0-9\s]+$/
   - tests/task-creation.test.ts → no Unicode tests
3. Reconcile: 
   - Durable says "Unicode accepted"
   - Code says "ASCII only"
   - Tests don't cover Unicode
   → CONFLICT: behavior-affecting disagreement
4. Stop and report:
   "Durable memory says titles accept Unicode, but code only accepts ASCII.
   Which is the intended behavior?
   - If Unicode: fix regex, add tests
   - If ASCII: update durable memory"
```

**Outcome:** User confirms ASCII-only is correct. Agent updates `.acm/features/task-creation/behavior.md` to match code.

### Example 2: Flaky Test Investigation

**Scenario:** User reports "auth test sometimes fails in CI"

**Without ACM:**
```
Agent: <re-runs test, sees it passes, reports "fixed">
```

**With ACM:**
```
1. Classify: bugfix
2. Load context:
   - .acm/tasks/2026-06-15-auth-test-flake/task.md → previous investigation
   - tests/auth.test.ts → test code
   - CI logs → failure pattern: fails 30% of runs
3. Reproduce:
   - Run test 10 times locally → 3 failures
   - Failure always on line 45: expect(token).toBeDefined()
4. Root cause:
   - Token generation is async
   - Test doesn't await token creation
   - Race condition: sometimes token not ready
5. Fix:
   - Add await before token generation
   - Add regression test that runs 100 times
6. Verify:
   - Run test 100 times → 0 failures
7. Update task record:
   - Document root cause and fix
   - No durable memory update (implementation detail)
```

**Outcome:** Flaky test fixed, regression coverage added, root cause documented in task record.

## Common Rationalizations

| Rationalization | Reality |
|---|---|
| "Issue is simple, don't need process" | Simple issues have root causes too. Process is fast for simple bugs. |
| "Emergency, no time for process" | Systematic debugging is FASTER than guess-and-check thrashing. |
| "Just try this first, then investigate" | First fix sets the pattern. Do it right from the start. |
| "I'll write test after confirming fix works" | Untested fixes don't stick. Test first proves it. |
| "Multiple fixes at once saves time" | Can't isolate what worked. Causes new bugs. |
| "I see the problem, let me fix it" | Seeing symptoms ≠ understanding root cause. |
| "One more fix attempt" (after 2+ failures) | 3+ failures = architectural problem. Question pattern, don't fix again. |

## Escalate When

- expected behavior is unclear
- reproduction is impossible and evidence is weak
- fix requires redefining product behavior

## Related Skills

- **test-driven-development**: Use Prove-It pattern (RED → GREEN → REFACTOR)
- **acm-task**: Classify as bugfix, load context before debugging
- **acm-memory**: Promote durable facts if behavior changed
- **acm-handoff**: Create handoff if bug is incomplete or risky
- **acm-adversarial-review**: Use for high-stakes bugs (security, data integrity)
