# Prompt Fragment — Security Review Section

Use this prompt fragment when generating the Security Review section of
`ARCHITECTURE_DOCUMENTATION.md`. Paste after the relevant codebase evidence
has been gathered.

---

## Prompt

For each security finding discovered in the codebase, structure it exactly
as follows:

```
### <N>. <Short title> — <SEVERITY>

**Evidence**: `<file>:<line>` — <quote or description of the actual code>
**Impact**: <what concretely happens if this is exploited or misconfigured>
**Recommendation**: <specific, actionable fix — no vague "consider reviewing">
```

Severity levels (use exactly these words):
- **CRITICAL** — exploitable remotely with no auth, or causes data loss
- **HIGH** — significant risk requiring prompt remediation
- **MEDIUM** — real risk, mitigated by other controls or requires auth
- **LOW** — defence-in-depth improvements, minor exposure

Coverage checklist — verify each of these before declaring the section complete:

- [ ] Secrets handling: `.env`, hardcoded credentials, secrets in config files
- [ ] TLS: is verification enforced? any `verify=False` or equivalent?
- [ ] Auth/authz: how tokens are issued, validated, and expired
- [ ] Dependency CVEs: check any scan results (`trivyscan_result.txt`, `.snyk`, etc.)
- [ ] Input validation: user input reaching DB queries, shell commands, or file paths
- [ ] PII handling: how customer data is masked, logged, and stored
- [ ] Debug code in production: `print()`, hardcoded test routes, admin backdoors
- [ ] Session handling: expiry, carry-over, fixation risks

Do not write generic advice. Every finding must be traceable to a specific
file and line. If a category has no finding, skip it silently — do not write
"No issues found in X".
