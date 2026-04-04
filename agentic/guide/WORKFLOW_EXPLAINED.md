# Workflow Explained

## What Is the Workflow?

The Agentic Toolkit uses a structured chain to move work from initial intent to validated delivery. Each step produces an artifact that feeds into the next.

## The Chain

```
Intent
  → Feature Brief        captures what and why
  → Spec                 captures how
  → Decision Note        captures why this way (optional)
  → Task Pack            captures what to do, step by step
  → Implementation       the actual code changes
  → QA Report            captures validation results
  → Documentation Update keeps context current
```

## Why a Chain?

Without structure, agents tend to jump straight from a vague request to code. This leads to:

- Misunderstood requirements
- Undocumented decisions
- Untested changes
- Lost context

The chain ensures each concern is addressed before moving forward.

## Step-by-Step

### 1. Feature Brief

**Template:** `workflow/templates/feature-brief-template.md`

Captures the problem, desired outcome, scope, and success criteria. This is the starting point for any new piece of work.

**When to create:** At the start of any feature, enhancement, or significant change.

**Who creates it:** Human or agent (with human approval).

### 2. Spec

**Template:** `workflow/templates/spec-template.md`

Translates the feature brief into a concrete technical design. Describes the approach, components affected, data changes, API changes, and dependencies.

**When to create:** After a feature brief is approved.

**Who creates it:** Agent drafts, human reviews and approves.

**Rules:**
- Must reference the feature brief
- New dependencies must pass the package policy check
- Must include acceptance criteria

### 3. Decision Note (Optional)

**Template:** `workflow/templates/decision-note-template.md`

Records important technical or architectural decisions. Documents options considered, the choice made, and consequences.

**When to create:**
- Before large refactors
- Before architecture changes
- Before introducing or replacing dependencies
- When multiple valid approaches exist
- When a choice has significant consequences

**Who creates it:** Agent drafts, human decides.

### 4. Task Pack

**Template:** `workflow/templates/task-pack-template.md`

Breaks the spec into small, implementable tasks. Each task should be completable in a single focused session.

**When to create:** After a spec is approved.

**Who creates it:** Agent creates, human reviews.

**Rules:**
- Each task must have QA requirements
- Each task must list files affected
- Blocked tasks must reference what blocks them
- Human tasks must be identified and filed separately

### 5. Implementation

The actual coding work. Agents implement tasks from the task pack one at a time.

**Rules:**
- Context must be read before starting
- Changes must be small and focused
- Package policy must be followed
- Decision notes must be created before large changes
- Human tasks must be created when blocked
- Git policy in `governance.md` must be followed when committing
- No secrets, credentials, or PII in code or commits

### 6. QA Report

**Template:** `workflow/templates/qa-report-template.md`

Documents the results of all quality checks. Work is not considered complete until the QA report passes.

**When to create:** After all tasks in a task pack are implemented.

**Who creates it:** Agent runs checks, documents results.

**Required checks** (vary by project):
- Lint check
- Type check
- Build validation
- Unit tests
- Integration tests
- Accessibility checks (if applicable)
- Smoke tests
- Regression awareness

### 7. Documentation Update

After completing a task pack, update:

- `index/context-index.md` — if new context was created
- `index/repo-map.md` — if repository structure changed
- `context/` files — if constraints or decisions changed
- `guide/` docs — if the workflow or system evolved

## Where Artifacts Live

Templates and artifacts are separated to keep things clean:

```
agentic/workflow/
├── templates/     reusable templates (do not edit directly)
├── briefs/        feature briefs (FB-NNN-*.md)
├── specs/         specifications (SP-NNN-*.md)
├── decisions/     decision notes (DN-NNN-*.md)
├── tasks/         task packs (TP-NNN-*.md)
└── qa/            QA reports (QA-NNN-*.md)
```

Agents read from `templates/` and create artifacts in the appropriate subfolder.

## Artifact Traceability

Every artifact references its parent and children:

```
Feature Brief FB-001
  └── Spec SP-001
        ├── Decision Note DN-001
        └── Task Pack TP-001
              └── QA Report QA-001
```

This makes it possible to trace any piece of work back to its original intent.

## Skipping Steps

For trivial changes (typo fixes, minor style updates), the full chain is unnecessary. Use judgment:

| Change Size | Minimum Artifacts |
|-------------|-------------------|
| Trivial (typo, formatting) | None required |
| Small (bug fix, minor feature) | Task pack + QA report |
| Medium (feature, refactor) | Feature brief + spec + task pack + QA report |
| Large (architecture change) | Full chain including decision note |

## Project Mode Influence

| Mode | Strictness |
|------|-----------|
| New | Flexible — focus on getting things built, lighter documentation |
| Active | Standard — full workflow for medium+ changes |
| Mature | Strict — all changes documented, regression awareness required |
| Legacy | Careful — decision notes required for any structural change |

---

*This document is maintained by the Agentic Toolkit. Update it when the workflow chain changes.*
