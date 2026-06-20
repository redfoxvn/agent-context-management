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

intro="This repository uses Agent Context Management (ACM). Before non-trivial changes, reconcile the user request with .acm/ project memory, current source, and tests; stop and report behavior-affecting conflicts. The using-acm skill below carries the shared operating rules and routes you to the right skill:"

ctx="$(escape_for_json "${intro}"$'\n\n'"${content}")"

printf '{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"%s"}}\n' "$ctx"
