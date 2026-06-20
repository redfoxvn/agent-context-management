# Task: ACM Review Fixes

## Classification
docs + refactor (skill-pack maintenance)

## Summary
Re-review of the ACM skill pack (all files outside `.acm/tasks/`) found real bugs,
stale references, and uneven guardrail coverage. This task applies the P0–P3 fixes
from `plan.md`.

## What Changed
| Area | Change |
|---|---|
| `skills/acm-skill-authoring/resources/skill-metadata-check.md` | Rewrote validator as portable POSIX (was zsh-only `print` under a ```bash fence); ran 21/exit 0 in bash + zsh. |
| `skills/code-review/SKILL.md` | Description now starts with `Use when` (was `Use before`); fixed dangling external "Agent-Skills" Resources ref. |
| `skills/context-engineering/SKILL.md` | Removed stale `codebase-research` ref; folded note into `acm-task`. |
| `skills/README.md` | Re-synced with `index.md` (added Advanced group, removed `codebase-research`). |
| `skills/acm-init/SKILL.md` | Added `## Resources` linking the canonical `resources/minimal-acm/` starter files. |
| `skills/acm-memory/SKILL.md` | Added `spec` / `data-model` / `changelog` to Durable Locations (resolved orphaned templates). |
| `skills/git-workflow/SKILL.md`, `skills/test-driven-development/SKILL.md` | Labeled external-pack references as "reference only — not bundled". |
| `skills/security-remediation`, `performance-optimization`, `impact-analysis` | Added Red Flags + Common Rationalizations + a worked Example. |
| `skills/refactor`, `skills/migration` | Added Red Flags. |
| `skills/acm-adversarial-review/SKILL.md` | Added "Getting a Fresh Context" with per-harness mechanisms (Claude Code, Codex, OpenCode). |
| `skills/using-acm/SKILL.md` (NEW) | Meta/router skill: shared operating rules + situation→skill routing table. Skill count 21 → 22. |
| `skills/index.md` | Replaced inline routing table with a `using-acm` pointer + Meta group. |
| `README.md`, `skills/README.md`, `AGENTS.md`, `.acm/index.md` | Wired in `using-acm`; updated count to 22 / five groups. |
| `LICENSE`, `README.md` | Added MIT LICENSE; updated License section. |
| 9 tactical skills | Renamed `## Escalate When` → `## Stop Conditions` (terminology unified across the pack). |

## Packaging Phase (P4 — multi-harness distribution)
| Area | Change |
|---|---|
| `.claude-plugin/plugin.json`, `marketplace.json` | Claude Code plugin + marketplace manifest (`/plugin marketplace add redfoxvn/agent-context-management`). |
| `hooks/hooks.json`, `hooks/session-start.sh` | SessionStart hook injecting `using-acm` (pure bash, no jq). Verified: emits valid JSON `additionalContext`. |
| `gemini-extension.json`, `GEMINI.md` | Gemini CLI extension (loads AGENTS.md + using-acm). |
| `.opencode/skills` | Symlink → `../skills` for OpenCode discovery. |
| `docs/setup.md` | Per-harness install guide (Claude Code, Gemini, OpenCode, Cursor, Windsurf, Codex, Kiro). |
| `AGENTS.md` | Slimmed to an always-loaded floor (one rule + read path + safety floor + Stop & Report) pointing to `using-acm`. |
| `skills/acm-init/{SKILL.md,resources/bootstrap/}` | New AGENTS.md/CLAUDE.md bootstrap template; init now installs a root bootstrap when absent. |
| `README.md` | Added Installation + Distribution; updated structure and Current Status. |

## Scope / Not Doing
- Did not touch `.acm/tasks/` history.
- Did not change core `acm-*` workflow logic.
- Cursor/Windsurf/Codex/Kiro: documented manual setup (no shipped config) since their formats vary and can't be verified here.
- Standalone CLI (`acm init`, …) remains future work.

## Decisions (confirmed by user 2026-06-20)
- P1-3: Option A — acknowledge `spec`/`data-model`/`changelog` templates in `acm-memory`. Applied.
- P3-1: Spell out per-harness fresh-context mechanisms (Claude Code, Codex, OpenCode). Applied.
- P3-2: Separate `using-acm` skill (routing map moved out of `index.md`). Applied — skill count now 22.
- P3-3: MIT license; copyright "ACM Contributors" (holder editable). Applied.

## Verification
See `verification.md`.
