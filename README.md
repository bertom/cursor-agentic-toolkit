# Cursor Agentic Toolkit

A self-documenting workflow layer for AI-assisted software development.

## What Is This?

A lightweight, production-grade system that structures how Cursor agents help you build software. It moves work from intent to validated delivery through a clear chain, while keeping you in full control.

**This is not an autonomous swarm.** Human oversight is always required.

## Quick Start

See [`agentic/guide/QUICKSTART.md`](agentic/guide/QUICKSTART.md).

## How It Works

```
Intent → Feature Brief → Spec → Decision Note (optional)
      → Task Pack → Implementation → QA Report → Documentation Update
```

Each step has a template. Agents follow rules. Context is curated. Decisions are documented. QA is mandatory.

## Structure

```
cursor-agentic-toolkit/
├── agentic/               Toolkit core
│   ├── context/           Project context (business, technical, governance)
│   ├── workflow/          Templates and artifacts (briefs, specs, tasks, QA)
│   ├── human-tasks/       Tasks requiring human action
│   ├── guide/             Toolkit documentation
│   ├── health/            Context health reports
│   ├── index/             Context index and repo map
│   └── rules/             Agent behavior rules
├── projects/              Your project repo (gitignored, independent)
│   └── my-project/        ← clone or create your project here
├── .cursor/rules/         Cursor rules (auto-loaded by agents)
└── README.md
```

## Key Concept: Toolkit Wraps Projects

The toolkit is a **wrapper**, not something that lives inside your project. Your project repository goes inside `projects/` and stays completely independent — it keeps its own `.git`, its own structure, its own everything. The toolkit never touches your project files.

This means:
- **Existing repos** — clone them into `projects/` and start using the toolkit immediately
- **New repos** — create them in `projects/` from scratch
- **Clean separation** — the `projects/` folder is gitignored, so your project repo is never committed to the toolkit

## Working with Agents

Agents automatically pick up the toolkit through Cursor rules in `.cursor/rules/`. You just describe your intent in chat — the agent reads context, follows the workflow, and keeps you in control at every gate.

No manual prompting required. No templates to copy by hand.

## Core Principles

| Principle | Meaning |
|-----------|---------|
| Human-controlled | Agents assist, humans decide |
| Context-first | Read context before coding |
| Explicit decisions | Document important choices |
| QA is mandatory | Validate before declaring done |
| Small scope | Avoid large uncontrolled changes |
| Explainability | The system explains itself |
| Reusable | Works with any repository |

## Documentation

| Document | Purpose |
|----------|---------|
| [System Overview](agentic/guide/SYSTEM_OVERVIEW.md) | What the toolkit is and why |
| [Quickstart](agentic/guide/QUICKSTART.md) | Get started in 5 minutes |
| [Workflow Explained](agentic/guide/WORKFLOW_EXPLAINED.md) | The workflow chain in detail |
| [Context System](agentic/guide/CONTEXT_SYSTEM.md) | How context works |
| [Human Tasks](agentic/guide/HUMAN_TASKS.md) | Human handoff workflow |
| [FAQ](agentic/guide/FAQ.md) | Common questions |
| [Glossary](agentic/guide/GLOSSARY.md) | Terminology |
| [Documentation Standards](agentic/guide/DOCUMENTATION_STANDARDS.md) | Versioning, traceability, writing rules |

## License

This toolkit is provided as-is for use in your projects.
