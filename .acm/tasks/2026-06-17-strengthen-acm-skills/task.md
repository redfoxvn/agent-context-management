# Task: Strengthen ACM Skills

## Status

- status: completed
- classification: migration
- related feature/module: ACM skill pack
- last updated: 2026-06-17

## Request / Goal

Strengthen the root `skills/` pack by applying the best reusable patterns from Superpowers and agent-skills while preserving the hybrid model: skills own workflow and `.acm/` owns project memory.

## Scope / Non-goals

- In scope: edit, add, remove, and reorganize skills when it improves the ACM skill pack.
- In scope: improve skill metadata, activation triggers, output contracts, stop conditions, verification gates, and reusable resources.
- In scope: update README, AGENTS, skill index, and task records.
- Out of scope: building a CLI, publishing a plugin, changing the `.acm/` memory model, or requiring a specific agent platform.

## Context / Findings

- Superpowers strengths: strict gates, red flags, rationalization tables, verification-before-completion, optional subagent patterns, concise resources.
- agent-skills strengths: “When NOT to use,” verification checklists, assumptions/not-doing patterns, context engineering, source-driven validation, untrusted-data boundaries.
- ACM should avoid tool-specific assumptions, mandatory commits, mandatory worktrees, global “use skills before every response,” and storing durable project truth outside `.acm/`.

## Plan

- Add an ACM skill-authoring skill and validation resource.
- Strengthen core ACM workflow skills.
- Strengthen tactical ACM skills with consistent lightweight sections.
- Update task templates with acceptance criteria, assumptions, claims-supported, and staleness checks.
- Update docs and indexes.
- Verify skill metadata, stale references, and whitespace.

## Changes

- Added `acm-skill-authoring` and a reusable metadata validation resource.
- Strengthened core ACM workflow skills with use/non-use boundaries, output contracts, red flags, and verification gates.
- Strengthened tactical skills with use/non-use boundaries, common mistakes, and verification expectations.
- Updated task templates with acceptance criteria, assumptions, claims-supported, and staleness checks.
- Updated README, AGENTS, project context, and skill index.

## Verification

- verification_status: passed

| Check | Result | Notes |
|---|---|---|
| Skill metadata validation | passed | Checked 19 skill files |
| Whitespace check | passed | `git diff --check` produced no output |
| Stale reference check | passed | Old `.acm/agent`, `.acm/templates`, `.acm/product` references only appear in historical notes and the validation resource search terms |
| Skill structure spot checks | passed | Confirmed `When NOT To Use`, `Verification`, and `Common Mistakes` coverage for intended skill sets |
| Minimal `.acm` check | passed | Required memory files exist |

## Decisions / Risks

- Decision: Keep `skills/` as the reusable workflow pack.
- Decision: Keep `.acm/` as project memory only.
- Risk: Over-copying external skills would bloat ACM and weaken portability.

## Next Action

- Review and commit the skill-pack quality pass.
