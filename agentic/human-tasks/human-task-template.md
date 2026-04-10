# [Task Title]

> Human task — requires manual action that an agent cannot perform.

## Assignment & traceability

| Field | Value |
|-------|-------|
| **Assigned to** | _Full name or handle of the human responsible for completing this task_ |
| **Created (date)** | _YYYY-MM-DD — when this file was created_ |
| **Created by** | _Who created the task (e.g. agent session, teammate name)_ |

_Fill **Assigned to** and **Created (date)** when the file is created. If the assignee is unknown, set `TBD` and note who must nominate an owner in **Blocking** or **What**._

## What

Brief description of what needs to be done.

## Why

Why this task requires human action and cannot be automated by an agent.

## Steps

1. 
2. 
3. 

## Expected Return Information

What information or confirmation should be provided back after completion.

- 

## Return Location

Where should the human place return evidence/results?

- File path in completed lane: `.agentic/human-tasks/completed/<task-file>.md`
- Optional external locations:
  - `project-ops/client-input/...`
  - `project-ops/specs/...`
  - `project-ops/qa/...`
- Optional evidence links (screenshots/docs/IDs): 

## Validation Criteria

How to verify the task was completed correctly.

- [ ] 

## Blocking

Which implementation tasks are blocked until this is complete.

| Blocked Task | Task Pack | Notes |
|-------------|-----------|-------|
|             |           |       |

## Metadata (completion)

| Field | Value |
|-------|-------|
| Priority | high / medium / low |
| Estimated time | |
| Completed (date) | YYYY-MM-DD when moved to `completed/` |
| Completed by | Name of human who performed the steps |

---

*When complete, move this file from `pending/` to `completed/` and fill **Metadata (completion)**. **Assignment & traceability** is left unchanged for audit trail.*
