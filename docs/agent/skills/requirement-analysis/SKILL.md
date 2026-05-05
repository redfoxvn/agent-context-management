# Skill: Requirement Analysis

## Purpose
Turn a user request into clear scope, expected behavior, acceptance criteria, and open questions.

## Use When
- Starting `new-feature`, `change-feature`, or other behavior-affecting work.
- The user request has unclear scope, actors, constraints, or success criteria.
- The task may need reclassification before planning.

## Inputs
- User request or problem report.
- `docs/index.md` for source-of-truth locations.
- Relevant product or feature docs when domain behavior is involved.
- Existing task handoff if continuing prior work.

## Procedure
1. Restate the request in task-shaped terms.
2. Identify task classification and whether the work is trivial or non-trivial.
3. Identify actors, affected feature/module, in-scope work, and out-of-scope work.
4. Extract or propose acceptance criteria.
5. Check for ambiguity that affects behavior, API, data, security, billing, or architecture.
6. Stop for clarification when a safe assumption cannot be made.

## Outputs
- Request, scope, or feature-draft artifact in the task folder when applicable.
- Task classification and trivial/non-trivial decision.
- Acceptance criteria or success criteria.
- Explicit assumptions and open questions.

## Completion Criteria
- Task classification is known or the ambiguity is explicitly reported.
- In-scope and out-of-scope work are clear enough to plan.
- Behavior-affecting assumptions are either documented as safe or escalated for clarification.
- Acceptance criteria or success criteria exist for non-trivial work.

## Do Not
- Do not silently decide product behavior when the request is ambiguous.
- Do not expand scope beyond the user request without recording why.
- Do not skip source-of-truth checks for non-trivial work.
