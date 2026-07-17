# Test Scenarios — architecture-audit

Each scenario defines the input condition, the expected skill behaviour,
and the pass/fail criteria. Run these manually or use them to evaluate
skill output quality.

---

## T01 — Skill activates on correct trigger phrases

**Input**: User says "generate an architecture document for this repo"
**Expected**: Skill loads and begins repository exploration before writing anything
**Pass criteria**: First action is `list_directory` at repo root, not text generation

---

## T02 — Skill does NOT activate on README requests

**Input**: User says "write me a README"
**Expected**: `readme-generator` skill activates instead
**Pass criteria**: `architecture-audit` skill is not loaded

---

## T03 — Evidence-first: no content before exploration

**Input**: Any valid trigger phrase
**Expected**: Skill reads repo structure, Dockerfiles, manifests, and config
  before producing any section content
**Pass criteria**: At least `list_directory` + 3 file reads occur before
  the first markdown heading is generated

---

## T04 — Missing sections are skipped, not placeholdered

**Input**: Repo with no messaging system (no Kafka, RabbitMQ, SQS, etc.)
**Expected**: Section 8 (Event/Messaging Architecture) is absent from output
**Pass criteria**: Output contains no "Not applicable", "N/A", or empty
  section 8 heading

---

## T05 — Every security finding includes file and line

**Input**: Repo with a hardcoded secret in `config.js:14`
**Expected**: Finding references `config.js:14` verbatim
**Pass criteria**: No finding exists without an `Evidence: file:line` line

---

## T06 — Diagram ask happens before diagram output

**Input**: Any valid trigger phrase
**Expected**: Before producing any Mermaid block, skill asks:
  "Would you like these diagrams exported as draw.io files as well,
  or is Mermaid sufficient?"
**Pass criteria**: Diagram section is not written until user responds

---

## T07 — Severity labels are one of the four allowed values

**Input**: Any repo with security findings
**Expected**: Each finding is labelled CRITICAL, HIGH, MEDIUM, or LOW
**Pass criteria**: No custom labels (e.g. "moderate", "serious", "minor")
  appear in the Security Review section

---

## T08 — Technical Debt table uses P0–P3 only

**Input**: Any repo
**Expected**: Priority column contains only P0, P1, P2, or P3
**Pass criteria**: No "High/Medium/Low" or numeric-only priorities in debt table

---

## T09 — Output file is named correctly

**Input**: Any valid trigger phrase
**Expected**: Skill writes to `ARCHITECTURE_DOCUMENTATION.md` in repo root
**Pass criteria**: No other filename is used without explicit user instruction

---

## T10 — Author credit is present

**Input**: Any valid trigger phrase
**Expected**: Last line of output file contains `@simplymanas`
**Pass criteria**: Credit is present and correctly spelled
