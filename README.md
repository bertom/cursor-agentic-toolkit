# Cursor Agentic Toolkit

A lightweight way to run Cursor agents like a **small, disciplined engineering team**—with clear intent, traceable decisions, and real QA—without giving up control.

## Team Kit — collaboration upgrade

**Team Kit** is the first-class path for **small teams**: commit **`.agentic/`** so everyone shares context, workflow artifacts, and rules; validate each stage explicitly; use an **optional PR prompt** before merge; keep **Cursor** and **GitHub Copilot** aligned; onboard skeptics in one pass.

| Start here | Purpose |
|------------|---------|
| [ONBOARDING.md](agentic/team/ONBOARDING.md) | First hour for new devs + **start prompt** + handling agent drift |
| [TEAM_KIT_V1_REQUIREMENTS.md](agentic/team/TEAM_KIT_V1_REQUIREMENTS.md) | Full policy: gitignore defaults, traceability, ops vs repo |
| [WORKFLOW_VALIDATION.md](agentic/workflow/WORKFLOW_VALIDATION.md) | Agent + human **pass criteria** per workflow stage |
| [AI_INSTRUCTIONS_SYNC.md](agentic/team/AI_INSTRUCTIONS_SYNC.md) | `.cursor/rules` ↔ `.github/copilot-instructions.md` |

Default install (**`--gitignore-mode committed`**) is tuned for this: **`.agentic/` is not gitignored**; only the **`project-ops`** symlink name is. Intent doc (Dutch): [team-kit.md](team-kit.md).

## What This Is

If you ship software with Cursor, this toolkit helps you:

- **Turn vague asks into reliable delivery** — intent → brief → spec → tasks → implementation → QA, so agents don’t skip the thinking steps.
- **Keep context where agents can use it** — curated summaries and policies so every session starts from the same ground truth.
- **Share runtime with your team (Team Kit)** — commit `.agentic/` for shared traceability; use optional **`project-ops/`** for personal or long-form material outside git.
- **Stay human-in-the-loop** — approval gates, governance defaults, and a human-task lane for work only a person can do.

This repository is the **toolkit source**: templates, Cursor rules, guides, and an installer script you copy into any project. It defines the system; your project repo runs it day to day.

## What This Is Not

This repository is **not**:

- a master workspace for active projects
- a place to store real project specs/tasks/QA
- a place to store project business context or client materials

Daily development happens in independent project repositories, not here.

## Correct Layered Model

1. **Toolkit Source** (this repo)
2. **Project Runtime** (independent project repo, where Cursor is opened daily)
3. **Project Operational Memory** (external folder with project-specific operational artifacts)

In a real project, runtime typically looks like:

```
my-project/
  .agentic/
  project-ops/   -> symlink to external project memory
  src/
  package.json
```

Folder names are configurable. `.agentic` and `project-ops` are recommended defaults, not hard requirements.

## Why This Separation

- keeps toolkit reusable across many projects
- keeps **personal** operational memory outside the product repo (`project-ops` symlink; ignored by default)
- teams can **commit** `.agentic/` for shared context, workflow, and rules (default install)
- supports external memory stores without complicating agent paths

## Recommended External Setup

Use the toolkit to install `.agentic/` into an existing project repository, then optionally symlink `project-ops/` to external memory.

Scripted install:

```bash
./scripts/install-runtime.sh \
  --project-root "/path/to/my-project" \
  --runtime-dir ".agentic" \
  --ops-link-name "project-ops" \
  --ops-target "/external/project-memory/my-project" \
  --profile full
```

By default, installer uses **`--gitignore-mode committed`** (team-friendly):

- **does not** ignore `.agentic/` — commit the runtime layer for shared context and workflow
- **does** ignore the ops link name only (for example `project-ops`), so local personal operational memory stays out of git

If you **cannot** commit `.agentic/` (e.g. public repo constraints), use **`--gitignore-mode recommended`** to ignore both `.agentic/` and the ops link name.

**Toolkit alignment:** after install, fill the table at the top of `.agentic/README.md` with the toolkit git ref you installed from. Toolkit changes are summarized in [CHANGELOG.md](CHANGELOG.md).

