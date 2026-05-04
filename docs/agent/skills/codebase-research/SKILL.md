# Skill: Codebase Research

## Purpose
Identify the smallest relevant part of the codebase before planning changes.

## Use When
- Starting a non-trivial implementation task.
- The affected module, feature, or test area is not yet confirmed.
- Docs, code, and tests need to be reconciled before editing.

## Procedure
1. Read `docs/index.md` and use it to locate the owning docs.
2. Read relevant feature, architecture, decision, or task docs.
3. Read `docs/architecture/source-map.md` to identify likely source areas.
4. Search code by domain terms, API names, error names, and paths from the source map.
5. Inspect related tests before implementation.
6. Summarize the affected files, current behavior, relevant tests, and open questions before writing or updating a plan.

## Outputs
- A context summary in the task folder when useful.
- Inputs for `impact-analysis` or `implementation-planning`.
- A list of relevant source files and tests.

## Do Not
- Do not start editing before identifying affected tests or a verification strategy.
- Do not assume naming from docs exactly matches code.
- Do not read the whole repository unless the impact area is genuinely unknown.
