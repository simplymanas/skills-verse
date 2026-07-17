# Test Scenarios — first-principles-audit

Each scenario defines the input condition, expected behaviour, and pass/fail criteria.

---

## T01 — Skill activates on correct trigger phrases

**Input**: User says "audit my codebase like you're the new CTO on day one"
**Expected**: Skill loads and begins full repository exploration before writing
**Pass criteria**: `list_directory` at root is the first tool call, not text output

---

## T02 — Skill does NOT activate on structured audit requests

**Input**: User says "write an architecture document for the review board"
**Expected**: `architecture-audit` skill activates instead
**Pass criteria**: `first-principles-audit` skill is not loaded

---

## T03 — Exploration is complete before any section is written

**Input**: Any valid trigger phrase
**Expected**: Skill reads repo structure, Dockerfiles, manifests, largest
  source files, and config before producing any markdown
**Pass criteria**: At least 5 file reads occur before the first `##` heading
  is generated

---

## T04 — Every security finding has an Evidence line with file and line number

**Input**: Repo with a known issue (e.g. hardcoded secret in `config.py:14`)
**Expected**: Finding includes `**Evidence**: \`config.py:14\``
**Pass criteria**: No finding in section 6 lacks an `Evidence:` line with a
  file reference

---

## T05 — Section 11 contains 3–5 items, no fewer

**Input**: Any valid trigger phrase on a non-trivial codebase
**Expected**: Section 11 has between 3 and 5 named blind spots
**Pass criteria**: Heading count in section 11 is between 3 and 5

---

## T06 — Section 11 names specific files or classes

**Input**: Any valid trigger phrase
**Expected**: Each blind spot in section 11 references at least one
  concrete file name or class name
**Pass criteria**: No blind spot is described in purely abstract terms
  without a code anchor

---

## T07 — Section 12 items name specific files or classes

**Input**: Any valid trigger phrase
**Expected**: Each "What I Would Kill" item names the exact file, class,
  directory, or CI job to remove
**Pass criteria**: No item is described as "the utility module" or
  "the old approach" without a concrete name

---

## T08 — The contrarian bet is specific and time-bounded

**Input**: Any valid trigger phrase
**Expected**: Section 14 bet names a specific technology, component, or
  pattern to change and implies a timeframe
**Pass criteria**: Bet does not contain phrases like "improve", "refactor
  generally", or "consider exploring"

---

## T09 — The steelman counter-argument is genuinely persuasive

**Input**: Any valid trigger phrase
**Expected**: The counter-argument in section 14 references real constraints
  (regulatory, operational, architectural) — not abstract concerns
**Pass criteria**: Counter-argument cannot be dismissed in one sentence;
  it must require real engagement to rebut

---

## T10 — Technical debt table uses P0–P3 only

**Input**: Any valid trigger phrase
**Expected**: Priority column in section 10 contains only P0, P1, P2, or P3
**Pass criteria**: No "High/Medium/Low", "Critical", or numeric-only
  priorities appear in the debt table

---

## T11 — Output file is named correctly

**Input**: Any valid trigger phrase
**Expected**: Skill writes to `arch-audit.md` in the repo root
**Pass criteria**: No other filename is used without explicit user instruction

---

## T12 — Author credit is present

**Input**: Any valid trigger phrase
**Expected**: Last line of `arch-audit.md` contains `@simplymanas`
**Pass criteria**: Credit is present and correctly spelled
