# Changelog

All notable changes to the **Cursor Agentic Toolkit** (this repository) are documented here. For **your application repo**, track project context history separately (see `agentic/team/TEAM_KIT_V1_REQUIREMENTS.md` §6.1).

## [Unreleased]

### Removed

- Root **`team-kit.md`** (Dutch intent doc); English coverage remains in README Team Kit section, `TEAM_KIT_V1_REQUIREMENTS.md`, and linked guides.

### Changed

- Docs: root **README** and **Documentation** tables foreground **Team Kit**; `agentic/README`, `SYSTEM_OVERVIEW`, `QUICKSTART`, and `context-index` call out team collaboration; `SYSTEM_OVERVIEW`, `CONTEXT_SYSTEM`, and `context-index` clarify **committed `.agentic/`** vs **`project-ops`**; install “Next”, `FAQ`, and `END_TO_END_EXAMPLE` updates as before. Workspace rule **agentic-toolkit** implementation gate aligned with **agent-behavior** Rule 11 (primary app roots via **repo-map** / **technical-context**).
- **Onboarding / agents:** `ONBOARDING.md` adds **Start prompt (new chat)** and **When the agent drifts**; `agent-behavior.md` Rule 11 tightens **FB before application code** (paths via repo-map / technical-context); `copilot-instructions.project.md` mirrors the FB gate for Copilot.
- **Repo hygiene:** `.gitignore` ignores `_review-svb-agentic` (optional local symlink for runtime diff review).

### Fixed

- Installer: **`minimal`** profile now creates `human-tasks/pending` and `human-tasks/completed` (previously only `full`), matching human-task rules.

### Added

- **GitHub Copilot:** `agentic/team/copilot-instructions.project.md` → installed as **`<project-root>/.github/copilot-instructions.md`**; **`agentic/team/AI_INSTRUCTIONS_SYNC.md`** (how to stay aligned with `.cursor/rules/`). The toolkit source repo does **not** ship `.github/copilot-instructions.md` — only consumer installs do.
- Team Kit v1 building blocks: `agentic/team/ONBOARDING.md`, `TEAM_KIT_V1_REQUIREMENTS.md`, `CONTEXT_SYNC.md`, `team/prompts/pr-review-prompt.md`.
- `agentic/workflow/WORKFLOW_VALIDATION.md` — per-stage validation matrix for agents and humans.
- `agentic/README.md` — runtime readme with **toolkit alignment** table for projects.

### Changed

- **Install script default `--gitignore-mode` is `committed`** — `.agentic/` is **not** ignored by default (team / shared runtime). Use `recommended` to ignore both `.agentic/` and `project-ops` (e.g. public repo + private runtime). Use `none` for no gitignore entries.

---

Format follows [Keep a Changelog](https://keepachangelog.com/) where practical.
