# Verification

## Checks

| Check | Command / Method | Result | Notes |
|---|---|---|---|
| Stale path search | Targeted `rg` search for obsolete specs-nested path variants across `AGENTS.md`, `CLAUDE.md`, and `docs/`. | passed | No matches. |
| Required files present | `test -f docs/features/index.md && test -f docs/tasks/index.md && test -f CLAUDE.md && test -d docs/templates/tasks/docs` | passed | Required files exist. |
| Canonical path spot check | `rg -n "docs/features/|docs/tasks/" AGENTS.md docs/index.md docs/agent/context-policy.md docs/agent/session-handoff.md docs/README.md` | passed | Canonical paths appear in expected routing docs. |
| Docs task template check | `rg -n "docs/templates/tasks/docs/" docs/agent/task-workflow.md && test -d docs/templates/tasks/docs` | passed | Workflow references a template path that now exists. |
| Malformed code fence check | `rg -n '\`\`\`\`' docs/index.md docs/README.md docs/agent/task-workflow.md` | passed | No four-backtick fence found in checked routing docs. |

## Conclusion
- Verified for path alignment and required file presence.
