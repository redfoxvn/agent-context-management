# Skill: Refactor

## Purpose
Improve internal structure while preserving externally observable behavior.

## Use When
- The task is classified as `refactor`.
- Code structure, naming, boundaries, or maintainability need improvement without behavior change.
- Existing tests or characterization tests are needed to protect behavior.

## Procedure
1. Define refactor motivation, scope, and non-goals.
2. Identify behavior and public contracts that must remain unchanged.
3. Check architecture boundaries and conventions.
4. Identify existing tests or add characterization tests when risk warrants it.
5. Plan small incremental changes.
6. Verify behavior preservation after changes.
7. Reclassify as `change-feature` if behavior must change.

## Outputs
- Refactor motivation, scope, constraints, behavior-preservation, plan, and verification artifacts.
- Updated architecture docs only if durable structure changes.

## Do Not
- Do not mix behavior changes into a refactor.
- Do not cross module boundaries without understanding architecture constraints.
- Do not perform broad formatting unless formatting is the task.
