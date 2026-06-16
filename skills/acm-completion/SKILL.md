---
name: acm-completion
description: Use when finalizing ACM-guided work, reporting completion, or deciding whether verification, durable memory, or handoff is still needed.
---

# Skill: ACM Completion

## Use For

Final review before reporting work as complete.

## Core Principle

Evidence before claims.

Do not report work as complete, fixed, verified, or passing unless fresh evidence supports that claim.

## Completion Gate

Do not report completion until these are true or explicitly reported as gaps:

- The result addresses the user request.
- Task classification is still correct.
- Scope did not silently expand.
- Relevant docs, code, and tests were reconciled.
- Changes are minimal and follow existing patterns.
- Relevant checks were run, or skipped checks have reasons.
- Durable memory was updated if current truth changed.
- Task docs were updated if a task folder exists.
- Handoff was updated when needed.
- No unresolved behavior-affecting conflict remains.

## Code / Behavior Review

Check that:

- public API and data model changes are intentional and documented
- validation, auth, permissions, error handling, logging, and type safety are not weakened
- no unrelated formatting, cleanup, or debug code remains
- behavior matches durable memory or documented task intent
- edge cases, error cases, and permissions are considered when relevant
- refactors preserve behavior

Stop before completion if docs, code, and tests still disagree about expected behavior.

## Verification Review

Prefer targeted checks before broad checks. Broader checks are appropriate when risk justifies them.

Record important commands and results in the task record when one exists.

## Claim Check

Before making a success claim:

1. Identify what evidence proves the claim.
2. Run or inspect the relevant check.
3. Read the result.
4. Report the actual result, including gaps.

If no reliable verification exists, say that instead of implying success.

Suggested order:

1. targeted unit tests
2. targeted integration tests
3. typecheck
4. lint
5. build
6. e2e tests
7. documentation/reference checks

## Tool Safety

- Prefer read-only inspection before mutation.
- Prefer scoped commands over broad commands.
- Prefer existing repo scripts over ad-hoc commands.
- Do not expose secrets or sensitive data.
- Do not discard unrelated working-tree changes.
- Require explicit approval before destructive commands, pushes, deploys, releases, or history rewrites.

## Final Response

State:

- what changed
- what was verified
- what was not verified
- remaining risks or follow-up work
- blockers or conflicts, if any

Do not say checks passed unless they were run in the current task. Do not hide skipped checks.
