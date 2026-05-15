# Product

Purpose:
Provide durable domain and business context that helps agents understand system behavior beyond implementation details.

This directory is a project-specific template layer. Replace placeholders with real product/domain concepts during adoption, but keep the content concise and stable.

## Files

| File | Role | Read When | Write When |
|---|---|---|---|
| `glossary.md` | Canonical business terminology | terminology is unclear or conflicting | terminology changes |
| `domain-model.md` | Core entities, relationships, and lifecycle | understanding business structure | entities or lifecycle rules change |
| `business-rules.md` | Stable behavioral constraints and policies | implementing or validating behavior | stable rules or constraints change |

## What Belongs Here

- stable domain terminology
- business behavior and constraints
- entity relationships and lifecycle
- durable product concepts

## What Does Not Belong Here

- implementation details
- API payload details
- task history
- temporary product discussions
- speculative ideas unless marked as draft

## Agent Usage

Before changing behavior, agents should use these files to answer:

- What business meaning does this feature have?
- Which rules must remain preserved?
- Which terminology is canonical?
- Is this a behavior change or only an implementation change?
