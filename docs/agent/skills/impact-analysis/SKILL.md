# Skill: Impact Analysis

## Purpose
Identify what a task may affect before implementation.

## Use When
- A task changes behavior, structure, tests, data, API, security, runtime, or docs.
- The regression risk or blast radius is unclear.
- A plan needs affected files, modules, and verification strategy.

## Inputs
- Requirement/scope summary.
- Codebase research findings.
- Relevant feature, architecture, decision, and task docs.
- Relevant source files and tests.
- Current task classification.

## Procedure
1. Identify affected features, modules, layers, and entry points.
2. Check API, data model, auth, permissions, external services, and runtime impact.
3. Identify tests that should change or protect behavior.
4. Identify docs that may need task updates or durable updates.
5. List compatibility, rollback, security, and regression risks.
6. Mark unknowns that require expanded context or clarification.

## Outputs
- Impact-analysis artifact in the task folder when applicable.
- Affected files/directories for the implementation plan.
- Risk and verification inputs.
- Durable docs that may need updates.

## Completion Criteria
- Affected features/modules/layers are identified or explicitly unknown.
- API, data, auth/security, external integration, and runtime impacts are checked when relevant.
- Tests and verification areas are identified.
- Risks and required context expansion are explicit before planning.

## Do Not
- Do not treat impact as limited to files directly edited.
- Do not ignore tests that encode current behavior.
- Do not hide security, data, API, or auth impact under generic risk wording.
