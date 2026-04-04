# Context System

## What Is It?

The context system is a curated collection of documents that give agents (and humans) the information needed to make good decisions. It lives in `agentic/context/` and is indexed in `agentic/index/`. Context is part of the toolkit — it stays separate from your project repo in `projects/`.

## Why Does It Exist?

Agents without context make uninformed decisions. They might:

- Choose the wrong library
- Contradict a business requirement
- Duplicate existing functionality
- Violate a constraint nobody told them about

The context system prevents this by making project knowledge explicit, discoverable, and maintainable.

## Context Sources

| File | Purpose |
|------|---------|
| `context/business-context.md` | Business goals, user needs, market constraints |
| `context/client-input.md` | Client specifications, feedback, preferences |
| `context/technical-context.md` | Architecture decisions, stack info, project mode, active project |
| `context/constraints.md` | Deadlines, budgets, regulations, hard limits |
| `context/package-policy.md` | Allowed/discouraged dependencies, rules for new packages |
| `context/governance.md` | Git policy, security rules, agent permissions, approval gates |

## Context Index

`index/context-index.md` is a catalog of all context sources. It lists:

- What each context file contains
- When it was last updated
- What is still missing or incomplete

Agents should read the context index first to understand what's available.

## Repo Map

`index/repo-map.md` provides an overview of the repository structure:

- Key directories and their purposes
- Important modules
- Integration points
- Entry points

This helps agents navigate unfamiliar codebases.

## How Context Is Used

### Before Implementation

Agents must:

1. Read `index/context-index.md` to see what context exists
2. Read relevant context files based on the task
3. Check `context/package-policy.md` before introducing dependencies
4. Note any missing context and flag it

### After Implementation

Agents should:

1. Update context files if new decisions were made
2. Update the context index if new context was added
3. Update the repo map if structure changed
4. Flag any newly discovered gaps

## Context Health

The context health system (`health/context-health-report.md`) periodically assesses:

- Missing documentation
- Outdated decisions
- Conflicting constraints
- Unclear architecture direction
- Drift between code and documentation

See `health/context-health-report.md` for the full assessment format.

## Keeping Context Fresh

Context becomes stale. To prevent this:

- **After each completed task pack**, review whether any context files need updating
- **Periodically**, run a context health check
- **When conflicts are found**, create a decision note to resolve them
- **When gaps are found**, create a human task or fill in the missing information

## Adding New Context Sources

If the standard context files don't cover something important:

1. Create a new `.md` file in `agentic/context/`
2. Add an entry to `index/context-index.md`
3. Update this document if the new source represents a new category

---

*This document is maintained by the Agentic Toolkit. Update it when the context system changes.*
