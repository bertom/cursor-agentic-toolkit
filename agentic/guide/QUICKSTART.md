# Quickstart

Get productive with the Agentic Toolkit in five minutes.

## Prerequisites

- Cursor IDE with agent mode enabled
- A project repository (new or existing)

## Step 1: Open the Toolkit in Cursor

Open the `cursor-agentic-toolkit/` folder as your workspace in Cursor. This is the root — not your project folder.

```
cursor-agentic-toolkit/          ← open THIS in Cursor
├── agentic/                     ← toolkit
├── projects/                    ← your project(s) go here
├── .cursor/rules/               ← auto-loaded by agents
└── README.md
```

## Step 2: Add Your Project

**Existing repo:**
```bash
cd projects
git clone <your-repo-url>
```

**New project:**
```bash
mkdir projects/my-project
cd projects/my-project
git init
```

The `projects/` folder is gitignored — your project stays fully independent.

## Step 3: Set Up Context

Tell the agent about your project. Start a new Cursor chat and say:

> "I'm setting up a new project in `projects/my-project`. Help me fill in the context files."

The agent will walk you through:

| File | What it captures |
|------|-----------------|
| `agentic/context/business-context.md` | Business goals, users, market constraints |
| `agentic/context/client-input.md` | Client specs, feedback, preferences |
| `agentic/context/technical-context.md` | Architecture, stack, project mode |
| `agentic/context/constraints.md` | Deadlines, budgets, regulations |
| `agentic/context/package-policy.md` | Dependency rules and preferences |
| `agentic/context/governance.md` | Git, security, and agent permission policies |

You don't need to fill in everything immediately. Start with what you know. The context health system will flag gaps over time.

## Step 4: Configure Project Mode

The agent will set the project mode in `agentic/context/technical-context.md`:

| Mode | Use when |
|------|----------|
| `new` | Starting from scratch |
| `active` | Regular development in progress |
| `mature` | Stable project, mostly maintenance |
| `legacy` | Old codebase, limited documentation |

Project mode affects how strictly the toolkit enforces documentation and QA.

## Step 5: Start Your First Feature

Describe your intent in a Cursor chat:

> "I want to build [describe what you want]. Start with a feature brief."

The agent will automatically:

1. Read the toolkit rules and project context
2. Create a feature brief
3. Ask for your approval
4. Progress through spec → task pack → implementation → QA

You review and approve at each gate.

## How Agents Pick Up the Toolkit

Cursor rules in `.cursor/rules/` are **automatically loaded** by every agent session. You never need to manually tell the agent to read the rules — it happens on every chat.

The rules instruct agents to:
- Read context before coding
- Follow the package policy
- Keep changes small
- Create human tasks when blocked
- Document decisions
- Produce QA reports

## Quick Reference

| I want to... | Just say... |
|---------------|------------|
| Start a new feature | "I want to build [X]. Start with a feature brief." |
| Make a technical decision | "We need to decide between [A] and [B]. Create a decision note." |
| Check project health | "Run a context health check." |
| Flag a task for a human | "I need to [X] but it requires dashboard access. Create a human task." |
| Set up context | "Help me fill in the context files for my project." |

---

*This document is maintained by the Agentic Toolkit. Update it when setup procedures change.*
