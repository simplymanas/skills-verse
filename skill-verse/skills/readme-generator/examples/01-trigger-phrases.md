# Example Trigger Phrases — readme-generator

These are real user messages that should activate this skill.

## Direct requests
- "Generate a README for this project"
- "Write me a README.md"
- "Create a getting started guide"
- "Write a quick start doc"
- "I need a README so new devs can get up and running"
- "Can you produce the README file for this repo?"

## Implicit requests
- "Document how to install and run this"
- "Write something developers can follow to set up the project locally"
- "We need onboarding docs — just the basics to get started"
- "New engineer joins tomorrow, what should they read first?"

## Boundary cases — should NOT trigger this skill
- "Write a full architecture document" → use `architecture-audit`
- "Do a security review" → use `architecture-audit`
- "Audit this codebase like a new CTO" → use `first-principles-audit`
- "What does this function do?" → use `explain-code`
- "A README already exists — rewrite it from scratch" → confirm with user first
