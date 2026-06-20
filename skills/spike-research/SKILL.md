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

Before reporting spike research complete:

### Scope

- [ ] Research question and decision need stated clearly
- [ ] Scope, depth, or timebox documented
- [ ] Production implementation avoided unless separately approved
- [ ] Out-of-scope questions recorded when relevant

### Evidence

- [ ] Product, architecture, code, test, or external evidence inspected as appropriate
- [ ] External sources treated as evidence to verify, not authority
- [ ] Confidence level recorded for important findings
- [ ] Low-confidence findings labeled clearly

### Options

- [ ] Viable options compared by tradeoffs, reversibility, and risk
- [ ] Recommendation includes a concrete next action
- [ ] ADR candidate identified when decision impact is durable
- [ ] Unknowns and follow-up research needs documented

### Handoff

- [ ] Findings summarized without large reasoning dumps
- [ ] Sources and commands recorded
- [ ] Checks skipped are recorded with reasons
- [ ] Residual risks or ambiguity documented

## Common Mistakes

Avoid:

- presenting assumptions as conclusions
- turning the spike into production implementation
- omitting tradeoffs or uncertainty
- recording large reasoning dumps without actionable findings

## Related Skills

- **acm-task**: Classify as spike and record scope/timebox
- **context-engineering**: Pack research evidence into useful context
- **decision-recording**: Record accepted durable decisions after the spike
- **impact-analysis**: Analyze affected surfaces before recommending implementation
- **acm-adversarial-review**: Challenge high-stakes recommendations

## Escalate When

- findings remain low-confidence
- decision impact becomes long-lived or architectural
- production implementation pressure appears during exploration
