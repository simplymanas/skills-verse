# SkillVerse

A catalog of reusable Tabnine Agent Skills. Each skill is a structured AI workflow that engineers can invoke directly inside their editor to handle a specific engineering task — auditing a codebase, generating a README, or running a first-principles review.

---

## Skills

### Available

| Skill | Trigger phrase (examples) | Output |
|---|---|---|
| [architecture-audit](skills/architecture-audit/) | "architecture document", "technical audit", "security review", "architecture review board submission" | `ARCHITECTURE_DOCUMENTATION.md` |
| [first-principles-audit](skills/first-principles-audit/) | "audit the codebase like a new CTO", "first principles teardown", "what would you kill", "find blind spots" | `arch-audit.md` |
| [readme-generator](skills/readme-generator/) | "generate a README", "quick start doc", "getting started guide" | `README.md` |

### Planned (work in progress)

| Skill | Description |
|---|---|
| adr-generator | Generates Architecture Decision Records from design discussions |
| incident-investigator | Analyzes production incidents and reconstructs timelines |
| pull-request-reviewer | Reviews pull request diffs for quality, security, and test coverage |
| cloud-cost-analyzer | Reviews cloud architectures for cost and resource optimization |
| technical-design-writer | Drafts technical design documents from requirements |
| root-cause-analyzer | Produces structured Root Cause Analysis reports using the 5-Whys method |
| legacy-code-explainer | Explains unfamiliar or legacy codebases with dependency mapping |
| api-design-reviewer | Reviews APIs against REST best practices and enterprise standards |
| onboarding-buddy | Helps new engineers understand a system's architecture and repositories |

---

## How to Use a Skill

Skills are loaded and run by Tabnine Agent inside your editor. There is no CLI invocation — you talk to the agent in natural language.

**Step 1.** Open any project in your editor with Tabnine Agent connected to this SkillVerse repository.

**Step 2.** Type a trigger phrase in the chat panel. For example:

```
Give me a full architecture document for this repo.
```

```
Audit this codebase like a new CTO — first principles, no sacred cows.
```

```
Generate a README for this project.
```

**Step 3.** The agent matches your request to the appropriate skill, loads the `skill.md` instructions, explores your codebase, and produces the output file directly in your project root.

Each skill documents its own trigger phrases and output in its `README.md`. If the agent produces a file (e.g. `ARCHITECTURE_DOCUMENTATION.md`), it will appear in your working directory when the run completes.

---

## Setup

**Prerequisites**

- Git
- A Tabnine-supported editor (VS Code, JetBrains IDEs, etc.) with Tabnine Agent enabled
- Access to this repository (clone or fork)

**Clone**

```bash
git clone https://github.com/your-org/skill-verse.git
```

**Point Tabnine Agent at SkillVerse**

Configure Tabnine Agent to use this repository as a skill source. Refer to your organization's Tabnine Agent configuration guide for the exact setting. Once connected, skills are available in any project you open.

**Verify**

Open any project, open the Tabnine chat panel, and type:

```
Generate a README for this project.
```

If the agent responds and starts exploring the repo, the setup is working.

---

## Repository Structure

```text
skill-verse/
├── README.md
├── CONTRIBUTING.md
├── LICENSE
├── create-skillverse.sh       # scaffold script for adding new skills
│
├── skill-template/            # canonical template for new skills
│   ├── skill.md
│   ├── README.md
│   ├── examples/
│   ├── prompts/
│   ├── assets/
│   └── tests/
│
├── skills/                    # all published skills live here
│   ├── architecture-audit/
│   ├── first-principles-audit/
│   └── readme-generator/
│
└── docs/
    ├── getting-started.md
    ├── submission-guide.md
    └── best-practices.md
```

Each skill folder follows the same layout:

```text
<skill-name>/
├── README.md     # what it does, when to use it, output description
├── skill.md      # agent instructions (loaded at runtime)
├── examples/     # sample inputs and outputs
├── prompts/      # reusable prompt fragments
├── assets/       # supporting files and diagrams
└── tests/        # validation scenarios
```

---

## Adding a New Skill

1. Copy `skill-template/` into `skills/<your-skill-name>/`.
2. Fill in `skill.md` with agent instructions following the patterns in existing skills.
3. Fill in `README.md` with what it does, trigger phrases, and output description.
4. Add at least one example to `examples/`.
5. Open a pull request.

Run the scaffold script to create the folder structure automatically:

```bash
bash create-skillverse.sh
```

---

## Contributing

Review `CONTRIBUTING.md` before submitting a pull request. A skill should solve a reusable engineering problem, include clear documentation, and be adoptable across multiple teams without modification.

---

## Suggestions for This Project

The following are observations based on the current state of the repository.

**1. Most planned skills have no implementation.**
Nine of the twelve listed skills are stubs with no `skill.md` content. The repository reads larger than it is. Consider either removing the stubs from the skills table until they are ready, or marking them clearly as planned so contributors know what to pick up.

**2. `CONTRIBUTING.md`, `docs/`, and `skill-template/` are empty.**
These files are referenced from the README and from skill READMEs, but contain no content. A contributor following the documented process hits dead ends immediately. Filling in `docs/getting-started.md` and `docs/submission-guide.md` would unblock external contributions.

**3. There is no skill validation or testing process.**
The `tests/` folder exists in each skill but has no content and no test runner. Defining even a minimal checklist — does the skill produce the expected output file, does it cite evidence, does it avoid hallucinating commands — would raise the quality floor for new contributions.

**4. Skill discovery relies entirely on the README.**
There is no index file, no tags, and no machine-readable metadata beyond the frontmatter in `skill.md`. Adding a `skills/index.yaml` or a consistent frontmatter schema would allow tooling to auto-generate skill listings and make the catalog searchable without reading every folder.

**5. No versioning strategy for skills.**
Skills will drift as the agent model and Tabnine API evolve. A simple version field in the `skill.md` frontmatter and a changelog per skill would make it easier to track when a skill was last validated and against which agent version.

**6. The `create-skillverse.sh` script scaffolds a different set of skills than those in `skills/`.**
The script creates the original ten planned skill directories; the actual `skills/` folder has three different ones. The script should be updated to reflect the current and planned set, or replaced with a generic `new-skill.sh <name>` scaffolder.

