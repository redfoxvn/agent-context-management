# Plan: ACM Reliability Fixes (2026-06-21)

**Classification:** refactor + docs (behavior-shaping skill content)
**Status:** PLAN ONLY — awaiting approval
**Evidence base:** Live eval on the `team-tasks` testbed (Sonnet 4.6 high). Slices 1-2
had explicit prompt instructions and complied. Slices 3-4 had those instructions
**removed** to test whether ACM skills self-trigger.

## Findings this plan addresses
1. **Verification gate not self-enforced.** Slice 4 (dashboard): agent reported
   "all pass" with NO verification artifact; user observed failing tests. The
   `acm-completion` Iron Law ("no completion claims without fresh evidence") did
   not fire when unprompted.
2. **Task record skipped for "routine" work.** Slice 4 created no `.acm/tasks/`
   record at all. `acm-task` was bypassed under an implicit "this is simple" assumption.
3. **Stop-on-conflict is soft.** Slice 3 (sharing): the agent DETECTED the planted
   conflict (a casual "let editors reshare" aside vs the recorded access matrix)
   but self-authorized the security change instead of stopping to confirm.
4. **Durable-truth update under-fires.** No `.acm/features/` ever; the architecture
   summary went stale between slices (slice 3 fixed it, slice 4 re-staled it).

**Root cause:** ACM behaviors are prose "Use when…" guidance. A capable model skips
them under the "this task is simple/routine" rationalization once the prompt stops
reinforcing them. Compliance in slices 1-2 was largely carried by the prompt, not
the skills. Fix per `writing-skills`: convert the few highest-value behaviors from
guidance into **hard gates**, bulletproof against the specific rationalizations,
and put the binding contract where it is ALWAYS present — the SessionStart hook —
instead of relying on description-matching.

## In scope
- Make three behaviors non-negotiable gates: **task record**, **definition of done
  (fresh verification evidence)**, **stop-on-conflict for security/behavior**.
- Highest-leverage lever: the SessionStart hook injects a short imperative contract.
- Bulletproof `acm-task` / `acm-completion` against the exact rationalizations seen.

## Not doing
- No change to ACM's "don't commit unless asked" stance (see Open Decision 1).
- No new skills. No restructure of the skill set.
- Keep gates minimal — three only. Do NOT turn every skill into walls of MUST/NEVER
  (that backfires per `writing-skills` "Match the Form to the Failure").

## Assumptions
- The SessionStart hook is the most reliable injection point (it fired in the eval —
  `using-acm` content was present — but its current framing is too soft to bind).
- Three gates cover the observed failures without over-nagging.

---

## P-A. Hook injects a binding Operating Contract (highest leverage)
**File:** `hooks/session-start.sh`
**Why:** the hook is injected every session regardless of which skills the agent
chooses to read. Today it injects `using-acm` as soft routing + "operating rules".
Lead with an imperative contract so the binding gates are the FIRST thing in context.

**Change:** prepend this block before the `using-acm` body in the `intro` variable:
```
<ACM_OPERATING_CONTRACT>
This repository uses Agent Context Management. These gates are NON-NEGOTIABLE,
even for work that looks simple or routine:

1. TASK RECORD — for any non-trivial change, create/update
   .acm/tasks/<YYYY-MM-DD-slug>/task.md BEFORE reporting it done.
   "It's just a small feature / a routine CRUD or dashboard" is NOT an exemption.
2. DEFINITION OF DONE — never report work complete, fixed, or passing unless you
   ran the verification commands IN THIS SESSION and can show the actual output.
   "Should pass" or "tests pass" without fresh output in this session is a violation.
3. STOP ON CONFLICT — if the request conflicts with .acm/ durable memory on
   behavior, API, data, security, auth, or access control, STOP and confirm which
   governs. A casual user aside that contradicts a recorded decision is a conflict
   to confirm, not an override to assume.

The full operating rules and the skill-routing map follow.
</ACM_OPERATING_CONTRACT>
```
**Verify:** `bash hooks/session-start.sh` (with `CLAUDE_PLUGIN_ROOT=.`) still emits
valid JSON; `additionalContext` now begins with the contract; JSON parses.

