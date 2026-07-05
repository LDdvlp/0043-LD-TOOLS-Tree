# Tree Architecture

Version: 0.1.0 (Draft)

## Principles

Tree is composed of:

- a platform-independent core
- platform-specific integrations

The first supported platform is Windows.

Future platforms:

- Linux
- macOS

## Internal Data Model

### TreeEntry

A TreeEntry represents a normalized filesystem tree element.

```text
TreeEntry

Name
Level
IsDirectory
```

Rules:

- Name never contains format-specific markers.
- Level represents the hierarchy depth.
- IsDirectory defines the filesystem type.

## Engine Pipeline

```text
Input
  |
  v
Parsing Engine
  |
  v
TreeEntry[]
  |
  v
Filesystem Engine
  |
  v
Filesystem
```

## Platform compatibility

Core architecture:

```text
Parser Engine
      |
      v
TreeEntry[]
      |
      v
Filesystem Engine
```
The core engine must remain platform independent.

Legacy integrations:

| Component | Platform |
|---|---|
| *.cmd | Windows only |
| *.reg | Windows only |
