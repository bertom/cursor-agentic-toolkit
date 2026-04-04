# Human Tasks

## What Are Human Tasks?

Human tasks are actions that cannot be performed by an AI agent and require a human to complete. They are stored as structured documents in `.agentic/human-tasks/`.

## Why Do They Exist?

Agents can write code, but they cannot:

- Log into third-party dashboards
- Configure billing or payment providers
- Set up DNS records
- Generate API keys
- Approve legal documents
- Configure OAuth providers
- Provision cloud infrastructure through UIs
- Make purchasing decisions

When an agent encounters a task it cannot perform, it creates a human task instead of getting stuck or guessing.

## Where Are They Stored?

```
.agentic/human-tasks/
  pending/       — tasks waiting for human action
  completed/     — tasks that have been done
```

## Human Task Format

Each human task is a markdown file in `pending/` with a descriptive filename (e.g., `setup-stripe-webhook.md`).

### Required Sections

```markdown
# [Task Title]

## What

Brief description of what needs to be done.

## Why

Why this task requires human action (not automatable by an agent).

## Steps

Step-by-step instructions:

1. 
2. 
3. 

## Expected Return Information

What information or confirmation should be provided back after completion:

- 

## Validation Criteria

How to verify the task was completed correctly:

- [ ] 

## Return Location

Where the human should place returned evidence/results:

- `.agentic/human-tasks/completed/<task-file>.md`
- or project operational memory locations such as:
  - `project-ops/client-input/...`
  - `project-ops/specs/...`
  - `project-ops/qa/...`
- Attach links, IDs, screenshots, or config values in the completed task file

## Blocking

Which implementation tasks are blocked until this is complete:

| Blocked Task | Task Pack |
|-------------|-----------|
|             |           |

## Metadata

| Field          | Value |
|----------------|-------|
| Created        |       |
| Priority       | high / medium / low |
| Estimated Time |       |
| Created By     |       |
| Completed      |       |
| Completed By   |       |
```

> When complete, move the file from `pending/` to `completed/` and fill in the Completed fields.

## Workflow

### Creating a Human Task

1. Agent identifies a task it cannot perform
2. Agent creates a file in `.agentic/human-tasks/pending/` using the format above
3. Agent notes the human task in the relevant task pack
4. Agent continues with non-blocked work

### Completing a Human Task

1. Human reads the task document
2. Human follows the steps
3. Human provides the expected return information (adds it to the document)
4. Human records return evidence in the return location
5. Human checks the validation criteria
6. Human moves the file from `pending/` to `completed/`
7. Agent can now unblock dependent tasks

### Reviewing Human Tasks

Periodically check `.agentic/human-tasks/pending/` for outstanding tasks. They may be blocking implementation work.

## Examples of Common Human Tasks

| Task | Reason |
|------|--------|
| Supabase project setup | Requires dashboard login and configuration |
| Stripe webhook configuration | Requires Stripe dashboard access |
| DNS record creation | Requires domain registrar access |
| API key generation | Requires service account access |
| OAuth provider setup | Requires provider dashboard configuration |
| App store submission | Requires developer account access |
| SSL certificate installation | Requires server access |
| Environment variable setup on hosting | Requires hosting dashboard access |

---

*This document is maintained by the Agentic Toolkit. Update it when the human task workflow changes.*
