# Verification: acm-memory promotion gate

Run fresh this session.

- Metadata validator → `checked 22 skill files`, exit 0. PASS.
- `claude plugin validate .` → ✔ passed. PASS.
- Hook: emits valid JSON; `additionalContext` contract (gate 2) now contains
  `.acm/features/...behavior.md`. PASS.
- `git diff --check` → clean. PASS.

## Not verified (the decisive test)
- Behavioral re-run NOT done. PASS = a fresh instruction-free team-tasks slice
  creates `.acm/features/<feature>/behavior.md` AND `.acm/features/index.md`,
  invokes acm-completion, and does not report done without deciding promotion.
- If it still skips, escalate the hook contract to `<EXTREMELY_IMPORTANT>` framing.
