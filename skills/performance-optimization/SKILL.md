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

## Example: N+1 Query on a Dashboard

**Symptom:** `/dashboard` p95 latency is 4.2s under 50 concurrent users.

```
1. Classify: performance
2. Baseline (record environment):
   - p95 = 4200ms from APM + local load run; target < 800ms
3. Locate the bottleneck with evidence:
   - query log shows 1 + N pattern: 1 list query + 1 per project (N ≈ 120)
   → N+1 in src/services/dashboard.ts
4. Protect correctness:
   - existing dashboard tests green before any change
5. Optimize the measured issue only:
   - replace per-row fetch with a single batched join / IN query
6. Compare before/after (same input + environment):
   - p95 4200ms → 310ms; returned rows identical; tests still green
7. Guard: add a query-count assertion or benchmark; record numbers in the task record
```

**Outcome:** Measured the real bottleneck, fixed only that, and proved the win with comparable before/after evidence.

## Common Rationalizations

| Rationalization | Reality |
|---|---|
| "I know exactly where the bottleneck is" | Intuition is often wrong. Measure before changing anything. |
| "It's obviously slow, no need to baseline" | Without a baseline you cannot prove the change helped. Capture one. |
| "This optimization can't change behavior" | Caching, batching, and reordering are all behavior risks. Keep correctness tests green. |
| "It's faster on my machine, ship it" | One run is noise. Compare comparable measurements, not a single sample. |
| "We'll add the benchmark later" | The regression guard is the benchmark. Without it, the win silently erodes. |

## Red Flags - STOP and Measure

Stop when you notice:

- Optimizing without a captured baseline
- Picking the bottleneck by intuition instead of evidence
- Changing behavior or weakening a check to gain speed
- Comparing before/after with different inputs, environments, or single samples
- Reporting an improvement with no comparable measurement
- Expanding into "while I'm here" optimizations on cold paths

**ALL of these mean: STOP. Capture the baseline. Locate the bottleneck with evidence. Then optimize.**

## Related Skills

- **acm-task**: Classify performance work and load relevant source/tests
- **impact-analysis**: Identify correctness, security, and adjacent-module risks
- **test-driven-development**: Protect correctness before optimizing
- **code-review**: Review performance changes and tradeoffs
- **acm-memory**: Promote durable performance constraints or benchmarks when verified

## Stop Conditions

- no reliable measurement is possible
- optimization risks correctness or data integrity
- bottleneck location remains uncertain
