# Documentation Plan

## Task Summary
Create a consistent skill documentation set matching the skills referenced by `docs/agent/task-workflow.md`.

## Task Classification
docs

## Affected Docs
- `docs/agent/skills/`
- `docs/agent/task-workflow.md`
- `docs/tasks/index.md`
- `docs/tasks/2026-04-26-normalize-agent-skills/`

## Update Strategy
1. Extract the unique skill names referenced by `docs/agent/task-workflow.md`.
2. Add `docs/agent/skills/index.md`.
3. Create or update `docs/agent/skills/<skill-name>/SKILL.md` for each referenced skill.
4. Add a short skill-loading convention to `docs/agent/task-workflow.md`.
5. Update task index and task handoff.

## Verification Strategy
- Check every workflow-referenced skill has a matching `SKILL.md`.
- Check no old flat skill `.md` files remain under `docs/agent/skills/`.
- Check skill index lists every skill directory.

## Risks, Assumptions, or Open Questions
- Skill quality is reviewed structurally; there is no automated semantic validator.
- Future work may still add examples or scripts for specific skills.
