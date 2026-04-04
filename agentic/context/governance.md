# Governance

> Configurable policies for git operations, security, and agent permissions. Adjust these to match your team's preferences.

## Git Policy

Controls what agents may do with version control.

### Commit Policy

| Setting | Value | Options |
|---------|-------|---------|
| Agent may commit | **yes** | `yes` / `no` |
| Commit message style | **descriptive** | `descriptive` / `conventional` / `imperative` |
| Require task reference in message | **no** | `yes` / `no` |
| Max files per commit | **10** | any number |

When `descriptive` is selected, commit messages should clearly explain what changed and why in plain language. When `conventional`, follow the Conventional Commits spec (`feat:`, `fix:`, `docs:`, etc.). When `imperative`, use short imperative form ("Add auth middleware").

### Push Policy

| Setting | Value | Options |
|---------|-------|---------|
| Agent may push | **no** | `yes` / `no` |
| Agent may force push | **never** | `never` / `with-approval` |
| Agent may create branches | **yes** | `yes` / `no` |
| Branch naming convention | **feature/<slug>** | any pattern |

### Merge / Rebase Policy

| Setting | Value | Options |
|---------|-------|---------|
| Agent may merge branches | **no** | `yes` / `no` / `with-approval` |
| Agent may rebase | **no** | `yes` / `no` / `with-approval` |
| Agent may resolve conflicts | **no** | `yes` / `no` / `with-approval` |

### Git Configuration

| Setting | Value | Options |
|---------|-------|---------|
| Agent may modify git config | **no** | `yes` / `no` |
| Agent may add git hooks | **no** | `yes` / `no` / `with-approval` |

## Security Policy

### Secrets and Credentials

| Rule | Enforcement |
|------|-------------|
| Never commit secrets, API keys, tokens, or passwords | **mandatory** |
| Never commit `.env` files | **mandatory** |
| Never log or print secrets, even in debug output | **mandatory** |
| Flag hardcoded credentials in existing code | **mandatory** |
| Use environment variables for all sensitive values | **mandatory** |

### Sensitive File Patterns

Files matching these patterns must never be committed or read aloud in chat:

```
.env
.env.*
*.pem
*.key
*.p12
*.pfx
*credentials*
*secret*
*token*
serviceaccount*.json
```

### Data Handling

| Rule | Enforcement |
|------|-------------|
| Never include real user data in code, tests, or docs | **mandatory** |
| Use synthetic/mock data for development and testing | **mandatory** |
| Flag any PII (personally identifiable information) found in code | **mandatory** |
| Respect data residency constraints in `constraints.md` | **mandatory** |

### Dependency Security

| Rule | Enforcement |
|------|-------------|
| Check for known vulnerabilities before adding dependencies | **recommended** |
| Prefer well-maintained packages with active security response | **recommended** |
| Flag dependencies with no recent updates (>12 months) | **recommended** |
| Run `npm audit` / `pip audit` / equivalent after adding deps | **recommended** |

## Agent Permissions

Defines what agents are and aren't allowed to do beyond code changes.

### Allowed by Default

- Read any file in the workspace
- Create and edit files in `projects/<project-name>/`
- Create and edit toolkit artifacts in `agentic/`
- Run build, test, and lint commands
- Commit changes (per git policy above)
- Create branches (per git policy above)

### Requires Approval

- Deleting files
- Running database migrations
- Modifying CI/CD configuration
- Changing authentication or authorization logic
- Modifying deployment configuration
- Installing global packages or system-level tools

### Never Allowed

- Pushing to remote (unless git policy changed above)
- Force pushing
- Modifying git config
- Accessing or displaying secrets
- Running commands that could affect production
- Deleting branches
- Modifying other developers' uncommitted work

## Approval Gates

Defines which actions require explicit human approval before proceeding.

| Action | Approval Required |
|--------|-------------------|
| Architecture changes | always |
| New external dependencies | always |
| Security-related code changes | always |
| Database schema changes | always |
| API contract changes | always |
| Deleting or moving >3 files | always |
| CI/CD configuration changes | always |
| Environment configuration changes | always |
| Changes to this governance file | always |

## Audit Trail

The workflow chain itself serves as an audit trail:

- **Feature briefs** capture who requested what and why
- **Specs** capture the approved technical approach
- **Decision notes** capture choices and rationale
- **Task packs** capture the plan and its execution status
- **QA reports** capture validation results
- **Git history** captures what changed and when

No additional audit tooling is required — the artifacts are the audit.

---

*Last updated: [date]*
*This file is configurable. Adjust settings to match your team's preferences. Changes to governance should be communicated to all team members.*
