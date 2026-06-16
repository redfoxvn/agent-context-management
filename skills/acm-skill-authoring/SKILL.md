---
name: acm-skill-authoring
description: Use when creating, editing, reviewing, or validating ACM skill files or reusable skill resources.
---

# Skill: ACM Skill Authoring

## Overview

ACM skills are reusable workflow guides. They should be concise, triggerable, platform-aware, and separate from project memory.

Core rule:

```txt
skills define how agents work
.acm stores what this project knows
```

## When To Use

Use this skill when:

- creating a new `skills/*/SKILL.md`
- changing skill frontmatter
- changing a skill workflow
- adding reusable skill resources
- validating skill-pack quality before publishing or committing

## When NOT To Use

Do not use this skill for:

- task-specific notes
- feature behavior documentation
- architecture truth about one project
- ADRs or decisions for one project
- temporary investigation notes

Those belong in `.acm/`.

## Skill File Contract

Every `SKILL.md` must start with:

```md
---
name: skill-name
description: Use when specific trigger conditions apply.
---
```

Rules:

- `name` uses lowercase letters, numbers, and hyphens only.
- `description` starts with `Use when`.
- `description` describes trigger conditions, not workflow steps.
- Keep descriptions under 500 characters.
- Keep reusable workflow in `SKILL.md`.
- Put heavy templates or references under `resources/`.

## Recommended Sections

Use only sections that add value:

- Overview
- When To Use
- When NOT To Use
- Core Pattern
- Workflow
- Output Contract
- Stop Conditions
- Verification
- Common Mistakes
- Red Flags
- Resources

## ACM-Specific Rules

- Do not store project-specific truth in skills.
- Do not require one agent platform unless the skill is platform-specific.
- Do not require commits, pushes, PRs, worktrees, or destructive actions unless the user explicitly requests them.
- Do not force-load large references.
- Do not duplicate long checklists across many skills; move them to resources.

## Quality Checklist

Before considering a skill ready:

- frontmatter is valid
- trigger description is precise
- “When NOT to use” exists when misuse is likely
- output contract is clear
- stop conditions are explicit
- verification is concrete
- references are optional and path-correct
- no project-specific memory leaked into the skill

## Red Flags

Stop and revise when:

- the skill describes a one-off task
- the description summarizes workflow instead of triggers
- the skill assumes Claude, Codex, OpenCode, MCP, browser, or GitHub unless optional
- the skill tells agents to write durable truth outside `.acm/`
- the skill requires unsafe git or shell operations without user approval

## Resources

Use `resources/skill-metadata-check.md` for validation commands.
