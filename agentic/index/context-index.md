# Context Index

> Catalog of all context sources. Agents should read this first to understand local and external context.

**Team Kit:** this index is part of the shared runtime. For onboarding, validation, PR prep, and Cursor↔Copilot sync, use the **Workflow & onboarding** table below and [TEAM_KIT_V1_REQUIREMENTS.md](../team/TEAM_KIT_V1_REQUIREMENTS.md).

In layered mode, this file usually lives in project operational memory:
`.agentic/index/context-index.md` (with linked external source references, often via `project-ops/`)

## Context Files

| File | Purpose | Status | Last Updated |
|------|---------|--------|-------------|
| [business-context.md](../context/business-context.md) | Business goals, users, market constraints | empty | — |
| [client-input.md](../context/client-input.md) | Client specs, feedback, preferences | empty | — |
| [technical-context.md](../context/technical-context.md) | Architecture, stack, project mode, active project | empty | — |
| [constraints.md](../context/constraints.md) | Hard limits, regulations, performance targets | empty | — |
| [package-policy.md](../context/package-policy.md) | Dependency rules and preferences | template | — |
| [governance.md](../context/governance.md) | Git policy, security, agent permissions, approval gates | current | 2026-04-04 |
| [context-source-registry-template.md](../context/context-source-registry-template.md) | Template for tracking local/external context sources | template | — |

### Workflow & onboarding

| Document | Purpose |
|----------|---------|
| [WORKFLOW_VALIDATION.md](../workflow/WORKFLOW_VALIDATION.md) | **Validation matrix** — what to check at each stage; agent vs human; pass criteria |
| [ONBOARDING.md](../team/ONBOARDING.md) | **New developer path** — chain summary, validation in plain language |
| [CONTEXT_SYNC.md](../team/CONTEXT_SYNC.md) | **No-AI** context update procedure before PR |
| [pr-review-prompt.md](../team/prompts/pr-review-prompt.md) | **PR readiness prompt** — paste into chat or `@`-mention this file; doc gaps + proposed `.agentic/` edits |
| [AI_INSTRUCTIONS_SYNC.md](../team/AI_INSTRUCTIONS_SYNC.md) | **Cursor + Copilot** — how `.cursor/rules` and `.github/copilot-instructions.md` stay aligned |
| [copilot-instructions.project.md](../team/copilot-instructions.project.md) | **Source** for installed `.github/copilot-instructions.md` (Copilot) |

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
| [context-changelog.md](context-changelog.md) | Optional rolling log of material context changes (Team Kit §6.1) | template | Bootstrap |

## Workflow Templates

Templates live in `.agentic/workflow/templates/`. **Artifacts** (briefs, specs, tasks, QA) usually live in `.agentic/workflow/{briefs,specs,tasks,qa,...}/` when the team commits `.agentic/` ([Team Kit](../team/TEAM_KIT_V1_REQUIREMENTS.md)). Optionally mirror or archive under `project-ops/workflow/...` if you use external operational memory.

## External Context Sources

Record external sources used by the project (if any):

| Source | Type | Owner | Last Validated | Status |
|--------|------|-------|----------------|--------|
|        |      |       |                |        |

| Template | Artifacts Folder | Purpose |
|----------|-----------------|---------|
| [feature-brief-template.md](../workflow/templates/feature-brief-template.md) | `.agentic/workflow/briefs/` | Captures intent and scope |
| [spec-template.md](../workflow/templates/spec-template.md) | `.agentic/workflow/specs/` | Technical design |
| [decision-note-template.md](../workflow/templates/decision-note-template.md) | `.agentic/workflow/decisions/` | Records important decisions |
| [task-pack-template.md](../workflow/templates/task-pack-template.md) | `.agentic/workflow/tasks/` | Implementation task breakdown |
| [qa-report-template.md](../workflow/templates/qa-report-template.md) | `.agentic/workflow/qa/` | Quality validation results |

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
