# Documentation Plan

## Task Summary
Upgrade specialized and remaining non-core reusable skills with `Inputs` and `Completion Criteria`, matching the format already applied to the six core skills.

## Task Classification
docs

## Affected Docs
- `docs/agent/skills/bugfix/SKILL.md`
- `docs/agent/skills/decision-recording/SKILL.md`
- `docs/agent/skills/implementation/SKILL.md`
- `docs/agent/skills/refactor/SKILL.md`
- `docs/agent/skills/migration/SKILL.md`
- `docs/agent/skills/performance-optimization/SKILL.md`
- `docs/agent/skills/security-remediation/SKILL.md`
- `docs/agent/skills/session-handoff/SKILL.md`
- `docs/agent/skills/spike-research/SKILL.md`
- `docs/agent/skills/test-design/SKILL.md`
- `docs/tasks/index.md`

## Update Strategy
1. Add `Inputs` before `Procedure` in each target skill.
2. Add `Completion Criteria` after `Outputs` in each target skill.
3. Keep skill docs concise and procedural.
4. Preserve existing skill names, paths, and workflow semantics.

## Verification Strategy
- Check all ten target skills include `Purpose`, `Use When`, `Inputs`, `Procedure`, `Outputs`, `Completion Criteria`, and `Do Not`.
- Check all ten target skill files still exist at the same paths.
- Review line counts to keep the skill docs compact.

## Risks, Assumptions, or Open Questions
- Assumption: the task now covers the six classification-specific skills plus the four remaining non-core reusable skills not covered by the prior core-skill task.
- This is documentation-only and should not change workflow semantics.
