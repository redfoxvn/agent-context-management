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

## Output

- reproduction notes
- root cause or fix hypothesis
- minimal fix direction
- regression coverage or test gap
- verification notes

## Verification

Before reporting this work complete:

- record what evidence was inspected
- record checks that were run
- record checks that were skipped and why
- identify unresolved risks or ambiguity

## Common Mistakes

Avoid:

- fixing symptoms without identifying cause
- redefining expected behavior without confirmation
- skipping reproduction when it is practical
- skipping regression coverage when risk warrants it

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
| "I know what the bug is, I'll just fix it" | Reproduce first. 30% of "obvious" bugs have different root causes. |
| "The test is probably wrong" | Verify that assumption. If the test is wrong, fix the test. Don't skip it. |
| "It works on my machine" | Environments differ. Check CI, config, dependencies. |
| "I'll add a test later" | Later never comes. Add regression coverage now. |
| "This is a flaky test, ignore it" | Flaky tests mask real bugs. Investigate or fix the flakiness. |

## Escalate When

- expected behavior is unclear
- reproduction is impossible and evidence is weak
- fix requires redefining product behavior
