# Task: ACM Reliability Fixes

## Classification
refactor + docs (behavior-shaping skill content)

## Summary
The team-tasks live eval (Sonnet 4.6, instruction-free prompts) showed ACM
behaviors don't reliably self-trigger: slice 4 skipped the task record and claimed
done without evidence; slice 3 detected a durable-memory conflict but self-authorized
a security change. This task converts the three highest-value behaviors into hard
gates and puts the binding contract in the always-injected SessionStart hook.

## What Changed
| Area | Change |
|---|---|
| `hooks/session-start.sh` (P-A) | Prepend `<ACM_OPERATING_CONTRACT>` (3 gates) before the using-acm body, so the binding rules lead every session. |
| `skills/using-acm/SKILL.md` (P-B) | "Core Operating Rules" → "Non-Negotiable Gates" (task record · definition of done · stop on conflict) + Supporting Rules. |
| `skills/acm-completion/SKILL.md` (P-C) | Added "Definition of Done" block (incl. promote to `.acm/features/`); 2 rationalization rows; git save-point nudge (Decision 1). |
| `skills/acm-task/SKILL.md` (P-D) | Rationalizations for "routine CRUD/dashboard" + "aside overrides decision"; stop-condition + red flags for casual-aside conflicts. |
| `AGENTS.md` + `skills/acm-init/resources/bootstrap/AGENTS.md` (P-E) | Floor line: never report done without fresh verification; create a task record for non-trivial work. |
| `skills/acm-memory/SKILL.md` (P-F) | Completion Prompt → gate to create `.acm/features/[feature]/`; rationalization for "project.md already mentions it" (Decision 2). |

## Three gates (the core of this change)
1. Task record for any non-trivial change before reporting done ("routine" is not an exemption).
2. Definition of done = ran verification in this session + pasted output + task record + durable update.
3. Stop on conflict with durable memory (esp. security/auth/access-control); a casual aside is not an override.

## Decisions (confirmed by user 2026-06-21)
1. Git save-points: soft nudge in acm-completion (offer commit; never commit unapproved). Applied.
2. Durable structure: ENFORCE `.acm/features/` promotion. Applied (P-C DoD + P-F).
3. Hook forcefulness: moderate `<ACM_OPERATING_CONTRACT>`; escalate only if re-test still skips. Applied.

## Scope / Not Doing
- Kept to 3 gates only — did not turn every skill into MUST/NEVER walls (backfires per writing-skills).
- Did not change ACM's "don't commit unasked" stance (nudge only).

## Wording-bug sweep (follow-on)
A full audit of all 22 skills found the same defect class (exemption/vague wording
undercutting gates). Fixed #1-#5:
- `bugfix`: regression test now required (was "when practical" / "when risk warrants").
- `test-driven-development`: "Trivial changes" exemption → "non-code edits only";
  added "small logic still gets a failing test first".
- `code-review`: "Every change" → "Every non-trivial change" (resolve contradiction).
- `acm-adversarial-review`: concrete trigger (not "confident output"); high-stakes with
  no fresh context → escalate to user, not self-review.
- `acm-handoff`: "trivial / usually not required" → "fully completed, verified, no open risk".
Also fixed earlier: `using-acm`/`index.md` "ends with acm-completion" → completion is a gate, not the end.
Rejected several agent over-flags (rationalization tables, conservative "keep in task record" default).

## Verification
See `verification.md`. Real test = re-run team-tasks slices 3-4 with instruction-free prompts (RED→GREEN per writing-skills).
