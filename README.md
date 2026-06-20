# Agent Context Management

Hybrid context architecture for AI coding agents such as Claude Code, Codex, and OpenCode.

This repository provides:

- a reusable root-level `skills/` pack for agent workflows
- a minimal `.acm/` project memory layer for durable repo-specific context
- task records for verification, handoff, and multi-session continuity

It is designed to be adapted into real software repositories without copying a large workflow documentation tree into every project.

## Core Model

```txt
skills = how agents work
.acm/  = what this project knows
```

The main rule is:

```txt
task docs record what happened
durable docs record what is true now
```

## Why This Exists

Coding agents fail in predictable ways:

- they edit from the user request alone
- they read too much irrelevant context
- they treat stale notes as current truth
- they skip verification or overstate certainty
- they lose state between sessions
- they require too much manual setup when workflow files must be copied into each repo

ACM reduces those failures by separating reusable workflow from repo-local memory.

## Repository Structure

```txt
.
├── AGENTS.md                 # always-loaded bootstrap floor
├── CLAUDE.md                 # @AGENTS.md for Claude Code
├── GEMINI.md                 # context file for Gemini CLI
├── README.md
├── .claude-plugin/           # Claude Code plugin + marketplace manifest
├── hooks/                    # SessionStart hook (injects using-acm)
├── .opencode/                # OpenCode adapter (skills symlink)
├── gemini-extension.json     # Gemini CLI extension manifest
├── docs/setup.md             # per-harness install guide
├── skills/
│   ├── index.md
│   ├── using-acm/            # meta: operating rules + routing map
│   ├── acm-init/
│   ├── acm-task/
│   ├── acm-memory/
│   ├── acm-completion/
│   ├── acm-handoff/
│   ├── acm-skill-authoring/
│   ├── acm-adversarial-review/
│   ├── [development-practice-skill]/
│   └── [tactical-skill]/
└── .acm/
    ├── index.md
    ├── project.md
    ├── config.md
    └── tasks/
        └── index.md
```

Optional `.acm/` folders are created only when they contain useful project memory:

```txt
.acm/features/
.acm/architecture/
.acm/decisions/
.acm/tasks/[YYYY-MM-DD-task-slug]/
```

## Skills

ACM currently provides 22 reusable skills across five groups.

Meta skill:

- `skills/using-acm/SKILL.md`: entry point — shared operating rules and a situation→skill routing map

Core workflow skills:

- `skills/acm-init/SKILL.md`: initialize a minimal `.acm/` memory layer
- `skills/acm-task/SKILL.md`: classify work, clarify requirements, research code, plan implementation, and manage task records
- `skills/acm-memory/SKILL.md`: promote verified findings into durable memory
- `skills/acm-completion/SKILL.md`: review verification, scope, docs, and residual risk before completion
- `skills/acm-handoff/SKILL.md`: create or consume continuation state
- `skills/acm-skill-authoring/SKILL.md`: create, edit, review, and validate reusable ACM skills

Advanced skill:

- `skills/acm-adversarial-review/SKILL.md`: subject high-stakes decisions to fresh-context adversarial review

Development practice skills:

- `skills/code-review/SKILL.md`: review code across correctness, readability, architecture, security, and performance
- `skills/context-engineering/SKILL.md`: build, prune, and preserve task context safely
- `skills/git-workflow/SKILL.md`: manage repository state, branches, save points, and atomic commits
- `skills/test-driven-development/SKILL.md`: drive behavior changes with failing tests, minimal implementation, and refactoring

Tactical skills support focused work such as bugfixes, migrations, refactors, security remediation, impact analysis, performance optimization, spike research, decision recording, framework adoption, and test design.

See `skills/index.md` for the full skill list.

## Skill Quality Model

ACM skills follow these rules:

- descriptions describe when to use the skill
- skills are reusable workflow, not project memory
- `.acm/` stores project-specific context
- heavy templates and references live under skill `resources/`
- high-risk skills include stop conditions and verification gates
- platform-specific commands are examples unless explicitly required

## Minimal ACM Init

A new target repository should start with only:

```txt
.acm/
├── index.md
├── project.md
├── config.md
└── tasks/
    └── index.md
```

The `acm-init` skill provides these starter files under:

```txt
skills/acm-init/resources/minimal-acm/
```

Do not pre-fill imaginary architecture, product, feature, or decision docs. Let durable memory grow from verified work.

## Project Memory

`.acm/` stores repo-specific context:

- `.acm/project.md`: project purpose, users, goals, non-goals, terms, and known verification commands
- `.acm/tasks/`: task-scoped working state and history
- `.acm/features/`: verified current feature behavior when present
- `.acm/architecture/`: stable source maps, boundaries, flows, and conventions when present
- `.acm/decisions/`: durable decision records when present

Workflow procedures, reusable templates, and task profiles belong in `skills/`, not `.acm/`.

## Adoption Guidance

For greenfield adoption:

1. Install or copy the skill pack.
2. Use `skills/acm-init/SKILL.md` to create the minimal `.acm/` memory layer.
3. Fill `.acm/project.md` only with known project facts.
4. Create task records from the first non-trivial task.
5. Promote durable docs only after verification or explicit acceptance.

For brownfield adoption:

1. Create the minimal `.acm/` memory layer.
2. Treat existing docs as unverified until checked against code, tests, or accepted product truth.
3. Build source maps, feature docs, architecture docs, and ADRs task-by-task.
4. Keep uncertainty in task records until confirmed.

## Installation

ACM installs as a portable skill pack plus harness adapters — install the pack
once, then run `acm-init` per repository to create the `.acm/` layer.

Claude Code:

```text
/plugin marketplace add redfoxvn/agent-context-management
/plugin install agent-context-management@acm
```

See [docs/setup.md](docs/setup.md) for Gemini CLI, OpenCode, Cursor, Windsurf,
Codex, and Kiro.

## Distribution

ACM is packaged as a Claude Code plugin (`.claude-plugin/`) with a `SessionStart`
hook that injects the `using-acm` skill, plus adapters for Gemini CLI
(`gemini-extension.json` + `GEMINI.md`) and OpenCode (`.opencode/`). Other agents
load the plain-Markdown skills via their instruction/rules files.

A standalone CLI is still future work. Possible commands:

```txt
acm init
acm task start
acm task verify
acm promote
acm handoff
```

## Current Status

This repository contains the Markdown skill pack, packaging manifests (Claude
Code plugin, Gemini extension), a session-start hook, multi-harness adapters,
and minimal project memory. It does not contain a concrete application codebase
or test suite; ACM is workflow-and-memory tooling, not an application runtime.

## License

MIT License — see the `LICENSE` file. (Update the copyright holder as needed.)
