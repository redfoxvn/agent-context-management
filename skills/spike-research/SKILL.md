---
name: spike-research
description: Use when investigating options, unknowns, feasibility, tradeoffs, or recommendations without implementing production changes.
---

# Skill: Spike Research

## Use For

Investigate options, tradeoffs, and unknowns without silently implementing production changes.

## When NOT To Use

Do not use this skill as a disguise for unbounded implementation.

## Key Moves

- Define the research question and decision needed.
- Set scope, depth, or timebox.
- Gather relevant product, architecture, code, test, and external context.
- Record findings with evidence and confidence.
- Compare options by tradeoffs, reversibility, and risk.
- Recommend a concrete next action.

## Output

- findings and evidence
- option comparison
- tradeoffs and risks
- recommendation or next action
- ADR candidate when appropriate

## Evidence Confidence

For each important finding, record whether confidence is high, medium, or low and why.

Option comparisons should include tradeoffs, reversibility, risk, and recommended next action.

## Verification

Before reporting this work complete:

- record what evidence was inspected
- record checks that were run
- record checks that were skipped and why
- identify unresolved risks or ambiguity

## Common Mistakes

Avoid:

- presenting assumptions as conclusions
- turning the spike into production implementation
- omitting tradeoffs or uncertainty
- recording large reasoning dumps without actionable findings

## Escalate When

- findings remain low-confidence
- decision impact becomes long-lived or architectural
- production implementation pressure appears during exploration
