---
name: architecture-audit
description: Produce a full architecture, security, and performance audit document for the current repository. Use when the user asks for an "architecture document", "technical audit", "security review", "architecture review board submission", or similar enterprise-grade analysis — not for a short README.
---

# Architecture, Security & Performance Audit

## Purpose

Produce a single, evidence-based audit document, `ARCHITECTURE_DOCUMENTATION.md`,
covering architecture, security, and performance for the current repository.
This is a deep technical deliverable — distinct from the readme-generator
skill, which produces a short quick-start doc.

## Ground rules

- Analyze the actual codebase before writing anything: source, config,
  IaC/Docker/Kubernetes manifests, CI/CD pipelines, DB migrations/schemas,
  API specs, messaging/event configs, and observability setup.
- Every claim must trace to actual code or config. If something cannot be
  verified, write exactly: `Not verified from codebase.` — never assume or
  invent architecture.
- Do not pad sections with generic best-practice text that isn't grounded
  in this repo.

## Procedure

1. Explore the repository structure top to bottom before drafting any section.
2. Identify what's actually present (e.g. skip "Event/Messaging Architecture"
   entirely if there's no messaging system in the repo — don't write a
   placeholder).
3. Draft the document in the section order below. Do not skip ahead to
   diagrams or README content before the analysis sections are grounded.
4. Before generating diagrams, ask the user: "Would you like these diagrams
   exported as draw.io files as well, or is Mermaid sufficient?" Wait for
   their answer before producing diagram output.

## Required sections (in this order)

1. **Executive Summary** — what the system does, who uses it, core capabilities
2. **Repository Structure** — top-level dirs, purpose/responsibility of each, key files
3. **Technology Stack** — languages, frameworks, datastores, messaging, DevOps tooling, with versions where discoverable
4. **Architecture Overview** — components/services/layers, how they interact, which patterns are actually used (layered, CQRS, DDD, etc.) and where
5. **API Architecture** — endpoint inventory (route, method, auth, request/response shape), error handling, validation, versioning
6. **Database Architecture** — schemas/tables/collections, relationships, migrations, access patterns
7. **Request Lifecycle** — trace one representative request end-to-end (entry → auth → business logic → data access → response)
8. **Event/Messaging Architecture** — only if present; queues, consumers, retry/DLQ handling
9. **Security Review** — auth/authz model, data protection (encryption, secrets), input validation, dependency vulnerabilities. For each finding: severity, impact, recommendation.
10. **Performance Assessment** — concurrency model, caching, identified bottlenecks (N+1s, blocking calls, sync deps), each with a concrete recommendation
11. **Scalability & Reliability** — horizontal/vertical scaling readiness, single points of failure, resilience patterns (retries, circuit breakers, timeouts)
12. **Observability** — logging, metrics, tracing as actually configured
13. **Technical Debt** — prioritized list, each item with root cause and fix
14. **Diagrams** — Mermaid: system context, high-level architecture, request sequence, ER diagram, deployment. Only diagrams reflecting verified structure. Also export as draw.io if the user requested it in step 4.

## Output

- Single file: `ARCHITECTURE_DOCUMENTATION.md`
- Author credit at the end: `@simplymanas`
