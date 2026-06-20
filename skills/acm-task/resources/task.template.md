# Task: [Task Name]

## Status

Purpose:
State the current task state so future agents can resume without guessing.

Write when:
- creating the task artifact
- task status, classification, related module, or timestamp changes

Definition of ready:
- status is one of: not-started | in-progress | blocked | completed
- classification matches the ACM task classifications
- related feature/module is specific enough to route context
- last updated reflects the latest meaningful task update

Content:

- status: not-started | in-progress | blocked | completed
- classification:
- related feature/module:
- last updated:

## Request / Goal

Purpose:
Capture the user outcome or task objective in concise, implementation-neutral language.

Write when:
- starting a task
- the user changes or clarifies the requested outcome

Definition of ready:
- the desired outcome is understandable without the original chat
- ambiguity that affects behavior is called out instead of hidden
- task-local assumptions are marked as assumptions

Content:

...

## Scope / Non-goals

Purpose:
Define what this task will and will not change.

Write when:
- planning a non-trivial change
- scope changes during implementation
- avoiding unrelated cleanup or behavior drift is important

Definition of ready:
- in-scope work is explicit
- out-of-scope work is explicit when relevant
- scope is proportional to the request and risk

Content:

- In scope:
- Out of scope:

## Acceptance Criteria

Purpose:
Define what must be true for the task to satisfy the request.

Write when:
- planning non-trivial work
- user-visible behavior, docs, verification, or handoff expectations matter

Definition of ready:
- criteria are observable or reviewable
- criteria distinguish required outcomes from nice-to-have follow-up
- criteria include preserved behavior when relevant

Content:

- ...

## Assumptions

Purpose:
Make assumptions explicit so future agents and reviewers can verify or challenge them.

Write when:
- proceeding with incomplete but acceptable information
- assumptions affect implementation, verification, rollout, or docs

Definition of ready:
- assumptions are specific
- behavior-affecting assumptions are confirmed or marked as blockers
- each assumption has a verification or review path when needed

Content:

- ...

## Context / Findings

Purpose:
Record task-relevant facts discovered from durable docs, source code, tests, logs, prior task records, or user clarification.

Write when:
- identifying affected features, modules, files, tests, constraints, or behavior
- discovering uncertainty, stale docs, hidden coupling, or source conflicts

Definition of ready:
- findings are relevant to this task
- facts are tied to sources when possible
- assumptions are explicitly marked
- conflicts are not silently resolved
- scratch notes or broad repo observations are omitted

Content:

- ...

## Plan

Purpose:
Describe the smallest safe implementation or documentation path based on current context.

Write when:
- enough context exists to plan safely
- implementation, verification, or documentation update steps need sequencing

Definition of ready:
- plan is scoped and ordered
- plan avoids unrelated cleanup
- plan includes verification expectations
- blocking questions are resolved, reported, or explicitly accepted as assumptions

Content:

- ...

## Changes

Purpose:
Summarize what changed during the task at a level useful for review and continuation.

Write when:
- files, docs, tests, behavior, or decisions change
- the implementation approach changes materially

Definition of ready:
- changed areas are concrete and path-oriented when possible
- behavior changes are distinguished from internal-only changes
- durable docs updates are mentioned when they occurred

Content:

- ...

## Verification

Purpose:
Record checks performed, results, and skipped checks with reasons.

Write when:
- any test, build, lint, manual review, or inspection is performed
- verification is skipped, partial, blocked, failed, or not applicable

Definition of done:
- verification status is explicit
- commands or methods are listed when available
- failures and skipped checks include reasons
- the task does not claim verification that was not performed

Content:

- verification_status: not-run | partial | passed | failed | blocked

| Check | Result | Notes |
|---|---|---|
| ... | passed / failed / not run | ... |

## Conflicts / Ambiguity

Purpose:
Preserve behavior-affecting disagreements or uncertainty instead of forcing the agent to choose silently.

Write when:
- user request, durable docs, code, tests, or prior task records disagree
- expected behavior is unclear
- resolving ambiguity affects product behavior, API, data, security, auth, billing, or architecture

Definition of ready:
- conflicting sources are named
- impact is explained
- resolution is recorded or the task is blocked

Content:

| Source A | Source B | Conflict / Ambiguity | Impact | Resolution |
|---|---|---|---|---|
| ... | ... | ... | ... | resolved / blocked / needs decision |

## Decisions / Risks

Purpose:
Record task-local decisions, important tradeoffs, residual risks, and links to durable decision records when needed.

Write when:
- a decision affects implementation or verification
- a residual risk remains
- a durable ADR or doc update may be needed

Definition of ready:
- decisions include rationale
- residual risks are explicit
- durable decisions are linked or marked as ADR candidates
- task-local decisions are not overstated as durable truth

Content:

- ...

## Next Action

Purpose:
State the next concrete action for the current or next session.

Write when:
- ending a work session
- the task is blocked, incomplete, partially verified, or ready for review

Definition of ready:
- next action is specific and actionable
- blockers are visible
- completed tasks clearly say no further task action is required

Content:

- ...
