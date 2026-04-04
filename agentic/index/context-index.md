# Context Index

> Catalog of all context sources in the Agentic Toolkit. Agents should read this first to understand what project context is available.

## Context Files

| File | Purpose | Status | Last Updated |
|------|---------|--------|-------------|
| [business-context.md](../context/business-context.md) | Business goals, users, market constraints | empty | — |
| [client-input.md](../context/client-input.md) | Client specs, feedback, preferences | empty | — |
| [technical-context.md](../context/technical-context.md) | Architecture, stack, project mode, active project | empty | — |
| [constraints.md](../context/constraints.md) | Hard limits, regulations, performance targets | empty | — |
| [package-policy.md](../context/package-policy.md) | Dependency rules and preferences | template | — |
| [governance.md](../context/governance.md) | Git policy, security, agent permissions, approval gates | current | 2026-04-04 |

### Status Key

| Status | Meaning |
|--------|---------|
| `empty` | File exists but has no project-specific content |
| `template` | File has structure but needs project data |
| `partial` | Some sections filled in, others missing |
| `current` | Up to date and reflects the actual project state |
| `stale` | Content exists but may be outdated |

## Index Files

| File | Purpose | Status | Last Updated |
|------|---------|--------|-------------|
| [context-index.md](context-index.md) (this file) | Catalog of all context sources | current | Bootstrap |
| [repo-map.md](repo-map.md) | Repository structure overview | current | Bootstrap |

## Workflow Templates

Templates live in `agentic/workflow/templates/`. Artifacts go into their respective subfolders.

| Template | Artifacts Folder | Purpose |
|----------|-----------------|---------|
| [feature-brief-template.md](../workflow/templates/feature-brief-template.md) | `workflow/briefs/` | Captures intent and scope |
| [spec-template.md](../workflow/templates/spec-template.md) | `workflow/specs/` | Technical design |
| [decision-note-template.md](../workflow/templates/decision-note-template.md) | `workflow/decisions/` | Records important decisions |
| [task-pack-template.md](../workflow/templates/task-pack-template.md) | `workflow/tasks/` | Implementation task breakdown |
| [qa-report-template.md](../workflow/templates/qa-report-template.md) | `workflow/qa/` | Quality validation results |

## Known Gaps

List context that is known to be missing or needed.

- [ ] Business context not yet populated
- [ ] Client input not yet populated
- [ ] Technical context not yet populated (stack, architecture, project mode)
- [ ] Constraints not yet populated
- [ ] Package policy not yet customized for this project
- [x] Governance policy created with defaults

## Refresh Schedule

| Action | Frequency |
|--------|-----------|
| Review context index | After each completed task pack |
| Check for stale context | Weekly or after major changes |
| Full context health check | Monthly or at project milestones |

---

*This index is maintained by the Agentic Toolkit. Update it when context sources are added, removed, or significantly changed.*
