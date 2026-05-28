# Task Profile: Bugfix

Use this profile with `.acm/templates/tasks/task.template.md`.

## Purpose

Use this profile when fixing incorrect behavior, regression, failing tests, or runtime errors.

## Additional Required Context

Capture:
- expected behavior
- actual behavior
- reproduction steps or why reproduction is unavailable
- affected code path
- root cause or fix hypothesis
- regression risk
- related tests or verification path

## Definition of Ready

Before implementation:
- expected behavior is grounded in docs, tests, code, or user clarification
- the bug is reproduced, or a fix hypothesis is explicitly documented
- likely affected areas are identified
- regression verification strategy exists or skipping is justified
- docs/code/tests conflicts are recorded instead of silently resolved

## Common Mistakes

Avoid:
- fixing symptoms without investigating cause
- redefining expected behavior without confirmation
- skipping regression coverage when feasible
- treating current implementation as intended behavior without evidence
