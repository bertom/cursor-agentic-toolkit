# System Overview

**Toolkit Version: 0.2.0**

## What Is This?

The **Agentic Toolkit** is a reusable workflow layer for Cursor-assisted development. It structures work from intent to implementation with explicit documentation and QA gates.

This is **not** an autonomous system. Human approval remains mandatory.

## 3-Layer Model

The toolkit separates concerns into three layers:

1. **Toolkit Source**  
   Reusable source of templates, rules, and guides (this repository).
2. **Project Runtime**  
   The actual independent project repository being changed (e.g., `my-project/`).
3. **Project Operational Memory**  
   Per-project external context + workflow artifacts (commonly exposed in runtime as `project-ops/` via symlink).

See [ARCHITECTURE_LAYERS.md](ARCHITECTURE_LAYERS.md) for details.

## Why It Exists

Without structure, agents can:

- lose context
- skip decision rationale
- skip validation
- create hard-to-trace changes

The toolkit adds a minimal structure to prevent that.

## Workflow Chain

```
Intent → Feature Brief → Spec → Decision Note (optional)
      → Task Pack → Implementation → QA Report → Documentation Update
```

Each step has a template. Artifacts cross-reference each other for traceability.

## Context-First Execution

Before implementation in a project runtime, agents read:

- `.agentic/index/context-index.md`
- relevant files in `.agentic/context/`
- `.agentic/context/package-policy.md`
- `.agentic/context/governance.md`

In the layered model, `.agentic/` holds **context summaries, rules, and (often) workflow artifacts** in the project repo. Teams may **commit** the whole tree for shared traceability ([Team Kit](../team/TEAM_KIT_V1_REQUIREMENTS.md)). Long-form or personal notes may still live under external `project-ops/`; if both exist, **committed `.agentic/` wins** when they disagree.

## Core Principles

| Principle | Meaning |
|-----------|---------|
| Human-controlled | Agents assist but do not take over |
| Context-first | Read curated context before implementation |
| Explicit decisions | Important choices are documented |
| QA is mandatory | Work is not done without validation |
| Small scope | Avoid large uncontrolled changes |
| Explainability | The system explains what it does and why |
| Reusable | Works across projects |

## Related Docs

| Document | Purpose |
|----------|---------|
| [ARCHITECTURE_LAYERS.md](ARCHITECTURE_LAYERS.md) | Layer model and file placement |
| [EXTERNAL_SETUP.md](EXTERNAL_SETUP.md) | Install runtime in independent project repo |
| [BOOTSTRAP.md](BOOTSTRAP.md) | Runtime bootstrap procedure |
| [RUNTIME_PROFILES.md](RUNTIME_PROFILES.md) | Minimal vs full runtime setup |
| [UPGRADE_RUNTIME.md](UPGRADE_RUNTIME.md) | Runtime upgrade flow |
| [QUICKSTART.md](QUICKSTART.md) | Setup and first use |
| [CONTEXT_SYSTEM.md](CONTEXT_SYSTEM.md) | Context model and external sources |
| [WORKFLOW_EXPLAINED.md](WORKFLOW_EXPLAINED.md) | Workflow chain details |
| [HUMAN_TASKS.md](HUMAN_TASKS.md) | Human handoff model |
| [DOCUMENTATION_STANDARDS.md](DOCUMENTATION_STANDARDS.md) | Versioning and traceability rules |
| [CURSOR_RULES_RUNTIME.md](CURSOR_RULES_RUNTIME.md) | Cursor rules path and installer copy behavior |
| [WORKFLOW_VALIDATION.md](../workflow/WORKFLOW_VALIDATION.md) | Per-stage validation (agents + humans) |
| [ONBOARDING.md](../team/ONBOARDING.md) | New developer / team path |
| [TEAM_KIT_V1_REQUIREMENTS.md](../team/TEAM_KIT_V1_REQUIREMENTS.md) | Team mode: shared `.agentic/`, PR prompt, gitignore defaults |
| [AI_INSTRUCTIONS_SYNC.md](../team/AI_INSTRUCTIONS_SYNC.md) | Cursor rules vs `.github/copilot-instructions.md` |

---

*This document is maintained by the Agentic Toolkit.*
