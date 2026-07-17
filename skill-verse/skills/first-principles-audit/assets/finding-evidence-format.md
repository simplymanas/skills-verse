# Finding & Evidence Format Guide — first-principles-audit

Every finding in sections 6 (Security) and 7 (Performance) must follow
this exact format. No exceptions.

---

## Security finding format

```
### <N>. <Short title — plain language, no jargon> — <SEVERITY>

**Evidence**: `<file>:<line>` — <exact quote or precise description of the code>
**Impact**: <what concretely happens — name the threat actor or failure mode>
**Recommendation**: <specific, actionable fix — no "consider reviewing">
```

### Severity levels

| Level | When to use |
|---|---|
| **CRITICAL** | Exploitable remotely with no auth, or causes irreversible data loss |
| **HIGH** | Significant risk; exploitable under specific but realistic conditions |
| **MEDIUM** | Real risk mitigated by other controls, or requires authenticated access |
| **LOW** | Defence-in-depth improvement; unlikely to be directly exploited |

---

## Performance finding format

```
### <N>. <Short title> — <SEVERITY>

**Evidence**: `<file>:<line>` — <description of the problematic code>
**Impact**: <what degrades and at what scale — be specific>
**Recommendation**: <concrete fix with example if possible>
```

### Severity levels

| Level | When to use |
|---|---|
| **HIGH** | Causes measurable degradation under normal production load |
| **MEDIUM** | Degrades under peak load or with large data sets |
| **LOW** | Minor inefficiency; negligible impact under expected load |

---

## Rules that apply to every finding

1. **Never write a finding without an `Evidence` line.**
   If you cannot point to a file and line, it is not a finding — it is a
   suspicion. Write `Not verified from codebase.` and move on.

2. **Impact must describe a real consequence, not repeat the title.**
   Bad: "This is a security risk."
   Good: "An attacker who intercepts Redis traffic can steal customer auth
   tokens and impersonate any authenticated user."

3. **Recommendation must be actionable in one sprint.**
   Bad: "Improve the security posture of the Redis connection."
   Good: "Enable `ssl=True, ssl_ca_certs=certifi.where()` in `redis_client.py:14`."

4. **Sort findings within each section by severity, highest first.**

5. **Do not create a finding for something that *might* be an issue.**
   Only include things evidenced in the code.
