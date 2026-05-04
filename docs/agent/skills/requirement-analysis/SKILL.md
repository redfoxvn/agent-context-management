# Skill: Requirement Analysis

## Purpose
Turn a user request into clear scope, expected behavior, acceptance criteria, and open questions.

## Use When
- Starting `new-feature`, `change-feature`, or other behavior-affecting work.
- The user request has unclear scope, actors, constraints, or success criteria.
- The task may need reclassification before planning.

## Procedure
1. Restate the request in task-shaped terms.
2. Identify task classification and whether the work is trivial or non-trivial.
3. Identify actors, affected feature/module, in-scope work, and out-of-scope work.
4. Extract or propose acceptance criteria.
5. Check for ambiguity that affects behavior, API, data, security, billing, or architecture.
6. Stop for clarification when a safe assumption cannot be made.

## Outputs
- Request or scope artifact in the task folder.
- Acceptance criteria or success criteria.
- Assumptions and open questions.

## Do Not
- Do not silently decide product behavior when the request is ambiguous.
- Do not expand scope beyond the user request without recording why.
- Do not skip source-of-truth checks for non-trivial work.
