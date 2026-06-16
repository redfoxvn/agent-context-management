---
name: test-design
description: Use when adding or improving behavior tests, regression tests, verification scenarios, or test coverage expectations.
---

# Skill: Test Design

## Use For

Design meaningful tests that verify observable behavior and protect against regressions.

## When NOT To Use

Do not use this skill to lock in behavior that conflicts with durable memory, docs, or user intent.

## Key Moves

- Identify expected behavior from docs, code, and task intent.
- Choose the smallest useful test level.
- Cover critical flows, edge cases, regressions, and security cases when relevant.
- Prefer observable behavior over implementation details.
- Record what is and is not covered.
- Avoid locking in questionable behavior without reconciliation.

## Output

- test strategy
- regression or edge-case coverage
- covered and uncovered scenarios
- updated feature test expectations when needed

## Verification

Before reporting this work complete:

- record what evidence was inspected
- record checks that were run
- record checks that were skipped and why
- identify unresolved risks or ambiguity

## Common Mistakes

Avoid:

- testing implementation details instead of observable behavior
- adding brittle tests that mirror current internals
- locking in accidental behavior without reconciliation
- claiming correctness solely because new tests pass

## Escalate When

- expected behavior is unclear
- tests would lock in conflicting behavior
- coverage gaps create unacceptable risk
