# Skill: Bugfix

## Purpose
Diagnose incorrect behavior and define a minimal, verified fix.

## Use When
- A task reports incorrect behavior, failing tests, regression, or runtime error.
- Root cause is unknown or only partially understood.
- Regression coverage is needed.

## Inputs
- Bug report, failing test, runtime error, or user-reported symptom.
- Expected behavior from feature docs, task docs, or user request.
- Actual behavior evidence, reproduction notes, logs, or screenshots when available.
- Related source files, tests, and recent task history if regression is suspected.

## Procedure
1. Capture expected behavior, actual behavior, symptoms, impact, and environment.
2. Reproduce the bug, or document why reproduction is not possible.
3. Inspect related feature docs, code, tests, and recent task history if regression is suspected.
4. Identify likely root cause and trigger conditions.
5. Define a minimal fix hypothesis.
6. Add or update regression tests when practical.
7. Verify the bug no longer reproduces or that the fix hypothesis is supported by the best available evidence.

## Outputs
- Bug report, reproduction, investigation, root-cause, and regression-test artifacts when applicable.
- Fix plan inputs.
- Verification notes.

## Completion Criteria
- Expected and actual behavior are clearly distinguished.
- Reproduction exists, or the inability to reproduce is documented with best available evidence.
- Root cause or fix hypothesis is specific enough to plan a minimal change.
- Regression coverage or an explicit test gap is recorded.

## Do Not
- Do not implement a fix before understanding the failure enough to scope it.
- Do not redefine expected behavior silently.
- Do not remove failing tests instead of fixing the underlying issue.
