# Repository Map

> High-level overview of the workspace structure. Helps agents and new contributors navigate the codebase.

## Workspace Overview

| Field | Value |
|-------|-------|
| Workspace | cursor-agentic-toolkit |
| Purpose | Self-documenting agentic workflow layer for AI-assisted development |
| Architecture | Wrapper pattern — toolkit at root, project repos in `projects/` |
| Project Mode | new |

## Directory Structure

```
cursor-agentic-toolkit/
├── agentic/                       — Toolkit core
│   ├── context/                   — Curated project context
│   │   ├── business-context.md
│   │   ├── client-input.md
│   │   ├── technical-context.md
│   │   ├── constraints.md
│   │   ├── package-policy.md
│   │   └── governance.md
│   ├── workflow/                  — Workflow artifacts and templates
│   │   ├── templates/             — Reusable templates (do not edit)
│   │   ├── briefs/                — Feature briefs (FB-NNN-*.md)
│   │   ├── specs/                 — Specifications (SP-NNN-*.md)
│   │   ├── decisions/             — Decision notes (DN-NNN-*.md)
│   │   ├── tasks/                 — Task packs (TP-NNN-*.md)
│   │   └── qa/                    — QA reports (QA-NNN-*.md)
│   ├── human-tasks/               — Tasks requiring human action
│   │   ├── human-task-template.md
│   │   ├── pending/
│   │   └── completed/
│   ├── guide/                     — Toolkit documentation
│   │   ├── SYSTEM_OVERVIEW.md
│   │   ├── QUICKSTART.md
│   │   ├── WORKFLOW_EXPLAINED.md
│   │   ├── CONTEXT_SYSTEM.md
│   │   ├── HUMAN_TASKS.md
│   │   ├── FAQ.md
│   │   ├── GLOSSARY.md
│   │   └── DOCUMENTATION_STANDARDS.md
│   ├── health/                    — Context health reports
│   │   └── context-health-report.md
│   ├── index/                     — Context index and repo map
│   │   ├── context-index.md
│   │   └── repo-map.md (this file)
│   └── rules/                     — Agent behavior rules
│       └── agent-behavior.md
├── projects/                      — Project repos (gitignored)
│   └── <project-name>/           — Your project (independent git repo)
├── .cursor/rules/                 — Cursor rules (auto-loaded by agents)
│   ├── agentic-toolkit.mdc       — Core rules (always-on)
│   ├── project-setup.mdc         — Setup wizard
│   ├── workflow-feature.mdc      — Feature workflow
│   ├── human-tasks.mdc           — Human task creation
│   └── qa-checks.mdc             — QA procedure
└── README.md
```

## Key Modules

| Module | Location | Purpose |
|--------|----------|---------|
| Toolkit Core | `agentic/` | Workflow layer, context, rules, docs |
| Project Code | `projects/<project-name>/` | The actual project being built |
| Agent Rules (auto-loaded) | `.cursor/rules/` | Cursor rules that fire on every agent session |

## Entry Points

| Entry Point | Location | Purpose |
|-------------|----------|---------|
| Quickstart | `agentic/guide/QUICKSTART.md` | Getting started |
| Agent Rules | `agentic/rules/agent-behavior.md` | Full rules reference |
| Context Index | `agentic/index/context-index.md` | Available project context |
| Cursor Rules | `.cursor/rules/agentic-toolkit.mdc` | Auto-loaded by agents |

## Project Repos

| Project | Location | Description |
|---------|----------|-------------|
| (none yet) | `projects/` | Add your project repo here |

> Update this table when projects are added.

## Integration Points

| System | Purpose | Location / Config |
|--------|---------|-------------------|
|        |         |                   |

> Add external integrations as they are set up.

## Architecture Summary

This workspace uses a **wrapper pattern**: the Agentic Toolkit sits at the workspace root and provides structure, context, and rules. Project repositories live inside `projects/` as fully independent git repos. The toolkit never modifies project files directly — agents do, guided by the toolkit's rules and context.

---

*Last updated: 2026-04-04*
*Update this file when the workspace structure, project repos, or integration points change.*
