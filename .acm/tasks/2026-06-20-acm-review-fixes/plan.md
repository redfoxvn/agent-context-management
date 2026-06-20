# Plan: ACM Review Fixes (2026-06-20)

**Classification:** docs + refactor (skill-pack maintenance)
**Status:** PLAN ONLY — no skill files changed yet, awaiting approval
**Scope source:** Review of all files outside `.acm/tasks/` on 2026-06-20

## In Scope
- Fix the broken/non-portable metadata validation script (P0).
- Make `code-review` description conform to the `Use when` rule (P0).
- Remove stale `codebase-research` references (P1).
- Link `acm-init` to its own starter templates (P1).
- Resolve orphaned feature templates in `acm-memory` (P1 — needs a decision).
- Re-sync `skills/README.md` with `skills/index.md` (P1).
- Normalize section coverage for high-risk skills (P2).
- Design decisions for adversarial-review actuation, routing map, license (P3 — needs decisions).

## Not Doing (out of scope)
- No changes to `.acm/tasks/` history.
- No rewrite of the core `acm-*` workflow logic (it is sound).
- No new tactical skills.
- No CLI/plugin implementation.

## Assumptions
- The repo's canonical shell is zsh, but skill resources fenced ```bash should run under bash too (portability is a stated value: skills are platform-agnostic).
- `21 skills` is the intended count and should stay accurate in all docs.

---

## P0 — Real bugs (fix first)

