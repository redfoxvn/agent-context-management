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

## Escalate When

- expected behavior is unclear
- reproduction is impossible and evidence is weak
- fix requires redefining product behavior
