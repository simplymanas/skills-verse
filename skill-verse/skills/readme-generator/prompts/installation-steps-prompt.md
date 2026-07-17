# Prompt Fragment — Installation Steps

Use this fragment when building the "Installation" section of the README.
Apply it after reading package manifests, Dockerfiles, and any Makefile
or shell scripts in the repo root.

---

## Prompt

Derive the installation commands directly from what is present in the repo.
Do not invent steps. Follow this decision tree:

### If the repo has `package.json`
```bash
npm install
# or if package-lock.json is present and npm version >= 7:
npm ci
```

### If the repo has `requirements.txt`
```bash
pip install -r requirements.txt
```
If there is a `--extra-index-url` or `--trusted-host` in CI, include it
with placeholder credentials, not real ones.

### If the repo has `pyproject.toml` / `poetry.lock`
```bash
poetry install
```

### If the repo has `go.mod`
```bash
go mod download
```

### If the repo has `pom.xml`
```bash
mvn install
```

### If the repo has `build.gradle`
```bash
./gradlew build
```

### Docker-first repos
If the primary way to run the project is Docker, lead with:
```bash
docker compose up --build
```
and note the manual install steps as "alternative (without Docker)".

---

## Additional rules

- If prerequisites (runtime version, system tools) must be installed first,
  note them in a "Prerequisites" section above Installation, not inline.
- If there are internal registry dependencies (Nexus, Artifactory, GitHub
  Packages), show the `--extra-index-url` flag with `<TOKEN>` placeholders.
- Never show actual credentials, even if they appear in repo files.
- Every command block must be copy-pasteable as-is (after substituting placeholders).
