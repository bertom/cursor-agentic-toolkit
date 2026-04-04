# Package Policy

> Controls which dependencies agents may introduce. Agents must consult this file before adding any new package.

## Purpose

Uncontrolled dependency growth leads to bloated bundles, security risks, and maintenance burden. This policy ensures consistency and intentionality.

## Preferred Packages

Libraries and frameworks that should be used when their functionality is needed.

| Category | Preferred Package | Version | Reason |
|----------|------------------|---------|--------|
|          |                  |         |        |

## Discouraged Packages

Libraries that should be avoided. Include the preferred alternative.

| Package | Reason to Avoid | Alternative |
|---------|----------------|-------------|
|         |                |             |

## Rules for New Dependencies

Before introducing a new dependency, verify:

- [ ] No existing dependency already provides this functionality
- [ ] The package is actively maintained (commits within last 6 months)
- [ ] The package has a reasonable download count / community
- [ ] The package license is compatible with the project
- [ ] The package does not duplicate functionality of a preferred package
- [ ] The bundle size impact is acceptable
- [ ] A decision note is created if the package is significant

## Dependency Size Limits

| Metric | Threshold | Action |
|--------|-----------|--------|
| Individual package size | > 100KB minified | Requires justification |
| Total bundle increase | > 50KB | Requires decision note |

> Adjust thresholds to match your project's needs.

## Version Pinning

| Strategy | Description |
|----------|-------------|
| Exact pinning | Use for critical dependencies where unexpected updates could break things |
| Minor range (`^`) | Default for most dependencies |
| Patch range (`~`) | Use when only patch updates are safe |

## Exceptions

Documented exceptions to the above rules.

| Package | Exception | Approved By | Date |
|---------|-----------|-------------|------|
|         |           |             |      |

---

*Last updated: [date]*  
*Update this file when preferred packages, policies, or thresholds change.*
