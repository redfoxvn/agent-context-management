# Verification: ACM Reliability Fixes

All checks run fresh in this session.

## Metadata validator
`bash skill-metadata-check` → `checked 22 skill files`, exit 0. PASS.

## Plugin manifest
`claude plugin validate .` → ✔ Validation passed. PASS.

## SessionStart hook
- `bash -n hooks/session-start.sh` → syntax OK.
- `CLAUDE_PLUGIN_ROOT=. bash hooks/session-start.sh` → valid JSON; `additionalContext`
  begins with `<ACM_OPERATING_CONTRACT>` (4459 chars, contract + using-acm both present). PASS.

## Whitespace
`git diff --check` → clean. PASS.

## Not verified yet (the real test)
- Behavioral re-run NOT yet done. The decisive check is repeating team-tasks
  slices 3-4 in fresh sessions with the same instruction-free prompts and confirming:
  (1) the dashboard slice creates a task record, (2) no "done" claim without pasted
  verification, (3) the "editors reshare" aside triggers a stop-and-confirm,
  (4) verified feature behavior lands in `.acm/features/`.
- Hook tested for output validity only, not live injection in a real Claude Code session.