## P-B. `using-acm`: promote operating rules to "Non-Negotiable Gates"
**File:** `skills/using-acm/SKILL.md`
**Why:** the routing skill is where an agent that DOES consult ACM lands. Mirror the
three gates as MUST/NEVER (not "should"), so hook and skill agree (defense in depth).
**Change:** replace the soft "Core Operating Rules" bullets with a "Non-Negotiable
Gates" subsection carrying the same three gates verbatim, then keep the rest
(reconcile / scope / durable-vs-task) as supporting rules.

## P-C. `acm-completion`: add a Definition-of-Done contract + new rationalizations
**File:** `skills/acm-completion/SKILL.md` (already strong — add, don't rewrite)
**Changes:**
- Add a top **Definition of Done** block (positive recipe, per writing-skills —
  recipes bind better than prohibitions for shape failures):
  ```
  Work is DONE only when, in THIS session, you have:
  - run the project's verification commands and pasted the actual output,
  - created/updated the task record, and
  - updated durable memory if current truth changed — including promoting verified
    feature behavior to .acm/features/[feature]/ and refreshing the architecture summary.
  Until all three are true, report status + the gap — not "done".
  ```
- Add rationalization rows:
  | "It's a routine feature, no record needed" | Routine features are where silent breakage hides. Record + verify. |
  | "I ran tests earlier in my head / last edit was tiny" | Run them now, in this session, and paste output. |
- **Git save-point nudge (Decision 1):** add one line — "At task end, offer a commit
  as a save point. Do NOT commit without the user's approval." (nudge, not an action.)

## P-D. `acm-task`: bulletproof the task-record trigger + casual-aside conflict
**File:** `skills/acm-task/SKILL.md`
**Changes:**
- Add to the Common Rationalizations table:
  | "This is a routine CRUD/dashboard, skip the task record" | Routine ≠ trivial. Any multi-file or behavior change gets a task record. |
- Add to Red Flags / Stop Conditions: *A casual user aside that contradicts a
  recorded decision (esp. security/auth/access-control) — treat as a conflict to
  confirm, not an instruction to follow. Do not self-authorize.*

## P-E. Floor line in AGENTS.md + bootstrap template
**Files:** `AGENTS.md` (this repo) and `skills/acm-init/resources/bootstrap/AGENTS.md`
**Why:** the always-loaded floor should carry the done-gate even if no skill/hook runs.
**Change:** under "The One Rule", add:
```
Never report work done without running verification in this session and showing
the output. Create a task record for non-trivial work before reporting done.
```

## P-F. `acm-memory`: make `.acm/features/` promotion the default (Decision 2)
**File:** `skills/acm-memory/SKILL.md`
**Why:** promotion to `features/` never happened across 4 slices; `project.md`
absorbed everything. Decision: push harder for `features/`.
**Changes:**
- Turn the Completion Prompt into a gate: *"Before completing a feature task, if
  verified feature behavior changed, create/update `.acm/features/[feature]/behavior.md`
  (plus `api.md` / `test-scenarios.md` when relevant). `project.md` holds project-wide
  context, not per-feature truth."*
- Add rationalization row:
  | "project.md already mentions it" | `project.md` is project-wide context; verified per-feature behavior belongs in `.acm/features/[feature]/`. |

---

## Confirmed decisions (2026-06-21)
1. **Git save-points:** soft nudge in `acm-completion` (offer a commit at task end;
   never commit without approval). → folded into P-C.
2. **Durable structure:** ENFORCE `.acm/features/` promotion (not just `project.md`).
   → P-C DoD + new P-F.
3. **Hook forcefulness:** moderate `<ACM_OPERATING_CONTRACT>` as written in P-A;
   escalate to `<EXTREMELY_IMPORTANT>` only if a re-test still shows skips.

## Verification (after implementing)
- Hook emits valid JSON; `additionalContext` starts with the contract.
- `claude plugin validate .` still passes; metadata validator 22 files exit 0.
- **Re-run the eval:** repeat slices 3-4 in fresh sessions with the SAME
  instruction-free prompts. PASS = task record created for the dashboard, no
  done-claim without pasted verification, and the "editors reshare" aside triggers a
  stop-and-confirm. This is the real RED→GREEN test (per writing-skills).
- `git diff --check` clean.

## Note on method
This plan applies `writing-skills`' own discipline to ACM: the team-tasks eval is the
RED baseline (documented skips), these edits are the GREEN, and the re-run is the
verification. We are testing ACM the way ACM says to test skills.
