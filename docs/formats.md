# Tree Input Formats

## Legacy

```text
+-- Folder
|   +-- file.txt
```

---

## ASCII

```text
+--- Folder
|   +--- file.txt
```

---

## Unicode

```text
├── Folder
│   ├── file.txt
└── Other
```

---

## Rules

- Empty lines are ignored.
- Leading/trailing spaces are ignored.
- Indentation determines hierarchy.
- Folder names may optionally end with `/`.
- Files are identified by their names (with or without an extension).