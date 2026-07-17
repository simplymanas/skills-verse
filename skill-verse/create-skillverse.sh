#!/bin/bash



# Root files
touch README.md CONTRIBUTING.md LICENSE

# Skill template
mkdir -p skill-template/{examples,prompts,assets,tests}
touch skill-template/skill.md
touch skill-template/README.md

# Skills
mkdir -p skills/{\
architecture-reviewer,\
adr-generator,\
incident-investigator,\
pull-request-reviewer,\
cloud-cost-analyzer,\
technical-design-writer,\
root-cause-analyzer,\
legacy-code-explainer,\
api-design-reviewer,\
onboarding-buddy\
}

# Docs
mkdir -p docs
touch docs/getting-started.md
touch docs/submission-guide.md
touch docs/best-practices.md

echo "✅ SkillVerse repository structure created successfully."