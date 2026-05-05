# Documentation Plan

## Task Summary
Refine task-folder granularity guidance so agents default to one task folder per user outcome and track multi-part work within that folder unless there is a real boundary requiring a separate task.

## Task Classification
docs

## Affected Docs
- `AGENTS.md`
- `docs/agent/operating-manual.md`
- `docs/agent/context-policy.md`
- `docs/agent/task-workflow.md`
- `docs/agent/session-handoff.md`
- `docs/templates/tasks/docs/plan.template.md`
- `docs/templates/tasks/docs/implementation-log.template.md`
- `docs/templates/tasks/docs/handoff.template.md`
- `docs/tasks/index.md`

## Update Strategy
1. Add a consistent default rule: one task folder per user outcome or logical feature/change.
2. Define when to keep work in one folder and when to split into a new folder.
3. Add multi-phase tracking guidance to workflow, handoff, and docs templates.
4. Keep the change lightweight and procedural without changing task classifications.

## Verification Strategy
- Check updated docs use consistent language about task-folder granularity.
- Check task creation guidance does not conflict across bootstrap, workflow, context, and handoff docs.
- Check template changes support phase tracking without forcing verbose artifacts.

## Risks, Assumptions, or Open Questions
- Assumption: tightly related parts of the same feature/change should stay in one task folder unless ship, verification, or risk boundaries differ materially.
- Risk: over-specifying split criteria could make the workflow rigid, so guidance should stay principle-based.
