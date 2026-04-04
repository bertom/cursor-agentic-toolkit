# Glossary

Terms used throughout the Agentic Toolkit, defined in plain language.

| Term | Definition |
|------|-----------|
| **Agentic Toolkit** | The collection of templates, context files, rules, and guides that structure agent-assisted development. |
| **Agent** | An AI assistant operating within Cursor IDE that reads, writes, and modifies code under human direction. |
| **Artifact** | Any document produced by the workflow chain: feature brief, spec, decision note, task pack, or QA report. |
| **Bootstrap** | The process of installing the toolkit's folder structure, templates, and documentation into a repository for the first time. |
| **Context** | Curated project information (business, technical, constraints) that agents must read before making decisions. |
| **Context Health** | An assessment of whether project context is complete, current, and consistent. |
| **Context Index** | A catalog (`index/context-index.md`) listing all available context sources and their status. |
| **Constraints** | Hard limits on the project: deadlines, budgets, regulations, technical restrictions. |
| **Decision Note** | A document recording an important technical or architectural choice, including options considered and rationale. |
| **Feature Brief** | The starting artifact in the workflow chain. Captures the problem, desired outcome, and scope. |
| **Human Task** | A task that requires human action (e.g., dashboard configuration, key generation) and cannot be performed by an agent. |
| **Package Policy** | Rules governing which dependencies agents may introduce, including preferred and discouraged libraries. |
| **Project Mode** | A classification (new, active, mature, legacy) that influences how strictly the toolkit enforces its rules. |
| **QA Gate** | A checkpoint requiring quality validation before work is considered complete. |
| **QA Report** | A document recording the results of all quality checks performed on a completed task pack. |
| **Repo Map** | A document (`index/repo-map.md`) describing the repository's structure, key modules, and integration points. |
| **Spec** | A specification document that translates a feature brief into a concrete technical design. |
| **Task Pack** | A document breaking a spec into small, implementable tasks with QA requirements and dependencies. |
| **Traceability** | The ability to follow an artifact chain from implementation back to original intent (QA Report → Task Pack → Spec → Feature Brief). |
| **Wrapper Pattern** | The toolkit's architecture: the toolkit sits at the workspace root and project repos live inside `projects/` as independent git repos. |
| **Workflow Chain** | The sequence: Intent → Feature Brief → Spec → Decision Note → Task Pack → Implementation → QA Report → Documentation Update. |
| **Workspace Root** | The `cursor-agentic-toolkit/` folder — open this in Cursor, not the project folder. |
| **Cursor Rules** | `.mdc` files in `.cursor/rules/` that are automatically loaded by Cursor agents. They instruct agents without manual prompting. |
| **Governance** | Configurable policies in `context/governance.md` covering git operations, security, agent permissions, and approval gates. |
| **Approval Gate** | An action that requires explicit human confirmation before an agent may proceed. Defined in the governance policy. |
| **Git Policy** | The subset of governance that controls whether agents may commit, push, branch, merge, or modify git config. |
| **Security Policy** | Mandatory rules about secrets, credentials, PII, and sensitive data that cannot be overridden. |
| **Document Metadata** | Footer on project-specific documents recording last update date, who updated it, and what changed. |
| **Toolkit Version** | Semantic version number (e.g., 0.1.0) tracking the toolkit's evolution. Found in `SYSTEM_OVERVIEW.md`. |
| **Superseded** | An artifact status indicating it has been replaced by a newer version. The old artifact links to the new one. |

---

*This document is maintained by the Agentic Toolkit. Add new terms as the system evolves.*
