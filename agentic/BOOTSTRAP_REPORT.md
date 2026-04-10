# Bootstrap Report

> Toolkit-source bootstrap reference.  
> Runtime bootstrap should be performed in an independent project repo using [EXTERNAL_SETUP.md](guide/EXTERNAL_SETUP.md).

## Purpose

This file records what reusable assets exist in toolkit source for bootstrap/install.

## Toolkit Source Assets

- `agentic/context/*` runtime context templates
- `agentic/workflow/templates/*` workflow templates
- `agentic/workflow/WORKFLOW_VALIDATION.md` per-stage validation matrix
- `agentic/guide/*` user guides
- `agentic/rules/*` behavior rules
- `agentic/team/*` Team Kit (onboarding, PR prompt, requirements, `CONTEXT_SYNC`, `copilot-instructions.project.md`, `AI_INSTRUCTIONS_SYNC.md`)
- `agentic/README.md` runtime readme (toolkit alignment table)
- `agentic/index/context-changelog.md` optional context history template
- `.cursor/rules/*` Cursor rule templates

## Runtime Bootstrap Target

Bootstrap target is **project runtime repo**, not toolkit source.

Expected runtime outputs:

- `.agentic/` runtime layer
- runtime context source registry
- optional `project-ops/` symlink to external memory

Folder names are configurable; `.agentic` and `project-ops` are recommended defaults.

## Authoritative Setup Guide

Use:

- `agentic/guide/EXTERNAL_SETUP.md`
- `agentic/guide/QUICKSTART.md`
- `agentic/guide/BOOTSTRAP.md`
- `scripts/install-runtime.sh`

---

*Update this file when bootstrap assets or bootstrap flow change.*
