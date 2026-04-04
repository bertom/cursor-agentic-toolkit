# Architecture Layers

## What Is This?

This guide defines the required 3-layer architecture and where each file type should live.

## Why Does It Exist?

Without explicit boundaries, toolkit source gets polluted with project runtime data, and project repos become cluttered with operational materials.

## The 3 Layers

### 1) Toolkit Source

Lives in this repository.

Contains:

- reusable templates (`agentic/workflow/templates/`)
- reusable guides (`agentic/guide/`)
- reusable rules (`.cursor/rules/`, `agentic/rules/`)
- bootstrap/upgrade guidance

Does **not** contain:

- real project repos
- project-specific specs/tasks/QA
- project business context

### 2) Project Runtime

Lives in an independent project repository (outside toolkit source).

This is where Cursor is opened for day-to-day coding.

Contains:

- application code (`src/`, services, configs)
- local runtime layer (commonly `.agentic/`)
- optional ops-memory link/folder (commonly `project-ops/`) to external operational memory

### 3) Project Operational Memory

Lives outside project repo, typically in an external folder.

Contains project-specific operational materials:

- briefs/specs/decisions/task packs/QA reports
- client input, business docs, research
- release notes and working notes

It may be linked into runtime via:

`my-project/project-ops -> /external/path/to/project-ops`

## Relationship Between Layers

- Toolkit source defines the system.
- Project runtime runs the system.
- Project operational memory stores the evolving project intelligence.

## Recommended Runtime Shape

```
my-project/
  .agentic/
  project-ops/   -> symlink to external project memory
  src/
  package.json
```

`.agentic` and `project-ops` are defaults, not required names.

## When Do I Use This?

- Use toolkit source when improving the reusable system.
- Use project runtime when building product code.
- Use operational memory when tracking project-specific work chain and context.

## Benefits

- portability across projects
- cleaner project repositories
- cleaner toolkit source repository
- explicit source-of-truth boundaries
- easier upgrades and governance

---

*Update this document whenever layer responsibilities change.*
