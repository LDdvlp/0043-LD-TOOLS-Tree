# Changelog

All notable changes to this project will be documented in this file.

The format is based on Keep a Changelog,
and this project adheres to Semantic Versioning.

## [Unreleased]

## [0.3.0-alpha.1] - 2026-07-05

### Added

- Added cross-platform compatibility validation
- Added Linux CI compatibility
- Added macOS CI compatibility
- Added GitHub Actions multi-OS matrix

### Changed

- Normalized path handling for PowerShell Core portability

## [0.2.0-alpha.2] - 2026-07-05

### Added

- Added continuous integration workflow.
- Added local CI entry point with ci.ps1.

### Changed

- GitHub Actions now delegates validation to local CI script.

### Notes

- Local CI remains the single source of truth.
- No parser or filesystem behavior changes.

## [0.2.0-alpha.1] - 2026-07-04

### Added

- Extracted `Get-TreeNode()` into the new Tree core.
- Added `Get-TreeEntry()` as the first parsing pipeline component.
- Extended automated unit tests.
- Added normalized TreeEntry internal data model.
- Added filesystem creation through New-TreeItem().
- Added directory and file creation tests.
- Added LD Test Runner v0.1 with numbering, sections and summary.
- Added legacy regression tests.
- Added fixture-based testing.
- Added full tree creation pipeline through Invoke-TreeCreation().
- Added ASCII tree format parsing support.
- Added ASCII regression fixture.
- Improved LD Test Runner summary with colors.
- Added Unicode tree format parsing support.
- Added Unicode regression fixture.
- Added empty lines regression test.
- Added empty lines fixture.
- Added comments regression test.
- Added comments fixture.
- Added GitHub Actions continuous integration.
- Added local CI script.