# Skill: Implementation Planning

## Purpose
Convert understood requirements and impact into a concise, executable plan.

## Use When
- Before non-trivial implementation.
- After requirement analysis, codebase research, and impact analysis are sufficient.
- A task needs sequencing, verification, rollback, or risk control.

## Procedure
1. State task summary and classification.
2. Define intended behavior change or intended non-behavior-change.
3. List affected files, directories, and docs.
4. Break implementation into small ordered steps.
5. Define test and verification strategy.
6. Record risks, assumptions, open questions, and rollback/recovery notes when relevant.
7. Stop if the plan depends on unresolved behavior-affecting assumptions.

## Outputs
- `plan.md` in the task folder.
- Updated plan when scope or classification changes.

## Do Not
- Do not plan broad rewrites unless explicitly required.
- Do not skip tests/checks for behavior, data, API, security, or migration work.
- Do not continue with an invalid plan after discovering new scope.
