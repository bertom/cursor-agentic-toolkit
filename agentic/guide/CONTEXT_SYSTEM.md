# Context System

## What Is It?

The context system is a curated collection of documents that gives agents (and humans) reliable project understanding before code changes begin.

In the layered model, context is usually stored in **Project Operational Memory** (`project-ops/context/` or equivalent) and summarized in runtime `.agentic/context/` (or your custom runtime folder).

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
| `.agentic/context/business-context.md` | Runtime summary of business goals/needs |
| `.agentic/context/client-input.md` | Runtime summary of client requirements |
| `.agentic/context/technical-context.md` | Runtime summary of stack, architecture, mode |
| `.agentic/context/constraints.md` | Runtime summary of hard constraints |
| `.agentic/context/package-policy.md` | Runtime dependency policy |
| `.agentic/context/governance.md` | Runtime git/security/permissions policy |

### External Context Sources

Some context may come from outside `.agentic/context/`:

- architecture docs in external docs repos
- client requirement docs (shared drives, Notion exports, PDFs)
- compliance/legal references
- vendor/platform constraints

When external sources are used:

1. add them to the context index
2. summarize them in local context files
3. record last validation date and owner

## Source-of-Truth Separation

Runtime context files are summaries for fast agent execution.

**Team / committed mode:** workflow artifacts (briefs, specs, tasks, QA) often live under **`.agentic/workflow/...`** in git — same rules apply: keep them aligned with code.

**Layered / external mode:** detailed or sensitive artifacts may live in **`project-ops/...`**, with summaries in `.agentic/context/...`. If you use both, resolve conflicts toward **committed `.agentic/`** (see [Team Kit](../team/TEAM_KIT_V1_REQUIREMENTS.md) §2.4).

## Context Index

`.agentic/index/context-index.md` is a catalog of context sources. It lists:

- What each context file contains
- When it was last updated
- What is still missing or incomplete

Agents should read the context index first to understand what is local vs external.

## Repo Map

`.agentic/index/repo-map.md` provides an overview of runtime structure and linked external sources:

- Key directories and their purposes
- Important modules
- Integration points
- Entry points

This helps agents navigate unfamiliar codebases.

## How Context Is Used

### Before Implementation

Agents must:

1. Read `.agentic/index/context-index.md` to see what context exists
2. Read relevant context files based on the task
3. Check `.agentic/context/package-policy.md` before introducing dependencies
4. Note missing, conflicting, or stale context and flag it

### After Implementation

Agents should:

1. Update context files if new decisions were made
2. Update the context index if new context was added
3. Update the repo map if structure changed
4. Flag newly discovered gaps and external-source drift

## Context Health

The context health system (`.agentic/health/context-health-report.md`) periodically assesses:

- Missing documentation
- Outdated decisions
- Conflicting constraints
- Unclear architecture direction
- Drift between code and documentation
- External-source validity (reachable, current, still authoritative)

See `.agentic/health/context-health-report.md` for the full assessment format.

## Keeping Context Fresh

Context becomes stale. To prevent this:

- **After each completed task pack**, review whether any context files need updating
- **Periodically**, run a context health check
- **When conflicts are found**, create a decision note to resolve them
- **When gaps are found**, create a human task or fill in the missing information

## Adding New Context Sources

If the standard context files don't cover something important:

1. Add or create a local `.md` file in `.agentic/context/` when possible
2. Add source metadata to `.agentic/index/context-index.md`
3. If external-only, include source URL/path, owner, and last validated date
4. Update this guide if a new source category is introduced

---

*This document is maintained by the Agentic Toolkit. Update it when the context system changes.*
