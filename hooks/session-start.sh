#!/usr/bin/env bash
# ACM SessionStart hook.
# Injects the using-acm skill at session start so ACM's operating rules and the
# skill-routing map are present from the first message. Pure bash — no jq.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PLUGIN_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
SKILL="${PLUGIN_ROOT}/skills/using-acm/SKILL.md"

# No skill found → emit empty object so the hook is a no-op, never an error.
[ -f "$SKILL" ] || { echo '{}'; exit 0; }

content="$(cat "$SKILL")"

# Escape a string for embedding in JSON using bash parameter substitution
# (single-pass per rule — no per-character loop, no external dependency).
escape_for_json() {
  local s="$1"
  s="${s//\\/\\\\}"
  s="${s//\"/\\\"}"
  s="${s//$'\n'/\\n}"
  s="${s//$'\r'/\\r}"
  s="${s//$'\t'/\\t}"
  printf '%s' "$s"
}

intro='<ACM_OPERATING_CONTRACT>
This repository uses Agent Context Management. These gates are NON-NEGOTIABLE,
even for work that looks simple or routine:

1. TASK RECORD — for any non-trivial change, create/update
   .acm/tasks/<YYYY-MM-DD-slug>/task.md BEFORE reporting it done.
   "It is just a small feature / a routine CRUD or dashboard" is NOT an exemption.
2. DEFINITION OF DONE — never report work complete, fixed, or passing unless you
   ran the verification commands IN THIS SESSION and can show the actual output.
   "Should pass" or "tests pass" without fresh output in this session is a violation.
3. STOP ON CONFLICT — if the request conflicts with .acm/ durable memory on
   behavior, API, data, security, auth, or access control, STOP and confirm which
   governs. A casual user aside that contradicts a recorded decision is a conflict
   to confirm, not an override to assume.

The full operating rules and the skill-routing map follow.
</ACM_OPERATING_CONTRACT>'

ctx="$(escape_for_json "${intro}"$'\n\n'"${content}")"

printf '{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"%s"}}\n' "$ctx"
