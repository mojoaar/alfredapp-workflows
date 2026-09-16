# Opencode Terminal

Opens a new Ghostty window running `opencode` in your home folder.

- **Keyword:** `opt`
- **Hotkey:** `⌥⌘O`

## Requirements

- [Ghostty](https://ghostty.org/) installed in `/Applications`
- `opencode` available on your `PATH`

## The command

```bash
open -na Ghostty --args --working-directory="$HOME" -e opencode
```

Notes:

- macOS does not allow launching a terminal emulator from its own CLI, so the workflow uses
  `open -na` and passes the arguments through with `--args`.
- `-e <command>` runs that command inside the new terminal surface.
- The command is deliberately the **bare** `opencode`, not an absolute path. In Ghostty
  1.3.1, passing an existing absolute path after `-e` is also reported to AppKit as an
  "open file" request, which produces a second surface plus an *"Allow Ghostty to execute
  …"* prompt. Resolving the command through `PATH` avoids both.
