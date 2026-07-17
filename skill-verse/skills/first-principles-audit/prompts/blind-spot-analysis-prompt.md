# Prompt Fragment — Blind Spot Analysis
# (Section 11: What Everyone Is Too Close To See)

Use this fragment when generating section 11 of `arch-audit.md`.
This is the most important section — prioritise it accordingly.

---

## Prompt

After completing the full codebase exploration, identify 3–5 things the team
has normalised that a first-principles reviewer would immediately flag.

These are NOT:
- The most critical security bugs (those belong in the Security Review)
- Generic best-practice violations anyone would catch
- Things already documented as known issues

These ARE:
- Structural assumptions the team stopped questioning
- Patterns that made sense once but have accumulated hidden costs
- The largest/most complex files nobody mentions by name
- Abstractions that started as one thing and became another
- Inherited decisions that are now load-bearing but no longer intentional

## How to find them — look for these signals

| Signal | What to look for |
|---|---|
| **Size outlier** | Files that are 3× larger than the median — they usually contain more than they should |
| **Two of the same thing** | Duplicate implementations (two HTTP clients, two config loaders, two PII maskers) — one is always the trap |
| **Silent failure** | `except: pass`, `return None` on error, bare `try/except Exception` — things that fail quietly |
| **The commented-out safety net** | Security jobs, circuit breakers, or tests that are present but disabled |
| **Config at module import** | Side effects at import time that fail silently and leave globals as `None` |
| **The political untouchable** | A large file or pattern that hasn't been modified in months despite being on the critical path |

## Format for each blind spot

```
### <Short, plain-language title — no softening>

<2–4 sentences. State what it is, where it lives (file/line if applicable),
why the team has stopped seeing it, and what the concrete risk is.>
```

## Tone rules

- Do not write "it may be worth considering"
- Do not write "the team might want to look at"
- Name the file. Name the pattern. State the risk directly.
- If it is embarrassing, that is why it belongs here.
