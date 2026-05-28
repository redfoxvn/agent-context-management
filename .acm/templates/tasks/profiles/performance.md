# Task Profile: Performance

Use this profile with `.acm/templates/tasks/task.template.md`.

## Purpose

Use this profile when improving latency, throughput, memory usage, bundle size, query cost, or runtime efficiency.

## Additional Required Context

Capture:
- performance symptom and impact
- target metric or expectation
- baseline measurements
- suspected bottleneck
- correctness and regression risks
- before/after verification approach

## Definition of Ready

Before implementation:
- performance problem is observable or measurable
- baseline exists or missing baseline is explicitly acknowledged
- likely bottleneck areas are identified
- correctness risks are understood
- verification strategy includes before/after comparison when feasible

## Common Mistakes

Avoid:
- optimizing without a measurable problem
- changing behavior unintentionally during optimization
- relying only on intuition without evidence
- reporting improvements without comparable measurements
