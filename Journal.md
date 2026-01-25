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

```bash
# Create & activate virtual environment
python3 -m venv env && source env/bin/activate

# Print current directory file structure
tree -L 1

# Run MKDocs site with your hosts IP Address
mkdocs serve -a "$(hostname -I | awk '{print $1}'):8000"

```

</details>

---

<details>
<summary>🐞 Error Logs & Fixes</summary>

```bash
# Error: ModuleNotFoundError: No module named 'requests'
# Fix:
pip install requests

# Error: EADDRINUSE: address already in use
# Fix:
kill -9 $(lsof -t -i:3000)
```

</details>

---

## 🔗 Resource Findings
- [ChatGPT](https://chatgpt.com/)

---

## 🧠 Notes and Learnings
- Markdown supports collapsible sections using `<details>`
- Use `kill -9 $(lsof -t -i:<port>)` to free up ports

---

### 📅 1900-01-01

**Progress:** Started structuring the project journal  
**Focus:** Setup, notes, task tracking, and tooling
