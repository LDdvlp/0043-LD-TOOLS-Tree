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
| TREE-012 | ✅ Done | Audit cross-platform compatibility |
| TREE-013 | ✅ Done | Normalize path handling |
| TREE-014 | ✅ Done | Add Linux compatibility tests |
| TREE-015 | ✅ Done | Add macOS compatibility tests |
| TREE-016 | ✅ Done | Add GitHub Actions OS matrix |
| **V0.4 - Restore user workflow** |||
| TREE-017 | ✅ Done | Add command line interface |
| TREE-018 | ⏳ Todo | Restore Make Tree workflow |


---

# Tasks details

## TREE-012 — Audit cross-platform compatibility

### Documentation foundation

- [x] V0.3 roadmap opened
- [x] Documentation metadata cleaned
- [x] LD Git Standard defined
- [x] Conventional Commits enabled from now

### Technical audit

- [x] Path separators
- [x] Hardcoded paths
- [x] PowerShell Core compatibility
- [x] Encoding / line endings
- [x] Linux runner
- [x] macOS runner

---

## TREE-013 — Normalize path handling

### Audit

- [x] Temporary paths
- [x] Dot sourcing
- [x] Nested paths

### Validation

- [x] CI before refactor
- [x] CI after refactor

---

## TREE-014 — Add Linux compatibility tests

### Audit

- [x] No Windows-only assumptions
- [x] No Windows-only PowerShell usage
- [x] Existing test suite compatible with Linux runner

### Validation

- [x] GitHub Actions ubuntu-latest
- [x] PowerShell Core runner
- [x] Existing 15 tests executed

---

## TREE-015 — Add macOS compatibility tests

### Audit

- [x] No Linux-only dependencies
- [x] No hardcoded Unix paths
- [x] No filename case conflicts
- [x] Portable temporary paths
- [x] PowerShell Core compatible commands

### Validation

- [x] Existing test suite compatible with macOS runner
- [x] Cross-platform path handling validated

---

## TREE-016 — Add GitHub Actions OS matrix

### Implementation

- [x] Added GitHub Actions matrix strategy
- [x] Added ubuntu-latest runner
- [x] Added windows-latest runner
- [x] Added macos-latest runner

### Validation

- [x] Linux CI passed
- [x] Windows CI passed
- [x] macOS CI passed
- [x] Full matrix successful

---

## TREE-017 — Add command line interface

### Goal

Restore user access to LD-TOOLS-Tree engine.

### Implementation

- [x] Create bin entry point
- [x] Load core engine
- [x] Add command handling
- [x] Add input/output parameters

### Validation

- [x] CLI execution test
- [x] Existing CI still passing

---

## TREE-018 — Restore Make Tree workflow

### Goal

Connect CLI create command to tree creation engine.

### Implementation

- [ ] Read input tree file
- [ ] Send lines to core engine
- [ ] Create filesystem output

### Validation

- [ ] CLI create command test
- [ ] Existing CI still passing