# Skill: Decision Recording

## Purpose
Decide whether a durable decision should be recorded and capture the reasoning in the right place.

## Use When
- A task introduces or changes architecture, patterns, dependencies, security posture, data shape, or long-lived workflow.
- Multiple viable options exist and the chosen direction should survive beyond the task.
- A spike produces a recommendation that may become policy or architecture.

## Procedure
1. Identify the decision, alternatives, and constraints.
2. Decide whether task notes are enough or an ADR is needed.
3. Use `docs/templates/adr.template.md` for durable ADRs.
4. Link related task, feature, architecture, or product docs.
5. Record consequences, tradeoffs, and follow-up work.
6. Update `docs/decisions/index.md` when ADRs are added or changed.

## Outputs
- Decision notes in task docs.
- ADR under `docs/decisions/` when needed.
- Updated decisions index when applicable.

## Do Not
- Do not create ADRs for minor local choices.
- Do not hide important tradeoffs in implementation logs only.
- Do not record sensitive exploit details beyond remediation context.
