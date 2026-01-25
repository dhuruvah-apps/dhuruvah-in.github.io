#!/bin/bash

# ==============================================================================
# Script: setup.sh
# Purpose: Set up core infrastructure, environment configs, and project scaffolding
# ==============================================================================

# ------------------------------------------------------------------------------
# Create core infrastructure and configuration files
# ------------------------------------------------------------------------------
python3 -m venv env 
source env/bin/activate

pip3 install mkdocs-material==9.6.15
mkdocs new portfolio

cd portfolio

pip3 freeze > requirements.txt

mkdir -p docs/assets/images \
      docs/assets/javascripts \
      docs/assets/stylesheets \
      docs/overrides/partials \
      .github/workflows

curl -o docs/assets/images/logo.svg https://cdn.jsdelivr.net/npm/simple-icons@v11/icons/materialformkdocs.svg

touch docs/assets/javascripts/extra.js \
      docs/assets/stylesheets/extra.css \
      docs/overrides/partials/logo.html \
      docs/articles.md \
      docs/certifications.md \
      docs/contributions.md \
      docs/projects.md \
      .github/workflows/deploy.yml \
      Journal.md

echo "# Articles" > docs/articles.md
echo "# Certifications" > docs/certifications.md
echo "# Contributions" > docs/contributions.md
echo "# Projects" > docs/projects.md

mkdocs build

# ------------------------------------------------------------------------------
# Generate example environment configuration
# ------------------------------------------------------------------------------

# ---------------------------------MKDocs.yml---------------------------------------------
cat <<EOF > mkdocs.yml
site_name: Material for MkDocs Portfolio Template
repo_name: MrChike/mkdocs-portfolio
repo_url: https://github.com/MrChike/mkdocs-portfolio

nav:
  - Home: index.md
  - Projects: projects.md
  - Contributions: contributions.md
  - Certifications: certifications.md
  - Articles: articles.md

theme:
  name: material
  favicon: https://cdn.jsdelivr.net/npm/simple-icons@v11/icons/materialformkdocs.svg
  custom_dir: docs/overrides
  features:
    - toc.integrate
    - navigation.tabs
    - navigation.footer

extra_css:
  - assets/stylesheets/extra.css

extra_javascript:
  - assets/javascripts/extra.js

EOF

# ---------------------------------Journal.md---------------------------------------------
cat <<EOF > Journal.md
# 📝 Journal

## 🧭 Table of Contents
- ✅ [TODO](#todo)
- 💻 [Commands](#commands)
- 🐞 [Error Logs & Fixes](#error-logs--fixes)
- 🔗 [Resource Findings](#resource-findings)
- 🧠 [Notes & Learnings](#notes--learnings)

---

## ✅ TODO
- Placeholder Task [Start-End:Duration] [Date]

---

<details>
<summary>💻 Commands</summary>

\`\`\`bash
# Create & activate virtual environment
python3 -m venv env && source env/bin/activate

# Print current directory file structure
tree -L 1

mkdocs serve -a "\$(hostname -I | awk '{print \$1}'):8000"

\`\`\`

</details>

---

<details>
<summary>🐞 Error Logs & Fixes</summary>

\`\`\`bash
# Error: ModuleNotFoundError: No module named 'requests'
# Fix:
pip install requests

# Error: EADDRINUSE: address already in use
# Fix:
kill -9 \$(lsof -t -i:3000)
\`\`\`

</details>

---

## 🔗 Resource Findings
- [ChatGPT](https://chatgpt.com/)

---

## 🧠 Notes and Learnings
- Markdown supports collapsible sections using \`<details>\`
- Use \`kill -9 \$(lsof -t -i:<port>)\` to free up ports

---

### 📅 1900-01-01

**Progress:** Started structuring the project journal  
**Focus:** Setup, notes, task tracking, and tooling
EOF

# ------------------------------------.gitignore------------------------------------------
cat <<EOF > .gitignore
env
site

EOF

# ------------------------------------Logo.html------------------------------------------
cat <<EOF > docs/overrides/partials/logo.html
{% block site_nav %}
  <div class="social-icons">
    <img src="https://cdn.jsdelivr.net/npm/simple-icons@v11/icons/materialformkdocs.svg" alt="Profile" class="custom-icon" />
  </div>
{% endblock %}

EOF

cat <<EOF > docs/assets/stylesheets/extra.css
.social-icons .custom-icon {
  width: 1.5rem;
  height: 1.5rem;
  filter: invert(100%);
  transition: transform 0.2s ease;
}

EOF
