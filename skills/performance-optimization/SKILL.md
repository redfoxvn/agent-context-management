---
name: performance-optimization
description: Use when latency, throughput, memory, bundle size, query cost, resource usage, or performance regressions are in scope.
---

# Skill: Performance Optimization

## Use For

Improve performance while preserving correctness and producing before/after evidence.

## When NOT To Use

Do not use this skill when there is no performance symptom, target, or measurable concern.

## Key Moves

- Capture the performance symptom, impact, and target metric.
- Establish a baseline or record why one is unavailable.
- Focus on identified hot paths and bottlenecks.
- Verify correctness before comparing performance.
- Compare before/after measurements when possible.
- Avoid trading correctness, security, or integrity for speed without approval.

## Output

- baseline and target metrics
- bottleneck analysis
- optimization approach
- before/after evidence
- known tradeoffs or regressions

## Measurement Gate

Before optimizing, identify:

- the symptom or user impact
- the baseline or reason no baseline is available
- the target metric or expected improvement
- correctness checks that must stay green

## Verification

Before reporting this work complete:

- record what evidence was inspected
- record checks that were run
- record checks that were skipped and why
- identify unresolved risks or ambiguity

## Common Mistakes

Avoid:

- optimizing without a measurable problem
- changing behavior unintentionally during optimization
- relying only on intuition without evidence
- reporting improvements without comparable measurements

## Escalate When

- no reliable measurement is possible
- optimization risks correctness or data integrity
- bottleneck location remains uncertain
