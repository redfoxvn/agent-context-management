# Skill: Test Design

## Purpose
Design meaningful tests that verify observable behavior and protect against regressions.

## Use When
- Adding a feature, changing behavior, fixing a bug, refactoring risky code, or improving test coverage.
- Existing tests are missing, weak, flaky, or too implementation-focused.
- A task needs regression, edge-case, negative-case, or security-focused coverage.

## Inputs
- Expected behavior from feature docs, task intent, source code, and existing tests.
- Risk areas, edge cases, error cases, permissions/security cases, and regression concerns.
- Existing test structure, tools, fixtures, and verification constraints.
- Known coverage gaps or questionable behavior needing reconciliation.

## Procedure
1. Identify the expected behavior from feature docs, task intent, code, and existing tests.
2. Choose the smallest useful test level: unit, integration, e2e, or manual verification.
3. Cover critical flows, edge cases, error cases, and permissions/security cases when relevant.
4. Prefer tests of observable behavior over mocks of implementation details.
5. Define failing-first or regression evidence when practical.
6. Record scenarios covered and not covered.

## Outputs
- Test plan or regression-test artifact in the task folder.
- New or updated test cases when implementation proceeds.
- Feature test scenario updates if durable expectations change.

## Completion Criteria
- Expected behavior and test level are explicit.
- Critical flows and relevant edge, error, regression, and security cases are considered.
- Tests focus on observable behavior rather than implementation details.
- Covered and not-covered scenarios are recorded when useful.

## Do Not
- Do not add tests that only verify mocks.
- Do not lock in questionable behavior without reconciling docs/code/tests.
- Do not delete tests unless obsolete and documented.
