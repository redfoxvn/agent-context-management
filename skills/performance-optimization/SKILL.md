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

Before reporting performance optimization complete:

### Baseline

- [ ] User impact or performance symptom documented
- [ ] Baseline measurement captured or unavailable baseline explained
- [ ] Target metric or success threshold defined
- [ ] Measurement environment recorded well enough to compare results

### Bottleneck

- [ ] Hot path or bottleneck identified with evidence
- [ ] Alternative bottlenecks considered where relevant
- [ ] Optimization scope limited to the measured issue
- [ ] Correctness checks identified before optimization

### Result

- [ ] Before/after measurements captured using comparable methods
- [ ] Correctness tests pass after optimization
- [ ] No security, data integrity, or behavior tradeoff introduced without approval
- [ ] Regression risk checked in adjacent paths

### Evidence

- [ ] Measurement commands, tools, or traces recorded
- [ ] Checks run are recorded
- [ ] Skipped checks are recorded with reasons
- [ ] Remaining performance uncertainty documented

## Common Mistakes

Avoid:

- optimizing without a measurable problem
- changing behavior unintentionally during optimization
- relying only on intuition without evidence
- reporting improvements without comparable measurements

## Related Skills

- **acm-task**: Classify performance work and load relevant source/tests
- **impact-analysis**: Identify correctness, security, and adjacent-module risks
- **test-driven-development**: Protect correctness before optimizing
- **code-review**: Review performance changes and tradeoffs
- **acm-memory**: Promote durable performance constraints or benchmarks when verified

## Escalate When

- no reliable measurement is possible
- optimization risks correctness or data integrity
- bottleneck location remains uncertain
