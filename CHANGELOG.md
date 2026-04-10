# Changelog

All notable changes to the **Cursor Agentic Toolkit** (this repository) are documented here. For **your application repo**, track project context history separately (see `agentic/team/TEAM_KIT_V1_REQUIREMENTS.md` §6.1).

## [Unreleased]

### Changed

- Docs: `SYSTEM_OVERVIEW`, `CONTEXT_SYSTEM`, and `context-index` now state **committed `.agentic/`** (Team Kit) vs **`project-ops`** clearly; install “Next” step clarifies onboarding vs full-profile links; `FAQ` adds team / no-AI entries; `END_TO_END_EXAMPLE` notes default gitignore.

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
