# Severity Classification Guide

Reference for classifying security and performance findings consistently
across all `architecture-audit` runs.

---

## Security Severity

| Level | Definition | Example |
|---|---|---|
| **CRITICAL** | Exploitable remotely with no authentication, or causes irreversible data loss / full compromise | Hardcoded production credentials · RCE via unsanitised input · Auth bypass |
| **HIGH** | Significant risk requiring prompt remediation; exploitable with low-privilege access or specific conditions | TLS verification disabled · Known CVE in a dependency with a public PoC · JWT signed with weak secret |
| **MEDIUM** | Real risk mitigated by other controls, or requires authenticated access to exploit | Debug routes reachable in prod · PII leaking to logs · Session tokens not expiring |
| **LOW** | Defence-in-depth improvements; unlikely to be directly exploited | Missing security headers · `assert` in production code · Overly broad CORS policy |

---

## Performance Severity

| Level | Definition | Example |
|---|---|---|
| **HIGH** | Causes measurable degradation under normal load; likely to cause incidents | Blocking I/O in async runtime · N+1 queries on hot path · Unbounded `gather` with no semaphore |
| **MEDIUM** | Degrades under peak load or with large data sets; not immediately visible in low-traffic environments | Missing DB index on frequently filtered column · Cache TTL too short causing repeated cold fetches · Linear scan on large list |
| **LOW** | Minor inefficiency; negligible impact under expected load | Redundant config reads · Inefficient string concatenation in non-hot path · Repeated regex compilation |

---

## Technical Debt Priority

| Priority | Definition |
|---|---|
| **P0** | Fix before next production deployment. Security or correctness risk. |
| **P1** | Fix within current sprint. Causing real pain or blocking other work. |
| **P2** | Fix within next quarter. Important but not urgent. |
| **P3** | Fix when touching related code. Low impact but worth cleaning up. |

---

## How to use this guide

1. Apply the **highest applicable** severity when a finding fits multiple levels.
2. When in doubt between two levels, choose the higher one and note the
   mitigating factor in the recommendation.
3. Do not create a finding entry for something that *might* be an issue —
   only for things evidenced in the code.
