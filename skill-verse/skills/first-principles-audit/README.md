# first-principles-audit

## What it does

Audits the entire codebase the way a new CTO would on day one — opinionated, evidence-based, and with no sacred cows. Produces a single blunt audit file (`arch-audit.md`) that answers four questions:

1. What does this system actually do, and how?
2. What is everyone too close to see?
3. What would you kill that people are afraid to touch?
4. What is the one contrarian 90-day bet — and what is the strongest argument against it?

## When to use it

Trigger this skill when the user asks to:
- "audit the codebase like a new CTO"
- find blind spots or what a fresh set of eyes would flag
- get an opinionated teardown rather than a polite review
- identify what should be killed, deleted, or discontinued
- produce a contrarian or first-principles assessment

**Not** for structured compliance documents — use `architecture-audit` for those.

## Output

| File | Description |
|---|---|
| `arch-audit.md` | Opinionated audit document in the project root |

## Sections produced

1. Executive Summary
2. Repository Structure
3. Technology Stack
4. Architecture Overview
5. Request Lifecycle
6. Security Review
7. Performance Assessment
8. Scalability & Reliability
9. Observability
10. Technical Debt — Prioritised
11. **What Everyone Is Too Close To See** *(the most important section)*
12. **What I Would Kill**
13. Diagrams (Mermaid)
14. **The Contrarian 90-Day Bet** + steelman counter-argument

## Folder structure

```
first-principles-audit/
├── README.md        ← this file
├── skill.md         ← skill instructions loaded by the AI
├── examples/        ← sample audit outputs for reference
├── prompts/         ← reusable prompt fragments
├── assets/          ← supporting files (diagrams, templates)
└── tests/           ← test cases and validation scenarios
```