### P0-1. Rewrite `skills/acm-skill-authoring/resources/skill-metadata-check.md`
**Problem:** Script fenced ```bash but uses `print` (zsh-only — confirmed `print: command not found` under bash), recursive `skills/**/SKILL.md` needs `globstar` in bash, and single-quoted regex on the `=~` RHS is treated as a literal string in bash. Running it (zsh) returns exit 1 on the current repo.

**Change:** Replace the script block (line 8) with POSIX-portable code that runs in both bash and zsh:

```bash
bad=0; count=0
for f in skills/*/SKILL.md; do
  count=$((count+1))
  l1=$(sed -n '1p' "$f"); l2=$(sed -n '2p' "$f")
  l3=$(sed -n '3p' "$f"); l4=$(sed -n '4p' "$f")
  name=${l2#name: }; desc=${l3#description: }
  [ "$l1" = "---" ] && [ "$l4" = "---" ] || { echo "bad delimiters: $f"; bad=1; }
  case "$l2" in name:\ *) ;; *) echo "bad name key: $f -> $l2"; bad=1;; esac
  printf '%s' "$name" | grep -Eq '^[a-z0-9-]+$' || { echo "bad name: $f -> $name"; bad=1; }
  case "$l3" in description:\ Use\ when*) ;; *) echo "bad description trigger: $f -> $l3"; bad=1;; esac
  [ "${#desc}" -le 500 ] || { echo "description too long: $f"; bad=1; }
done
echo "checked $count skill files"
exit $bad
```

**Verification:** `bash skill-check.sh` and `zsh skill-check.sh` both print `checked 21 skill files` and exit 0 — AFTER P0-2 is applied.

### P0-2. Fix `skills/code-review/SKILL.md:3` description
**Problem:** Starts with `Use before merging any change. Use when…` — violates the repo rule "description starts with `Use when`" and is the single failure the validator reports.

- **Before:** `description: Use before merging any change. Use when reviewing code written by yourself, another agent, or a human.`
- **After:** `description: Use when reviewing code before merging a change — written by yourself, another agent, or a human.`

**Verification:** validator from P0-1 exits 0.

---

## P1 — Stale references & contract gaps

### P1-1. Remove deleted-skill `codebase-research` references
- `skills/README.md:20` — replace `codebase-research` in the tactical list. Recommend dropping it (it is not a tactical skill; it merged into `acm-task`).
  - **Before:** ``Tactical skills such as `bugfix`, `codebase-research`, `migration`, and `test-design` support specific task types.``
  - **After:** ``Tactical skills such as `bugfix`, `migration`, `refactor`, and `test-design` support specific task types.``
- `skills/context-engineering/SKILL.md:215` — in Related Skills:
  - **Before:** `- **codebase-research**: Find relevant docs/code/tests before planning`
  - **After:** `- **acm-task**: Classify work and load relevant docs/code/tests before planning (see its Codebase Research Techniques section)`

**Verification:** `grep -rn 'codebase-research' --include='*.md' skills .acm/index.md README.md AGENTS.md` returns no matches outside `.acm/tasks/`.

### P1-2. Link `acm-init` to its starter templates
**Problem:** `acm-init/SKILL.md` says "Create only…" but never references `resources/minimal-acm/`, while README claims acm-init "provides these starter files" there. Agent will hand-roll files → drift.

**Change:** Add a `## Resources` section to `skills/acm-init/SKILL.md`:
```md
## Resources

Canonical starter files live under this skill's `resources/minimal-acm/`.
Copy them as the initial `.acm/` layer rather than writing from memory:
`config.md`, `index.md`, `project.md`, `tasks/index.md`.
```

**Verification:** the four created files match `resources/minimal-acm/` structure.

### P1-3. Resolve orphaned feature templates in `acm-memory`  ⚠️ DECISION NEEDED
**Problem:** `resources/feature-templates/` ships `spec`, `data-model`, `changelog` templates, but `acm-memory/SKILL.md` Durable Locations (lines 104-113) only sanctions `behavior.md`, `api.md`, `test-scenarios.md`. `spec.template.md` links to `./data-model.md` + `./changelog.md` (lines 44-48).

**Option A (recommended):** Make the skill acknowledge them. Add rows to the Durable Locations table:
| Feature spec / overview | `.acm/features/[feature]/spec.md` |
| Feature data model | `.acm/features/[feature]/data-model.md` |
| Feature changelog | `.acm/features/[feature]/changelog.md` |
…and add them to the Verification checklist "Location" block.

**Option B:** Delete the 3 unreferenced templates and strip the cross-links from `spec.template.md`. Smaller surface, but loses useful structure.

**Recommendation:** Option A — the templates are good; the skill just under-documents them.

### P1-4. Re-sync `skills/README.md` with `skills/index.md`
**Problem:** Lists only 5 core skills; omits `acm-adversarial-review` (advanced) and frames `acm-skill-authoring` loosely; tactical list stale.
**Change:** mirror the four groups from `index.md` (Core / Advanced / Development Practice / Tactical) so the two indexes agree. Confirm "21 skills" remains accurate everywhere (`README.md:76`).

---

## P2 — Normalize high-risk skill coverage

**Problem (inverted-risk coverage):** the riskiest skills are the least guarded.

| Skill | Add Red Flags | Add Common Rationalizations | Add ≥1 worked Example |
|---|---|---|---|
| `security-remediation` | yes | yes | yes |
| `migration` | yes | — (has) | — (has) |
| `performance-optimization` | yes | yes | yes |
| `refactor` | yes | — (has) | yes |
| `impact-analysis` | yes | yes | optional |
| `decision-recording` | optional | optional | optional |

Also standardize terminology: pick one of **"Stop Conditions"** vs **"Escalate When"** across all skills (recommend "Stop Conditions" — matches AGENTS.md and the `acm-*` core).

**Process:** use `acm-skill-authoring` for each edit; keep additions concise and trigger/evidence-focused; do not pad. Each high-risk skill should end up with: When NOT To Use · Stop Conditions · Red Flags · Common Rationalizations · Verification · ≥1 Example.

**Verification:** re-run the section-coverage audit; high-risk skills show full coverage; validator still exits 0.

---

## P3 — Design decisions (need your input before implementing)

### P3-1. Define adversarial-review actuation
`acm-adversarial-review` never says HOW a fresh-context reviewer is obtained, so on a single-context harness it degenerates to self-review. Proposal: add an `## Actuation` section stating the principle ("reviewer must not have been in this conversation") + per-harness mechanism (Claude Code: dispatch a subagent/Task; others: new session or cross-model). **Decision:** confirm wording and whether to name specific tools.

### P3-2. Symptom→skill routing map
Neither `index.md` nor AGENTS.md gives a "situation X → skill Y" decision aid like `using-superpowers` / `using-agent-skills`. Proposal: add a routing table to `skills/index.md` (or a small `using-acm` note). **Decision:** table-in-index vs new meta-skill.

### P3-3. Repo hygiene
Add a `LICENSE` (README notes none); remove or populate the empty `docs/`. **Decision:** which license.

---

## Suggested execution order
1. P0-1 + P0-2 together (validator green is the gate for everything else).
2. P1-1, P1-2, P1-4 (mechanical).
3. P1-3 after Option A/B decision.
4. P2 skill-by-skill via `acm-skill-authoring`.
5. P3 after decisions.

## Global verification (run before completion)
- `bash` and `zsh` both: metadata check → `checked 21 skill files`, exit 0.
- `grep -rn 'codebase-research' --include='*.md' skills` → empty.
- No broken `skills/*/SKILL.md` or `resources/` path references.
- `git diff --check` (whitespace) clean.
- Section-coverage audit shows full coverage on high-risk skills.
