# Prompt Fragment — The Contrarian 90-Day Bet
# (Section 14)

Use this fragment when generating section 14 of `arch-audit.md`.

---

## Prompt

Propose one bold, specific, actionable bet that the team would push back on.

### The bet must be

- **Specific**: names the technology, pattern, or system component to change
- **Time-bounded**: 90 days or less
- **Actionable**: a competent team could actually start it on Monday
- **Contrarian**: the team's immediate reaction should be "that's too risky"
  or "we'd never do that"

### The bet must NOT be

- A vague improvement ("improve test coverage", "refactor the monolith")
- Something the team is already doing or planning
- A safe, consensus recommendation

### Format

```
> **Bet**: <One to three sentences stating the specific bet.>

**Rationale**: <Why this makes sense from first principles. 2–4 sentences.
Reference actual evidence from the codebase — existing abstractions that
support the change, signals that the current approach is near its limit, etc.>
```

---

## The steelman counter-argument

Immediately after the bet, write the strongest possible argument against it.

### Rules for the counter-argument

- Written as if by the **smartest, most experienced person on the team**
  who disagrees — not a strawman
- Must be **genuinely persuasive** — someone reading it should think
  "that's actually a really good point"
- Must reference **real constraints**: regulatory, operational, team capacity,
  or architectural dependencies — not abstract concerns
- Do NOT let the counter-argument secretly agree with the bet

### Format

```
**Strongest argument against this bet**: <3–6 sentences. Make it count.
If a reader could wave it away in one sentence, it is not strong enough.>
```
