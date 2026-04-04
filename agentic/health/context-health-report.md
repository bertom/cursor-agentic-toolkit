# Context Health Report

> Assesses the completeness, freshness, and consistency of project context. Run this check periodically to keep the project healthy.

## Report Metadata

| Field | Value |
|-------|-------|
| Date  |       |
| Checked By |  |
| Project Mode | new / active / mature / legacy |
| Overall Health | healthy / needs-attention / unhealthy |

## Context Completeness

Does each context source have meaningful, project-specific content?

| Context File | Status | Notes |
|-------------|--------|-------|
| business-context.md | empty / partial / current | |
| client-input.md | empty / partial / current | |
| technical-context.md | empty / partial / current | |
| constraints.md | empty / partial / current | |
| package-policy.md | empty / partial / current | |
| governance.md | empty / partial / current | |

### Missing Context

Critical information that is not yet documented anywhere.

- [ ] 

## Context Freshness

Is existing context still accurate?

| Context File | Last Updated | Stale? | Notes |
|-------------|-------------|--------|-------|
| business-context.md | | | |
| client-input.md | | | |
| technical-context.md | | | |
| constraints.md | | | |
| package-policy.md | | | |
| governance.md | | | |

### Outdated Items

Specific items known to be out of date.

- [ ] 

## Context Consistency

Do context sources agree with each other and with the actual codebase?

### Conflicts Found

| Source A | Source B | Conflict Description | Resolution |
|----------|----------|---------------------|------------|
|          |          |                     |            |

### Code-Documentation Drift

Areas where the codebase has diverged from what documentation describes.

| Area | Documentation Says | Code Does | Severity |
|------|-------------------|-----------|----------|
|      |                   |           |          |

## External Source Validation

Validate context that comes from outside local `.agentic/context/`.

| Source | Last Validated | Owner | Reachable | Still Authoritative | Notes |
|--------|----------------|-------|-----------|---------------------|-------|
|        |                |       | yes / no  | yes / no            |       |

### Runtime vs External Consistency

Check whether runtime summaries in `.agentic` still match external details in `project-ops`.

| Area | Runtime (`.agentic`) | External (`project-ops`) | Consistent | Notes |
|------|----------------------|--------------------------|------------|-------|
|      |                      |                          | yes / no   |       |

### External Drift Risks

- [ ] External source moved or unavailable
- [ ] External source outdated
- [ ] External source conflicts with local context

## Architecture Clarity

| Question | Answer |
|----------|--------|
| Is the architecture documented? | yes / no / partially |
| Are key decisions recorded? | yes / no / partially |
| Is the tech stack documented? | yes / no / partially |
| Is the repo map current? | yes / no / partially |
| Are integration points documented? | yes / no / not applicable |
| Is governance policy reviewed? | yes / no / partially |

## Documentation Health

| Document | Status | Notes |
|----------|--------|-------|
| SYSTEM_OVERVIEW.md | current / stale | |
| QUICKSTART.md | current / stale | |
| WORKFLOW_EXPLAINED.md | current / stale | |
| CONTEXT_SYSTEM.md | current / stale | |
| HUMAN_TASKS.md | current / stale | |
| FAQ.md | current / stale | |
| GLOSSARY.md | current / stale | |
| DOCUMENTATION_STANDARDS.md | current / stale | |

## Human Tasks

| Metric | Count |
|--------|-------|
| Pending human tasks | |
| Blocking tasks | |
| Oldest pending task | |

## Recommendations

Actions to improve context health, ordered by priority.

| Priority | Action | Effort |
|----------|--------|--------|
| high | | |
| medium | | |
| low | | |

## Health Score Summary

| Category | Score (1-5) | Notes |
|----------|-------------|-------|
| Completeness | | 1=mostly empty, 5=fully documented |
| Freshness | | 1=mostly stale, 5=all current |
| Consistency | | 1=many conflicts, 5=fully consistent |
| Architecture Clarity | | 1=undocumented, 5=fully clear |
| Documentation Quality | | 1=missing/stale, 5=complete and current |
| **Overall** | | Average of above |

---

## How to Use This Report

1. **Fill in** each section based on current project state
2. **Identify** the highest-priority gaps
3. **Create tasks** (or human tasks) to address critical items
4. **Re-run** after addressing items to track improvement

### When to Run

| Project Mode | Frequency |
|-------------|-----------|
| New | After each major milestone |
| Active | Weekly or after major changes |
| Mature | Bi-weekly |
| Legacy | Before any significant change |

---

*This report template is maintained by the Agentic Toolkit. The report itself should be regenerated each time a health check is performed.*