**Cursor rules:** the installer copies toolkit `.cursor/rules/*.mdc` into **`<project-root>/.cursor/rules/`**. Cursor only auto-loads rules from that path when the project folder is your workspace root — not from `.agentic/` or from the toolkit repo alone. See [CURSOR_RULES_RUNTIME.md](agentic/guide/CURSOR_RULES_RUNTIME.md).

**GitHub Copilot (VS Code):** the installer writes **`<project-root>/.github/copilot-instructions.md`** from `agentic/team/copilot-instructions.project.md` (skipped if the file already exists; use `--force` to replace). See [AI_INSTRUCTIONS_SYNC.md](agentic/team/AI_INSTRUCTIONS_SYNC.md).

Opt out of any `.gitignore` changes:

```bash
./scripts/install-runtime.sh --project-root "/path/to/my-project" --gitignore-mode none
```

Preview only (no file writes):

```bash
./scripts/install-runtime.sh --project-root "/path/to/my-project" --profile full --dry-run
```

See:

- [`agentic/guide/EXTERNAL_SETUP.md`](agentic/guide/EXTERNAL_SETUP.md)
- [`agentic/guide/ARCHITECTURE_LAYERS.md`](agentic/guide/ARCHITECTURE_LAYERS.md)
- [`agentic/guide/QUICKSTART.md`](agentic/guide/QUICKSTART.md)

## Documentation

### Team Kit (start here for multi-dev repos)

| Document | Purpose |
|----------|---------|
| [ONBOARDING.md](agentic/team/ONBOARDING.md) | New dev path, start prompt, drift handling |
| [TEAM_KIT_V1_REQUIREMENTS.md](agentic/team/TEAM_KIT_V1_REQUIREMENTS.md) | Team policy and acceptance checklist |
| [WORKFLOW_VALIDATION.md](agentic/workflow/WORKFLOW_VALIDATION.md) | Validation matrix (agents + humans) |
| [AI_INSTRUCTIONS_SYNC.md](agentic/team/AI_INSTRUCTIONS_SYNC.md) | Cursor + Copilot alignment |
| [CONTEXT_SYNC.md](agentic/team/CONTEXT_SYNC.md) | No-AI context update before PR |
| [pr-review-prompt.md](agentic/team/prompts/pr-review-prompt.md) | Optional pre-PR review prompt |

### Core guides

| Document | Purpose |
|----------|---------|
| [SYSTEM_OVERVIEW.md](agentic/guide/SYSTEM_OVERVIEW.md) | What the toolkit is and why |
| [ARCHITECTURE_LAYERS.md](agentic/guide/ARCHITECTURE_LAYERS.md) | Layer model and placement |
| [EXTERNAL_SETUP.md](agentic/guide/EXTERNAL_SETUP.md) | Install into independent project repo |
| [BOOTSTRAP.md](agentic/guide/BOOTSTRAP.md) | Bootstrap runtime in opened project repo |
| [RUNTIME_PROFILES.md](agentic/guide/RUNTIME_PROFILES.md) | Minimal vs full runtime profiles |
| [UPGRADE_RUNTIME.md](agentic/guide/UPGRADE_RUNTIME.md) | Upgrade runtime from toolkit source |
| [END_TO_END_EXAMPLE.md](agentic/guide/END_TO_END_EXAMPLE.md) | Full setup example with external memory |
| [QUICKSTART.md](agentic/guide/QUICKSTART.md) | Short path to first use |
| [CURSOR_RULES_RUNTIME.md](agentic/guide/CURSOR_RULES_RUNTIME.md) | Why rules live in `.cursor/rules/` at project root |
| [CONTEXT_SYSTEM.md](agentic/guide/CONTEXT_SYSTEM.md) | Context model + external sources |
| [WORKFLOW_EXPLAINED.md](agentic/guide/WORKFLOW_EXPLAINED.md) | Workflow chain and traceability |
| [HUMAN_TASKS.md](agentic/guide/HUMAN_TASKS.md) | Human handoff and return locations |
| [DOCUMENTATION_STANDARDS.md](agentic/guide/DOCUMENTATION_STANDARDS.md) | Versioning and traceability |
| [CHANGELOG.md](CHANGELOG.md) | Toolkit source release notes |

## License

Provided as-is for use in your projects.
