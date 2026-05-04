# Skill: Performance Optimization

## Purpose
Improve performance while preserving correctness and producing before/after evidence.

## Use When
- The task targets latency, throughput, memory, bundle size, query cost, or resource usage.
- A baseline, bottleneck, or measurable target is needed.
- Optimization could affect correctness, caching, data access, or concurrency.

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

## Do Not
- Do not trade correctness, security, or data integrity for performance without explicit approval.
- Do not claim improvement without measurement or a clear reason measurement was unavailable.
- Do not optimize outside the identified hot path without justification.
