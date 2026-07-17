# Example Trigger Phrases — architecture-audit

These are real user messages that should activate this skill.

## Direct requests
- "Generate an architecture document for this repo"
- "Write me a technical audit of the codebase"
- "Produce an architecture review board submission"
- "Do a full security and performance review"
- "Document the system architecture"
- "I need an architecture doc for my team"

## Implicit requests
- "Can you analyse how this system is structured?"
- "We're doing an engineering review — can you document what we have?"
- "What does the security posture of this codebase look like?"
- "Give me a deep technical breakdown of this project"
- "We need something to present to the architecture review board"

## Boundary cases — should NOT trigger this skill
- "Write a README" → use `readme-generator`
- "Audit this like a new CTO would" → use `first-principles-audit`
- "What does this function do?" → use `explain-code`
- "Generate tests for this class" → use `test`
