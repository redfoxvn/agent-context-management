# Documentation Plan

## Task Summary
Create missing task template directories and files for the remaining task classifications defined by `docs/agent/task-workflow.md`.

## Task Classification
docs

## Affected Docs
- `docs/templates/tasks/migration/`
- `docs/templates/tasks/performance/`
- `docs/templates/tasks/security/`
- `docs/templates/tasks/test-improvement/`
- `docs/templates/tasks/spike/`
- `docs/tasks/index.md`
- `docs/tasks/2026-04-26-add-missing-task-templates/`

## Update Strategy
1. Create missing template directories with concise markdown skeletons.
2. Ensure each classification has the core files needed by agent workflow: `plan`, `implementation-log` where applicable, `verification`, and `handoff`.
3. Add classification-specific templates for distinct concerns such as rollback, baselines, threat analysis, coverage analysis, options, and recommendation.
4. Update task index and this task's implementation log, verification, and handoff.

## Verification Strategy
- Check that every classification in `task-workflow.md` has a matching template directory.
- Check that required core templates exist for the newly added classifications.
- Search for stale references to missing template paths.

## Risks, Assumptions, or Open Questions
- Skill normalization remains separate; templates may reference workflows whose skills are not fully implemented yet.
- Some artifact names are normalized to `plan.template.md` even when workflow prose uses more specific labels.
