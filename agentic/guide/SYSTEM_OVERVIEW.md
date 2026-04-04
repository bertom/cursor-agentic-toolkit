# System Overview

**Toolkit Version: 0.1.0**

## What Is This?

The **Agentic Toolkit** is a lightweight workflow layer that wraps around your project repository. It structures how AI agents (specifically Cursor agents) assist with software development — from capturing intent to delivering validated, documented work.

It is **not** an autonomous system. Every meaningful decision requires human approval. Agents assist, research, draft, and validate — but humans remain in control.

## Architecture: Toolkit Wraps Projects

The toolkit sits at the workspace root. Your project repositories live inside `projects/` as independent git repos:

```
cursor-agentic-toolkit/          ← workspace root (open this in Cursor)
├── agentic/                     ← toolkit files (context, templates, rules, docs)
├── projects/
│   └── my-project/              ← your actual repo (its own .git, fully independent)
├── .cursor/rules/               ← auto-loaded agent rules
└── README.md
```

The `projects/` directory is gitignored — your project repos are never committed to the toolkit. This means:

- Works with **existing repos** (just clone into `projects/`)
- Works with **new repos** (create in `projects/`)
- **Never pollutes** your project repo with toolkit files

## Why Does It Exist?

AI coding agents are powerful but prone to:

- **Context loss** — making changes without understanding the full picture
- **Scope creep** — attempting large, uncontrolled refactors
- **Silent decisions** — choosing libraries or patterns without documenting why
- **Skipping QA** — delivering code without validation
- **Orphaned knowledge** — work that isn't documented or traceable

This toolkit solves these problems by providing:

1. A **structured workflow** that moves work from intent to validated delivery
2. A **curated context system** that agents must read before coding
3. **Decision documentation** that captures the "why" behind choices
4. **Mandatory QA gates** that prevent incomplete work
5. A **human task lane** for work agents cannot perform
6. **Self-maintaining documentation** that stays current
7. **Cursor rules** that automatically instruct agents without manual prompting

## How Does It Work?

```
Intent → Feature Brief → Spec → Decision Note (optional)
      → Task Pack → Implementation → QA Report → Documentation Update
```

Each step has a template. Artifacts reference each other for traceability. Agents automatically follow rules loaded from `.cursor/rules/`.

Before any implementation, agents consult:

- **Context files** in `agentic/context/` for business, technical, and dependency constraints
- **Context index** in `agentic/index/` for a map of all available context
- **Package policy** in `agentic/context/package-policy.md` for dependency decisions
- **Governance** in `agentic/context/governance.md` for git, security, and permission policies

## Core Principles

| Principle | Meaning |
|-----------|---------|
| Human-controlled | Agents assist but do not take over |
| Context-first | Agents read curated context before implementation |
| Explicit decisions | Important choices are documented |
| QA is mandatory | Work is not done without validation |
| Small scope | Avoid large uncontrolled changes |
| Explainability | The system explains what it does and why |
| Maintainable | Simple beats clever |
| Reusable | Works across different repositories |

## Where to Go Next

| Document | Purpose |
|----------|---------|
| [QUICKSTART.md](QUICKSTART.md) | Get started in 5 minutes |
| [WORKFLOW_EXPLAINED.md](WORKFLOW_EXPLAINED.md) | Understand the workflow chain |
| [CONTEXT_SYSTEM.md](CONTEXT_SYSTEM.md) | Learn how context works |
| [HUMAN_TASKS.md](HUMAN_TASKS.md) | Understand human handoff |
| [FAQ.md](FAQ.md) | Common questions answered |
| [GLOSSARY.md](GLOSSARY.md) | Terminology definitions |
| [DOCUMENTATION_STANDARDS.md](DOCUMENTATION_STANDARDS.md) | Versioning, traceability, and writing standards |

---

*This document is maintained by the Agentic Toolkit. Update it when the system's purpose or structure changes.*
