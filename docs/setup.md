# Installing ACM

ACM ships as a portable skill pack plus harness adapters. The skill pack is
installed **once** per machine/agent; the `.acm/` memory layer is created **per
repository** with `acm-init`.

```txt
skills/  → install once, shared across projects (this pack)
.acm/    → created per repository by acm-init
```

## Claude Code (recommended)

Marketplace install:

```text
/plugin marketplace add redfoxvn/agent-context-management
/plugin install agent-context-management@acm
```

Local / development:

```bash
git clone https://github.com/redfoxvn/agent-context-management.git
claude --plugin-dir /path/to/agent-context-management
```

The plugin registers the `skills/` pack and a `SessionStart` hook
(`hooks/session-start.sh`) that injects the `using-acm` skill so ACM's operating
rules and routing map are present from the first message.

## Gemini CLI

Install as an extension (uses `gemini-extension.json` + `GEMINI.md`):

```bash
gemini extensions install https://github.com/redfoxvn/agent-context-management
```

`GEMINI.md` loads `AGENTS.md` and the `using-acm` skill as persistent context.

## OpenCode

OpenCode reads `AGENTS.md` and discovers skills under `.opencode/skills`
(symlinked to the canonical `skills/`). Point OpenCode at a clone of this repo,
or copy `.opencode/skills` + `AGENTS.md` into your project.

## Cursor / Windsurf / Codex / Kiro (manual)

ACM skills are plain Markdown, so they work with any agent that accepts
instruction or rules files:

- **Cursor / Windsurf:** add `AGENTS.md` (or the `using-acm` skill) to your rules
  configuration (`.cursor/rules/` or the Windsurf rules panel).
- **Codex:** reference `AGENTS.md` as the project instruction file; load
  individual `skills/*/SKILL.md` on demand.
- **Kiro:** place skills under `.kiro/skills/`; Kiro also reads `AGENTS.md`.

## After install (every repository)

1. Run `acm-init` to create the minimal `.acm/` layer and a root bootstrap
   (`AGENTS.md` / `CLAUDE.md`) if none exists.
2. Fill `.acm/project.md` with known project facts only.
3. Let durable memory grow from verified work — do not pre-fill imaginary docs.
