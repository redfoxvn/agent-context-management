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

Before reporting test design complete:

### Behavior Basis

- [ ] Expected behavior traced to user request, durable memory, source, or accepted decision
- [ ] Conflicts between docs, code, and tests reconciled or reported
- [ ] Test intent describes observable behavior, not implementation details
- [ ] Questionable behavior is not locked in without confirmation

### Coverage

- [ ] Critical happy paths covered
- [ ] Edge cases and errors covered where risk warrants
- [ ] Regression scenarios covered for known bugs
- [ ] Security or permission cases covered when relevant

### Test Quality

- [ ] Smallest useful test level chosen
- [ ] Tests are deterministic and isolated enough for the repo
- [ ] Mocks used only where they clarify boundaries or avoid unavoidable cost
- [ ] Assertions verify meaningful outcomes

### Evidence

- [ ] Tests were run and results recorded
- [ ] Skipped tests or coverage gaps documented with reasons
- [ ] Residual risks or untested scenarios documented
- [ ] Durable feature expectations updated when verified behavior changed

## Common Mistakes

Avoid:

- testing implementation details instead of observable behavior
- adding brittle tests that mirror current internals
- locking in accidental behavior without reconciliation
- claiming correctness solely because new tests pass

## Related Skills

- **acm-task**: Reconcile expected behavior before designing tests
- **test-driven-development**: Use when tests should drive implementation
- **bugfix**: Create regression tests that reproduce defects before fixing
- **security-remediation**: Add negative tests for security-sensitive behavior
- **acm-memory**: Promote verified behavior expectations to durable feature docs

## Escalate When

- expected behavior is unclear
- tests would lock in conflicting behavior
- coverage gaps create unacceptable risk
