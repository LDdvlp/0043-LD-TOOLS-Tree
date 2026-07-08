# Tree Roadmap

## Version 0.1 - Legacy Refactoring

- Import legacy tools
- Extract parser functions
- Extract creator functions
- Add regression tests
- Keep 100% legacy compatibility

---

## Version 0.2 - Multi-format Support

- Support ASCII (+---)
- Support Unicode (├──)
- Ignore comments
- Ignore empty lines

---

## v0.3 - Cross-platform

Goal:

Run LD-TOOLS-Tree on:

- Windows
- Linux
- macOS

Tasks:

- Audit platform dependencies
- Normalize paths
- Validate filesystem behavior
- Add CI OS matrix

---

## Version 0.4 - Restore user workflow

- Command line interface
- Restore Make Tree workflow
- Restore Export Tree workflow
- Packaging