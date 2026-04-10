# FAQ

## General

### What is the Agentic Toolkit?

A lightweight workflow layer that structures how AI agents assist with software development. It provides templates, context management, QA gates, and documentation — all in plain markdown files.

### Do I need to use every part of the toolkit?

No. Use what helps. For a quick bug fix, you might only need a task pack and QA report. For a major feature, use the full workflow chain. See [WORKFLOW_EXPLAINED.md](WORKFLOW_EXPLAINED.md) for guidance on when to skip steps.

### Does this work with any project?

Yes. The toolkit is framework-agnostic and works with new, active, mature, and legacy projects. It uses only markdown files — no external dependencies.

### Does this replace my existing project management tools?

No. It complements them. The toolkit focuses on the agent-assisted development workflow. It does not replace issue trackers, CI/CD pipelines, or project boards.

### Why does the toolkit use a layered model?

To separate reusable toolkit source from project code and project memory:

- runtime repo stays clean
- operational docs remain project-specific
- toolkit remains reusable across many projects

### What is `project-ops`?

`project-ops` is the external operational memory layer for one project. It stores detailed project-specific materials (specs, tasks, QA, client input, research, release notes). Runtime can link it as a symlink.

## Structure

### Where does my project code go?

In your independent project repository (for example `my-project/`).

### Where do context and work items go?

Use split ownership:

- runtime summaries in `.agentic/`
- detailed operational artifacts in external `project-ops/...`

### Do I need to open my project folder or the toolkit folder in Cursor?

Open the **project runtime folder** in Cursor for daily work.

Open toolkit source only when improving toolkit templates/rules/docs.

## Workflow

### Do I need to manually copy templates?

No. Just describe your intent in chat. The agent reads the templates and creates the artifacts for you. You review and approve.

### What if I want to skip the feature brief and go straight to coding?

For trivial changes, that's fine. For anything medium or larger, starting with a feature brief prevents misunderstandings and rework. The five minutes spent upfront saves hours of misdirected agent work.

### Do I need a decision note for every choice?

No. Decision notes are for significant choices: architecture shifts, dependency additions or replacements, large refactors. If the decision is obvious and low-impact, skip it.

### What does "QA is mandatory" actually mean?

It means every task pack needs a **QA report** that documents what was tested and the results. Prefer **one QA file per batch**, opened early and **updated as you go** (incremental log when you run lint/tests/build or fix failures), then finalized when the pack is done—so work across sessions stays traceable. The specific checks depend on your project — a static site needs different QA than a financial API. See `.cursor/rules/qa-checks.mdc` in the project.

### Can I modify the templates?

Yes. The templates are starting points. Adapt them to your project's needs. Remove sections that don't apply, add sections that do.

## Agents

### How do agents know about the toolkit?

Cursor rules in **the project workspace root** `.cursor/rules/` are automatically loaded by every agent session. The installer copies those files from toolkit source into your repo; they are not read from `.agentic/` or from the toolkit repo unless that folder is what you opened. See [CURSOR_RULES_RUNTIME.md](CURSOR_RULES_RUNTIME.md).

### Will I work with one agent for a whole feature?

One agent per chat session, but not necessarily one agent for the whole feature. Work naturally segments into sessions (planning, implementation, QA). Context carries across sessions because it's stored in files — each new agent picks up where the last left off.

### What if the agent ignores the rules?

Re-prompt with explicit instructions. Reference specific rules. The Cursor rules should handle this automatically, but if an agent drifts, pointing it back to `.agentic/rules/agent-behavior.md` corrects it.

### Can agents update the toolkit itself?

Yes. Agents should update context, repo maps, and documentation as part of their normal workflow. They should not modify the core templates or rules without human approval.

## Git, Security, and Governance

### Will the agent push my code?

No, not by default. The governance policy (`.agentic/context/governance.md`) allows agents to commit with descriptive messages but never push. You can change this if you want.

### Can I stop agents from touching git entirely?

Yes. Set "Agent may commit" to `no` in `governance.md`. The agent will make code changes but leave all git operations to you.

### How are secrets protected?

Security rules in `governance.md` are mandatory and cannot be overridden. Agents must never commit, log, or display secrets, API keys, tokens, `.env` files, or PII. There's also a sensitive file pattern list that agents check before committing.

### What are approval gates?

Actions that always require your explicit "yes" before an agent proceeds — things like architecture changes, security-related code changes, database schema changes, and CI/CD modifications. The full list is in `governance.md`.

## Context

### What if I don't have business context or client input?

Leave those files empty or add a note saying "Not applicable." The context health system will list them as gaps, but that's informational — it won't break anything.

### How often should I update context?

After each completed task pack, review whether any context files need updating. Run a context health check periodically (weekly or after major changes).

### What if context files contradict each other?

The context health system flags conflicts. When found, create a decision note to resolve the contradiction, then update the affected context files.

## Human Tasks

### What if no one picks up a human task?

Human tasks in `pending/` will keep blocking dependent implementation tasks. Review them regularly. Prioritize tasks that are blocking active work.

### Can an agent complete a human task?

If the task no longer requires human action (e.g., an API was set up and the agent now has access), the agent can document the completion and move the file to `completed/`.

## Team / shared `.agentic/`

### We’re multiple developers — where do we start?

Read `.agentic/team/ONBOARDING.md`, then `.agentic/workflow/WORKFLOW_VALIDATION.md`. Policy and checklist: `.agentic/team/TEAM_KIT_V1_REQUIREMENTS.md`. Install with default `--gitignore-mode committed` so `.agentic/` is not ignored.

### I don’t use AI — how do I keep docs aligned?

Follow `.agentic/team/CONTEXT_SYNC.md` before meaningful PRs. If you use an AI tool only for wording, you can still `@`-mention `.agentic/team/prompts/pr-review-prompt.md` in chat; you commit every change.

## Maintenance

### How do I know if the toolkit is healthy?

Check `.agentic/health/context-health-report.md`. It shows what's missing, outdated, or conflicting. A healthy project has few open items.

### What triggers documentation updates?

Any change to the workflow chain, context system, or toolkit structure should trigger updates to the relevant guide documents. The context health check will flag stale documentation.

---

*This document is maintained by the Agentic Toolkit. Update it when new questions arise.*
