---
name: first-principles-audit
description: >
  Audit the entire codebase the way a new CTO would on day one — opinionated,
  evidence-based, with no sacred cows. Use when the user asks to "audit the
  codebase like a new CTO", wants to know what a fresh set of eyes would kill,
  asks for blind spots, contrarian bets, or anything framed as a first-principles
  teardown rather than a polite architecture review. Distinct from architecture-audit,
  which is a structured compliance document. This skill produces a blunt,
  prioritised verdict.
---

# First-Principles Audit

## Purpose

Produce a single, opinionated audit file (`arch-audit.md`) that answers four
questions a first-principles reviewer would ask:

1. What does this system actually do, and how?
2. What is everyone too close to see?
3. What would you kill that people are afraid to touch?
4. What is the one contrarian 90-day bet — and what is the strongest argument
   against it?

This is a frank, evidence-grounded teardown. Every claim must trace to actual
code, config, or a file in the repo. Never invent findings.

---

## Ground Rules

- Read the codebase before writing a single word. No assumptions.
- Every finding must cite the file and line or section where the evidence was
  found (e.g. `config.py:84`, `docker-compose.yml`, `trivyscan_result.txt`).
- If something cannot be verified, write: `Not verified from codebase.`
- Do not pad sections with generic best-practice boilerplate that is not
  grounded in *this* repo.
- Be direct. If something is broken, say it is broken.
- Scope: the entire codebase — source, config, IaC, CI/CD, Dockerfiles,
  dependency manifests, secrets handling, test coverage, and observability.

---

## Procedure

1. **Explore the full repository structure** — `list_directory` at root, then
   recurse into every meaningful subdirectory. Do not skip config, CI, or
   infrastructure directories.

2. **Read the critical files** in parallel where possible:
   - Dependency manifests (`requirements.txt`, `package.json`, `go.mod`, etc.)
   - All Dockerfiles and `docker-compose.yml`
   - CI/CD pipeline definitions (`.github/workflows/`, `cicd/`, etc.)
   - Environment config files and any `.env` file present
   - Security scan results (`trivyscan_result.txt`, `.snyk`, etc.)
   - The largest/most complex source files (sort by line count)
   - Auth, config-loading, HTTP client, and caching code
   - Test directory structure and coverage config

3. **Identify the hidden load-bearers** — the files or patterns that the team
   relies on but no one talks about. These are usually the largest files, the
   most-imported utilities, or the abstractions that accumulated too much
   responsibility.

4. **Draft the audit document** in the section order below. Do not start
   writing until exploration is complete.

---

## Required Sections (in this order)

### 1. Executive Summary
What the system does, who uses it, core capabilities. Three sentences maximum.

### 2. Repository Structure
Table: path → purpose/responsibility. Flag anything that looks stale, duplicated,
or misplaced.

### 3. Technology Stack
Table: layer → technology → version. Note where versions are pinned, unpinned,
or dangerously stale.

### 4. Architecture Overview
How the components interact. Which patterns are actually in use (layered,
CQRS, event-driven, etc.). Include a Mermaid flowchart of the real
architecture — not the idealised one.

### 5. Request Lifecycle
Trace one representative, high-stakes request end-to-end (pick the most
complex happy path). Entry → auth → business logic → data access → response.
Name actual classes and functions.

### 6. Security Review
For each finding, provide:
- **Severity**: CRITICAL / HIGH / MEDIUM / LOW
- **Evidence**: file + line
- **Impact**: what an attacker or misconfiguration actually causes
- **Recommendation**: concrete, not vague

Cover at minimum: secrets handling, TLS, auth/authz, dependency CVEs, input
validation, PII handling, and any debug code reachable in production.

### 7. Performance Assessment
For each finding:
- **Severity**: HIGH / MEDIUM / LOW
- **Evidence**: file + line
- **Impact**: what breaks at scale
- **Recommendation**: concrete fix

Focus on: blocking I/O in async runtimes, unbounded concurrency, N+1 patterns,
cache correctness, and startup-time side effects.

### 8. Scalability & Reliability
Table: concern → finding → verdict (✅ / ⚠️ / ❌). Cover: statelessness,
single points of failure, circuit breakers, timeouts, retry logic, graceful
degradation.

### 9. Observability
What is actually configured: structured logging, distributed tracing, metrics,
alerting. Call out gaps explicitly.

### 10. Technical Debt — Prioritised
Table with columns: Priority | Item | Root Cause | Fix. Use P0/P1/P2/P3.

### 11. What Everyone Is Too Close To See
**This is the most important section.** Identify 3–5 things the team has
normalised that a fresh set of eyes immediately flags. These are not
necessarily the most critical bugs — they are the structural assumptions,
inherited patterns, or quiet load-bearers that nobody questions because they
"just work". Name them plainly. Do not soften the language.

### 12. What I Would Kill
A short, direct list of code, files, patterns, or processes that should be
deleted or discontinued — things people are afraid to touch because they are
old, load-bearing in appearance, or politically sensitive. Give one sentence
of justification per item. Be specific: name the file or class.

### 13. Diagrams
Mermaid diagrams only. Include:
- System context (C4 or flowchart)
- High-level architecture
- The most complex request sequence (auth or data flow)
- ER or state diagram if a database or state machine is present

Only draw what is verified. Do not diagram hypothetical components.

### 14. The Contrarian 90-Day Bet
One bold, specific, actionable bet. Not "improve test coverage." Something
the team would push back on. Then immediately follow with:

**Strongest argument against this bet**: a steelman of the opposing view,
written as if by the smartest person on the team who disagrees. It must be
genuinely persuasive, not a strawman.

---

## Output

- Single file: `arch-audit.md`
- Tone: direct, evidence-based, no hedging, no "consider exploring whether"
- Length: as long as the evidence demands; do not pad, do not truncate findings
- Author credit at the end: `@simplymanas`
