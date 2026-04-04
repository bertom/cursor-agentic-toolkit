# Agent Behavior Rules

> Mandatory rules for any AI agent working in this workspace. Read this file in full before starting any implementation task.

## Workspace Structure

Use the 3-layer model:

- Toolkit Source: this repository (`cursor-agentic-toolkit/`)
- Project Runtime: independent project repo (e.g., `my-project/`)
- Project Operational Memory: external folder linked as `my-project/project-ops`

Runtime shape:

```
my-project/
├── .agentic/
├── project-ops -> /external/project-memory/my-project
└── src/
```

Code changes go in runtime code folders (`src/`, `app/`, etc.). Context summaries live in `.agentic/`; full operational artifacts live in `project-ops/`.

## Rule 1: Read Context Before Coding

Before making any code changes:

1. Read `.agentic/index/context-index.md` to understand what context exists
2. Read relevant context files in `.agentic/context/` based on the task
3. Check `.agentic/context/package-policy.md` if the task involves dependencies
4. Review any referenced decision notes

**Never assume context. Always verify.**

## Rule 2: Keep Changes Small and Focused

- Each change should address a single, well-defined concern
- Avoid combining unrelated changes in one session
- If a task grows beyond its original scope, stop and reassess

**If you are tempted to touch more than 5-10 files, reconsider the scope.**

## Rule 3: No Large Refactors Without Approval

Before performing any of the following, create a decision note and get human approval:

- Refactoring more than 3 files
- Changing the project's architecture
- Replacing a dependency with an alternative
- Moving or renaming large groups of files
- Changing core patterns (state management, routing, data flow)

**When in doubt, ask first.**

## Rule 4: Follow the Package Policy

Before introducing any new dependency:

1. Read `.agentic/context/package-policy.md`
2. Check if a preferred package already covers the need
3. Verify the package is not on the discouraged list
4. If the package is significant, create a decision note

**Never add a dependency without checking the policy.**

## Rule 5: Create Human Tasks When Blocked

If a task requires action you cannot perform (dashboard login, API key generation, DNS setup, etc.):

1. Create a human task file in `.agentic/human-tasks/pending/`
2. Use the template from `.agentic/human-tasks/human-task-template.md`
3. Include clear steps, expected return information, and validation criteria
4. Note the blocking relationship in the task pack
5. Continue with non-blocked work

**Never guess at configuration that requires human access. Create a human task instead.**

## Rule 6: Document Decisions

When you make a non-trivial technical decision:

1. Create a decision note using `.agentic/workflow/templates/decision-note-template.md`
2. Document the options you considered
3. Explain why you chose this approach
4. Note the consequences

Decisions that require documentation:
- Choosing between competing approaches
- Introducing architectural patterns
- Adding or replacing dependencies
- Deviating from existing conventions
- Making performance vs. complexity tradeoffs

**If someone would reasonably ask "why did you do it this way?", document it.**

## Rule 7: Produce QA Reports

After completing a task pack:

1. Run all applicable quality checks (lint, type check, build, tests)
2. Create a QA report using `.agentic/workflow/templates/qa-report-template.md`
3. Document what was tested and the results
4. Flag any issues found

**Work is not done until QA is documented.**

## Rule 8: Update Context After Changes

After completing meaningful work:

1. Update `.agentic/index/repo-map.md` if the repository structure changed
2. Update `.agentic/index/context-index.md` if new context was created
3. Update relevant context files if decisions or constraints changed
4. Update guide documents if the workflow or toolkit structure changed

**Project understanding should improve over time, not degrade.**

## Rule 9: Maintain Clarity in Documentation

When writing or updating documentation:

- Be clear and concise
- Explain purpose, not just mechanics
- Avoid unnecessary jargon
- Assume the reader has no prior context
- Each document should answer: what is this, why does it exist, when should it be used, how should it be used
- Include metadata footers on project-specific documents (last updated, updated by)
- Reference decision notes or task packs that prompted the change

See `.agentic/guide/DOCUMENTATION_STANDARDS.md` for full standards including versioning and traceability.

**If documentation is unclear, it's incomplete.**

## Rule 10: Respect Project Mode

Check `.agentic/context/technical-context.md` for the current project mode and adjust behavior:

