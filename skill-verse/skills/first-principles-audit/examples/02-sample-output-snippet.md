# Sample Output Snippet — first-principles-audit

This shows the tone and format of the three distinctive sections that
separate this skill from `architecture-audit`. A full run also includes
the standard sections (repo structure, tech stack, etc.).

---

## 11. What Everyone Is Too Close To See

### The observability layer has become a second business logic layer.

`instrumentations.py` is 2,411 lines. It contains hardcoded journey names,
A/B variation keys, domain strings, and slot-name mappings — all business
logic — buried inside what is presented as an observability abstraction.
Nobody talks about this because it "just works" and touching it is
terrifying. It is the biggest maintenance liability in the repo.

### Two HTTP clients coexist and nobody enforces which one to use.

`HttpClient` (sync/blocking `requests`) and `call_api` (async/httpx) both
exist. Any new developer who opens the codebase sees `HttpClient` with its
familiar parameter object pattern and reaches for it — silently blocking the
event loop. There is no linter rule, no ADR, no warning.

### PII masking is best-effort and the team has normalised this without documenting it.

Both bot_proxy and the action server run presidio, but a spaCy model load
failure at import time means all subsequent messages go unmasked with no
alerting. This is a GDPR risk that is not surfaced anywhere in the codebase.

---

## 12. What I Would Kill

1. **`HttpClient` / `clients/impl/http_client.py`** — Synchronous, redundant,
   and actively harmful in an async runtime. Rename it
   `BLOCKING_DO_NOT_USE_HttpClient` today if the team won't delete it.

2. **All `rasapro*/` and `ras-3.14-pro/` directories** — Four stale experiment
   directories at the repo root not referenced by any Dockerfile or CI pipeline.
   Delete on day one.

3. **`WhatIsMyBucketingNumber` action** — Internal debug tool triggerable by
   any customer who types the right string in production, with zero auth.

4. **`docker-compose.yml` referencing `rasa/rasa:2.7.1-full`** — Production
   runs 3.14. This file will mislead every new engineer. Update or delete.

5. **The Snyk job in CI** — Fully implemented, correctly configured, and
   entirely commented out in `regression.yml`. Uncomment and make it blocking.

---

## 14. The Contrarian 90-Day Bet

> **Bet**: Retire the Rasa story graph for the three highest-volume journeys
> and replace the dialogue layer with a stateless LLM function-calling
> architecture within 90 days. Keep the entire Python action server as-is —
> it maps directly to LLM tools.

**Strongest argument against this bet**: Rasa's deterministic story graph is
the *only* guarantee preventing a hallucinated response in a high-stakes,
financially consequential journey. An LLM that confidently confirms an order
cancellation that silently failed the API call is a regulatory and reputational
risk for a FTSE-listed retailer. The OTP authentication flow has strict legal
sequencing that a probabilistic model could short-circuit under adversarial
prompting. The 90-day timeline is reckless for a system that touches financial
transactions and customer PII at scale.

---

*@simplymanas*
