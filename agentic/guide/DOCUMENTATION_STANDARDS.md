# Documentation Standards

> Rules for how documentation and context files are created, versioned, and maintained across the toolkit.

## Toolkit Versioning

The toolkit itself carries a version number using [Semantic Versioning](https://semver.org/):

| Field | Value |
|-------|-------|
| Current Version | **0.1.0** |
| Version Location | `agentic/guide/SYSTEM_OVERVIEW.md` (header) |

| Change Type | Version Bump | Example |
|-------------|-------------|---------|
| Breaking structure changes (folder renames, removed capabilities) | Major | 0.x → 1.0 |
| New capabilities, templates, or rules | Minor | 0.1 → 0.2 |
| Fixes, clarifications, typo corrections | Patch | 0.1.0 → 0.1.1 |

When the toolkit structure or rules change, update the version in `SYSTEM_OVERVIEW.md`.

## Document Metadata

Every document that contains project-specific content (not templates) should include metadata at the bottom:

```markdown
---
*Last updated: YYYY-MM-DD*
*Updated by: [human / agent]*
*Version: [document version or toolkit version]*
```

### What counts as project-specific content

| File Type | Needs Metadata | Reason |
|-----------|---------------|--------|
| Context files (`context/*.md`) | Yes | Content changes with the project |
| Workflow artifacts (`workflow/briefs/*.md`, etc.) | Yes | Created per feature |
| Index files (`index/*.md`) | Yes | Updated as project evolves |
| Health reports (`health/*.md`) | Yes | Regenerated periodically |
| Guide files (`guide/*.md`) | Yes | Updated when toolkit evolves |
| Templates (`workflow/templates/*.md`) | No | Static unless toolkit version changes |
| Cursor rules (`.cursor/rules/*.mdc`) | No | Static unless toolkit version changes |

## Document Versioning

### Context files

Context files evolve over time. Track changes with the footer metadata:

```markdown
---
*Last updated: 2026-04-04*
*Updated by: agent*
```

When a context file is significantly rewritten (not just a field update), note it:

```markdown
---
*Last updated: 2026-04-15*
*Updated by: agent*
*Change: Rewrote architecture section after migration to microservices (DN-003)*
```

### Workflow artifacts

Each workflow artifact is versioned implicitly by its ID and status:

- `draft` — initial creation, may change
- `approved` — reviewed and locked
- `superseded` — replaced by a newer artifact (note which one)

Once an artifact is `approved`, it should not be modified. If the design changes, create a new artifact that supersedes it and link them.

### Health reports

Health reports are snapshots. Each time a health check runs, the report is regenerated. The metadata captures when:

```markdown
---
*Report date: 2026-04-04*
*Checked by: agent*
*Previous report: 2026-03-28*
```

## Traceability Requirements

### Artifact cross-references

Every artifact must reference its parent(s) and any related artifacts in its metadata table:

| Artifact Type | Must Reference |
|---------------|---------------|
| Feature Brief | — (root artifact) |
| Spec | Feature Brief |
| Decision Note | Spec (if applicable) |
| Task Pack | Spec, Feature Brief |
| QA Report | Task Pack, Spec, Feature Brief |

### Context change traceability

When a context file is updated because of a decision or implementation:

1. Note the change in the document's footer metadata
2. Reference the decision note or task pack that prompted the change
3. Update the context index status and date

Example footer:

```markdown
---
*Last updated: 2026-04-10*
*Updated by: agent*
*Change: Added Redis to preferred packages per DN-002*
```

### Decision traceability

Decision notes must be findable from the artifacts they affect:

- The spec should list related decision notes
- The task pack should list prerequisite decisions
- Context files updated by a decision should reference the decision note ID

## Writing Standards

### Tone and clarity

- Write for someone with no prior context about this project
- Use plain language — avoid jargon unless defined in the [Glossary](GLOSSARY.md)
- Each document should answer: **what** is this, **why** does it exist, **when** to use it, **how** to use it
- Prefer short paragraphs and bullet points over long prose

### Structure

- Start with a one-line description in a blockquote (`> ...`)
- Use metadata tables for structured information
- Use headings consistently (H2 for sections, H3 for subsections)
- End with a footer noting maintenance responsibility

### What NOT to document

- Implementation details that belong in code comments
- Temporary debugging notes
- Personal opinions without rationale
- Information already captured elsewhere (link instead of duplicating)

## Maintenance Triggers

| Event | Documentation Action |
|-------|---------------------|
| Toolkit structure changes | Update SYSTEM_OVERVIEW, repo map, version bump |
| New context file added | Update context index, CONTEXT_SYSTEM |
| Workflow chain changes | Update WORKFLOW_EXPLAINED, FAQ if needed |
| New rule added | Update agent-behavior, version bump |
| Feature completed | Update repo map if structure changed, context if decisions changed |
| Health check performed | Regenerate health report |
| Governance policy changed | Update governance.md footer, notify team |

---

*This document is maintained by the Agentic Toolkit. Update it when documentation practices change.*
*Toolkit version: 0.1.0*
