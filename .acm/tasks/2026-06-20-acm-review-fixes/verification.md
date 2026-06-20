# Verification: ACM Review Fixes

Run from repo root. All checks below were run fresh in this session.

## Frontmatter validator (the fixed script)
Command (portable POSIX from `skills/acm-skill-authoring/resources/skill-metadata-check.md`):

```
bash → checked 22 skill files (exit 0)
zsh  → checked 22 skill files (exit 0)
```
Result: PASS in both shells (previously failed on `code-review` under zsh; broken under bash). Count is 22 after adding the `using-acm` meta skill.

## Stale skill references (outside .acm/tasks)
`grep -rnE 'codebase-research|requirement-analysis|implementation-planning' skills README.md AGENTS.md CLAUDE.md .acm/*.md`
Result: PASS — no matches. (Remaining matches are only in `.acm/tasks/` history, expected.)

## Dangling external-pack references
Result: PASS — `git-workflow` and `test-driven-development` external refs now labeled "reference only — not bundled in this pack".

## Broken skills/ path references
Result: PASS — no missing targets outside `.acm/tasks/` history.

## Section-coverage audit (high-risk + previously-thin skills)
| Skill | Red Flags | Rationalizations | Example | Verification |
|---|---|---|---|---|
| security-remediation | yes | yes | yes | yes |
| performance-optimization | yes | yes | yes | yes |
| refactor | yes | yes | yes | yes |
| migration | yes | yes | yes | yes |
| impact-analysis | yes | yes | yes | yes |
| bugfix (baseline) | yes | yes | yes | yes |
Result: PASS.

## Whitespace
`git diff --check` → clean. PASS.

## Terminology
`grep -rn '^## Escalate When' skills` → none. All condition sections now use
`## Stop Conditions` (11 skills). PASS.

## Not verified / gaps
- LICENSE copyright holder is a placeholder ("ACM Contributors", 2026) — confirm/replace.
- No automated link-checker exists in-repo; path checks were done via grep.
