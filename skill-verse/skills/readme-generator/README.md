# readme-generator

## What it does

Generates a concise, developer-facing `README.md` that lets a developer clone, install, configure, and run the project in under 5 minutes. Every command and environment variable is verified against actual repo files — nothing is invented.

## When to use it

Trigger this skill when the user asks for:
- "README"
- "quick start doc"
- "getting started guide"
- A short document covering install, config, and run steps

**Not** for architecture documents, security reviews, or full technical audits — use `architecture-audit` or `first-principles-audit` for those.

## Output

| File | Description |
|---|---|
| `README.md` | Concise developer quick-start in the project root |

## Sections produced

1. Project name + one-sentence description
2. Tech stack
3. Prerequisites
4. Installation
5. Environment variables
6. Running locally
7. Running tests *(only if test config exists)*
8. Project structure
9. License *(only if LICENSE file exists)*

## Constraints

- Target length: under 150 lines
- No architecture diagrams, no security analysis
- No marketing language
- Every command is copy-pasteable and repo-verified

## Folder structure

```
readme-generator/
├── README.md        ← this file
├── skill.md         ← skill instructions loaded by the AI
├── examples/        ← sample generated READMEs for reference
├── prompts/         ← reusable prompt fragments
├── assets/          ← supporting files
└── tests/           ← test cases and validation scenarios
```
