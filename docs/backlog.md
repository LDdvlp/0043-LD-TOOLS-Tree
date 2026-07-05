# Backlog

## Overview

| ID | Status | Description |
|---|---|---|
| **V0.1 - Core extraction** |||
| TREE-001 | ✅ Done | Extract Get-TreeLevel() |
| TREE-002 | ✅ Done | Extract Get-TreeNode() and Get-TreeEntry() |
| TREE-003 | ✅ Done | Extract New-TreeItem() |
| TREE-004 | ✅ Done | Regression tests |
| **V0.2 - Multi-format Engine** |||
| TREE-005 | ✅ Done | Support ASCII (+---) |
| TREE-006 | ✅ Done | Support Unicode (├──) |
| TREE-007 | ✅ Done | Ignore empty lines |
| TREE-008 | ✅ Done | Ignore comments |
| TREE-009 | ✅ Done | Prepare v0.2.0-alpha.1 release |
| TREE-010 | ✅ Done | Add Continuous Integration |
| TREE-011 | ✅ Done | Prepare v0.2.0-alpha.2 release |
| **V0.3 - Cross-platform** |||
| TREE-012 | 🚧 In progress | Audit cross-platform compatibility |
| TREE-013 | ⏳ Todo | Normalize path handling |
| TREE-014 | ⏳ Todo | Add Linux compatibility tests |
| TREE-015 | ⏳ Todo | Add macOS compatibility tests |
| TREE-016 | ⏳ Todo | Add GitHub Actions OS matrix |

---

# Tasks details

## TREE-012 — Audit cross-platform compatibility

### Documentation foundation

- [x] V0.3 roadmap opened
- [x] Documentation metadata cleaned
- [x] LD Git Standard defined
- [x] Conventional Commits enabled from now

### Technical audit

- [ ] Path separators
- [ ] Hardcoded paths
- [ ] PowerShell Core compatibility
- [ ] Encoding / line endings
- [ ] Linux runner
- [ ] macOS runner