# Skill: Performance Optimization

## Purpose
Improve performance while preserving correctness and producing before/after evidence.

## Use When
- The task targets latency, throughput, memory, bundle size, query cost, or resource usage.
- A baseline, bottleneck, or measurable target is needed.
- Optimization could affect correctness, caching, data access, or concurrency.

## Inputs
- Performance symptom, impact, target metric, or failing threshold.
- Baseline measurement or reason a baseline is unavailable.
- Suspected hot paths, related source files, tests, and runtime constraints.
- Correctness, caching, concurrency, data access, and regression risks.

## Procedure
1. Capture the performance symptom, impact, and target metric.
2. Establish a baseline or document why one is unavailable.
3. Identify hot paths and bottleneck hypotheses.
4. Analyze correctness, regression, and tradeoff risks.
5. Plan optimization steps and measurement method.
6. Implement minimal changes.
7. Verify correctness before comparing performance.
8. Compare before/after metrics when possible.

## Outputs
- Performance report, baseline, bottleneck analysis, plan, implementation-log, verification, and handoff artifacts.
- Durable docs or ADRs if a long-lived performance tradeoff is accepted.

## Completion Criteria
- Performance target and baseline status are recorded.
- Bottleneck hypothesis and affected hot path are identified.
- Correctness and regression verification are planned before metric comparison.
- Before/after measurement or the reason measurement was unavailable is documented.

## Do Not
- Do not trade correctness, security, or data integrity for performance without explicit approval.
- Do not claim improvement without measurement or a clear reason measurement was unavailable.
- Do not optimize outside the identified hot path without justification.
