# Product

Purpose:
Provide durable domain and business context that helps agents understand system behavior beyond implementation details.

This directory is a project-specific template layer. Replace placeholders with real product/domain concepts during adoption, but keep the content concise and stable.

## Files

| File | Role | Read When | Write When |
|---|---|---|---|
| `overview.md` | High-level product purpose, users, goals, and constraints | onboarding, feature planning, or tradeoff analysis | product direction, goals, or constraints change |
| `glossary.md` | Canonical business terminology | terminology is unclear or conflicting | terminology changes |
| `domain-model.md` | Core entities, relationships, and lifecycle | understanding business structure | entities or lifecycle rules change |
| `business-rules.md` | Stable behavioral constraints and policies | implementing or validating behavior | stable rules or constraints change |

## What Belongs Here

- stable domain terminology
- product goals and non-goals
- business behavior and constraints
- entity relationships and lifecycle
- durable product concepts
- product constraints that affect implementation tradeoffs

## What Does Not Belong Here

- implementation details
- API payload details
- task history
- temporary product discussions
- speculative ideas unless marked as draft
- runtime architecture design

## Adoption Notes

During adoption, agents should populate these files using verified repository and product evidence.

Use:

- `overview.md` for the broad product mental model
- `glossary.md` for canonical terminology
- `domain-model.md` for entities and lifecycle
- `business-rules.md` for durable constraints and policies

Do not turn assumptions into durable product truth.
If product intent or terminology is inferred rather than verified, mark it clearly for confirmation.

## Agent Usage

Before changing behavior, agents should use these files to answer:

- What business meaning does this feature have?
- Which rules or constraints must remain preserved?
- Which terminology is canonical?
- Which goals or non-goals affect this decision?
- Is this a behavior change or only an implementation change?
