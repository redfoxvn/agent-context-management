# Task: Rename Docs Root

## Status

- status: completed
- classification: docs
- related feature/module: agent context documentation root
- last updated: 2026-05-28

## Request / Goal

Rename the repository `docs/` folder to a more agent-semantic, less collision-prone name. The final selected name is `.acm/`.

## Scope / Non-goals

- In scope: rename `docs/` to `.acm/`, update repository references, update indexes and task workflow text that route agents to the folder.
- Out of scope: change product/runtime behavior, redesign documentation structure, alter task workflow semantics beyond the path rename.

## Context / Findings

- `AGENTS.md`, `.acm/index.md`, task workflow, context policy, task templates, and indexes used `docs/` as the canonical root before this task.
- The root was first changed through intermediate names, then the user selected `.acm/` as the final folder name.
- This is documentation infrastructure, not application behavior.

## Plan

- Move `docs/` to `.acm/`.
- Replace path references from `docs/` to `.acm/` where they describe this agent context system.
- Keep plain-language references to documentation only where they are not path names.
- Verify with path/reference search and inspect the resulting diff.

## Verification

- verification_status: passed

| Check | Result | Notes |
|---|---|---|
| Search for `docs/` | passed | Remaining hits are conceptual `docs/code/tests` phrases or this task record describing the old folder, not stale path routes. |
| Search for stale bootstrap, tree, and old root path references | passed | No stale bootstrap, tree, or old path references found. |
| Search for `agent-context/` | passed | No stale intermediate path references remain. |
| Search for `.memory/` | passed | No stale intermediate path references remain. |
| `git diff --check` and `git diff --check --cached` | passed | No whitespace errors. |

## Conflicts / Ambiguity

| Source A | Source B | Conflict / Ambiguity | Impact | Resolution |
|---|---|---|---|---|
| User request | Existing docs | Existing docs defined `docs/` as canonical root, while the request changes that root. | Requires consistent path update across durable agent docs. | Resolved by using `.acm/` as the new canonical root. |

## Next Action

- No further task action required.
