# architecture-audit

## What it does

Produces a single, evidence-based audit document (`ARCHITECTURE_DOCUMENTATION.md`) covering architecture, security, and performance for the current repository. This is an enterprise-grade technical deliverable — not a quick-start README.

## When to use it

Trigger this skill when the user asks for:
- "architecture document"
- "technical audit"
- "security review"
- "architecture review board submission"
- Any comprehensive, structured analysis of the codebase

**Not** for short READMEs or quick-start guides — use `readme-generator` for those.

## Output

| File | Description |
|---|---|
| `ARCHITECTURE_DOCUMENTATION.md` | Full audit document in the project root |

## Sections produced

1. Executive Summary
2. Repository Structure
3. Technology Stack
4. Architecture Overview
5. API Architecture
6. Database Architecture
7. Request Lifecycle
8. Event/Messaging Architecture *(only if present)*
9. Security Review
10. Performance Assessment
11. Scalability & Reliability
12. Observability
13. Technical Debt
14. Diagrams (Mermaid, optionally draw.io)

## Folder structure

```
architecture-audit/
├── README.md        ← this file
├── skill.md         ← skill instructions loaded by the AI
├── examples/        ← sample audit outputs for reference
├── prompts/         ← reusable prompt fragments
├── assets/          ← supporting files (diagrams, templates)
└── tests/           ← test cases and validation scenarios
```