| Mode | Behavior |
|------|----------|
| `new` | Focus on velocity. Lighter documentation. Accept more flexibility in patterns. |
| `active` | Standard workflow. Document medium+ changes. Follow established patterns. |
| `mature` | Strict documentation. Regression awareness required. Preserve stability. |
| `legacy` | Extra caution. Decision notes for any structural change. Thorough testing. |

## Rule 11: Use the Workflow Chain

For non-trivial work, follow the workflow:

1. Feature Brief → captures intent
2. Spec → captures design
3. Decision Note → captures important choices (when needed)
4. Task Pack → captures implementation plan
5. QA Report → captures validation

Skip steps only for trivial changes (typos, formatting). See `.agentic/guide/WORKFLOW_EXPLAINED.md` for guidance.

## Rule 12: Ensure Traceability

Every artifact should reference its related artifacts:

- Task packs reference their spec
- Specs reference their feature brief
- Decision notes reference the spec they inform
- QA reports reference the task pack they validate

**The chain should be navigable in both directions.**

## Rule 13: Follow Git Policy

Before performing any git operation, read `.agentic/context/governance.md` for the current settings.

**Default behavior:**

- **Commit:** Allowed. Use descriptive commit messages that explain what changed and why. Keep commits focused — one concern per commit.
- **Push:** Not allowed. Never push to remote unless governance policy explicitly permits it.
- **Force push:** Never allowed.
- **Branches:** Allowed. Use the naming convention from governance (default: `feature/<slug>`).
- **Merge/rebase:** Not allowed unless governance policy permits it.
- **Git config:** Never modify.

**Commit message quality:**

- Summarize the change in the first line (50-72 characters)
- Explain the reasoning in the body if non-obvious
- Reference the task pack ID if one exists (e.g., `TP-001`)
- Never include secrets, credentials, or tokens in messages

**If governance says agents should not touch git at all, respect that completely.**

## Rule 14: Security and Secrets

**Mandatory — these rules cannot be overridden:**

- Never commit, log, or display secrets, API keys, tokens, or passwords
- Never commit `.env` files or any file matching sensitive patterns (see `governance.md`)
- Never include real user data or PII in code, tests, or documentation
- Use environment variables for all sensitive configuration
- Flag any hardcoded credentials found in existing code
- Flag any security vulnerabilities discovered during work

**Before committing, verify:**

- [ ] No secrets or credentials in staged changes
- [ ] No `.env` files in staged changes
- [ ] No PII or real user data in staged changes

Read `.agentic/context/governance.md` for the full security policy and sensitive file patterns.

## Rule 15: Respect Approval Gates

Some actions always require explicit human approval. Read `.agentic/context/governance.md` for the full list.

**Always require approval before:**

- Architecture changes
- Security-related code changes
- Database schema changes
- API contract changes
- CI/CD configuration changes
- Changes to governance policy itself

**Never proceed with a gated action without confirmation.** If unsure whether something needs approval, ask.

## Rule 16: Flag Risks and Concerns

If you notice any of the following, raise it immediately:

- Security vulnerabilities
- Performance concerns
- Conflicting requirements
- Missing context that could lead to wrong decisions
- Scope creep
- Technical debt accumulating

**Proactive risk communication prevents costly mistakes.**

## Rule 17: Change Safety

Before executing changes, assess the blast radius:

| Blast Radius | Action Required |
|-------------|----------------|
| 1-2 files, isolated | Proceed normally |
| 3-5 files, related | Verify with task pack |
| 5+ files or cross-cutting | Create decision note, get approval |
| Architecture-level | Full workflow chain required |

---

## Quick Reference Checklist

Before starting implementation:

- [ ] Read context index
- [ ] Read relevant context files
- [ ] Check package policy (if adding dependencies)
- [ ] Review existing decision notes
- [ ] Confirm task pack exists for non-trivial work

During implementation:

- [ ] Keep changes small and focused
- [ ] Make code changes in project runtime code folders
- [ ] Create human tasks when blocked
- [ ] Document non-trivial decisions
- [ ] Follow package policy

After implementation:

- [ ] Verify no secrets or sensitive data in changes
- [ ] Run QA checks
- [ ] Create QA report
- [ ] Commit with descriptive message (if git policy allows)
- [ ] Do NOT push (unless governance explicitly allows)
- [ ] Update context files if needed
- [ ] Update repo map if structure changed
- [ ] Update documentation if workflow changed

---

*These rules are maintained by the Agentic Toolkit. Update them when agent workflow requirements change. Rules changes should be documented in a decision note.*
