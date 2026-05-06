# Skill: Test Design

## Use For

Design meaningful tests that verify observable behavior and protect against regressions.

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

## Escalate When

- expected behavior is unclear
- tests would lock in conflicting behavior
- coverage gaps create unacceptable risk
