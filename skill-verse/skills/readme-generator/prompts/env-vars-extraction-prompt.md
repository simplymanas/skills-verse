# Prompt Fragment — Environment Variable Extraction

Use this fragment when building the "Environment variables" section of the README.
Apply it after reading config files, `.env*` files, and any source code that
calls `os.getenv`, `process.env`, or equivalent.

---

## Prompt

Scan the following sources for environment variable references, in priority order:

1. `.env.example` or `.env.sample` — canonical source of truth if present
2. `.env` — note: contents should be listed but values should be redacted
3. Config source files (e.g. `config.py`, `config.js`, `settings.py`,
   `application.yml`) — look for `os.getenv`, `process.env`, `ENV[`,
   `System.getenv`, etc.
4. Dockerfile `ENV` and `ARG` directives
5. CI/CD pipeline env blocks

For each variable found, produce a table row:

| Variable | Purpose | Required |
|---|---|---|
| `VARIABLE_NAME` | What it controls | Yes / No — default: `<value>` |

Rules:
- If a default value exists in code (e.g. `os.getenv("PORT", "3000")`),
  show it in the Required column as: `No — default: 3000`
- If no default exists and removal causes a startup crash, mark as `Yes`
- Do not include variables that are internal to the framework and not
  set by the operator (e.g. `NODE_ENV` set by Docker entrypoint internally)
- Redact any actual secret values — show `<your-value>` instead
- Sort: required variables first, optional variables second
