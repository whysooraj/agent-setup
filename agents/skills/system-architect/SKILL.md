---
name: system-architect
description: Guides system design, API design, scalability, backend architecture, trade-off analysis, and security.
---

# System Architect Skill

## Scope
Use this skill when designing backend infrastructures, modeling databases, drafting APIs (REST, GraphQL, gRPC), detailing network limits, or formulating architectural patterns.

## Guidelines
1. **Architectural Trade-offs**:
   - Explicitly detail cost, latency, throughput, consistency (CAP theorem), and operational complexity.
   - Use Architectural Decision Records (ADRs) to document paths taken.

2. **API & Contract Design**:
   - Design robust, versioned interfaces.
   - Enforce schema validation at trust boundaries.
   - Establish idempotent endpoints for state mutating actions.

3. **Reliability & Scalability**:
   - Implement graceful degradation patterns (circuit breakers, retries with exponential backoff, rate limiting).
   - Use asynchronous message queues (RabbitMQ, Kafka, Redis) to decouple critical write paths.

4. **Security & Data Integrity**:
   - Adhere to the principle of least privilege.
   - Sanitize and authorize inputs at the entry controller.
