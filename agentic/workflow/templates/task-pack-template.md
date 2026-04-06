# Task Pack

> Breaks a spec into small, implementable tasks with QA requirements. Each task should be completable in a single focused session.

## Metadata

| Field           | Value |
|-----------------|-------|
| Task Pack ID    | TP-XXX |
| Spec            | SP-XXX |
| Feature Brief   | FB-XXX |
| Author          |       |
| Date            |       |
| Status          | draft / in-progress / complete |
| Ops Memory Path | `project-ops/...` |

## Prerequisites

What must be true before work begins?

- [ ] Context reviewed (see [context-index.md](../../index/context-index.md))
- [ ] Package policy checked (see [package-policy.md](../../context/package-policy.md))
- [ ] Related decision notes reviewed

## Tasks

### Task 1: [Title]

| Field      | Value |
|------------|-------|
| Task ID    | TP-XXX-01 |
| Scope      | small / medium |
| Type       | create / modify / remove / configure |
| Status     | pending / in-progress / complete / blocked |

**Description:**  

**Files Affected:**
- 

**Acceptance Criteria:**
- [ ] 

**QA Requirements:**
- [ ] Lint check passes
- [ ] Type check passes
- [ ] Build succeeds
- [ ] Unit tests pass
- [ ] (add more as needed)

**Blocked By:** (other task IDs or human tasks)

---

### Task 2: [Title]

| Field      | Value |
|------------|-------|
| Task ID    | TP-XXX-02 |
| Scope      | small / medium |
| Type       | create / modify / remove / configure |
| Status     | pending / in-progress / complete / blocked |

**Description:**  

**Files Affected:**
- 

**Acceptance Criteria:**
- [ ] 

**QA Requirements:**
- [ ] Lint check passes
- [ ] Type check passes
- [ ] Build succeeds
- [ ] Unit tests pass

**Blocked By:**

---

## Human Tasks

List any tasks that require human action. Create entries in `.agentic/human-tasks/pending/` for each.

| Human Task | Reason | Blocks |
|------------|--------|--------|
|            |        |        |

## Post-Completion

After all tasks are complete:

- [ ] Run full QA suite
- [ ] Finalize QA report (same file used during implementation—incremental log + consolidated checks)
- [ ] Update [context-index.md](../../index/context-index.md) if needed
- [ ] Update [repo-map.md](../../index/repo-map.md) if needed
- [ ] Update documentation if workflow changed

## Related Artifacts

| Artifact        | Reference |
|-----------------|-----------|
| Feature Brief   | FB-XXX    |
| Spec            | SP-XXX    |
| Decision Notes  |           |
| QA Report       |           |

---

*Created by the Agentic Toolkit workflow chain. See [WORKFLOW_EXPLAINED.md](../../guide/WORKFLOW_EXPLAINED.md).*
