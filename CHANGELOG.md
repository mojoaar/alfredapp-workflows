# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.0.4] - 2026-09-16

### Added

- **Nyheder** (`nyheder`) — shows the latest news from DR and TV 2, newest first, with the
  source's icon on each row. DR is read from its official RSS feed; TV 2 is scraped because
  it publishes no feed.
- Release artifact: `nyheder.alfredworkflow`.

## [0.0.3] - 2026-09-16

### Changed

- All three workflow icons now have rounded corners with real transparency, so they no
  longer render as hard squares. **Opencode Terminal** also drops its white background,
  leaving the terminal artwork on transparency at its natural size.

## [0.0.2] - 2026-09-16

### Added

- **DeepSeek Chat** streams the model's chain of thought while it thinks, under a
  **⊚ Thinking** heading, and drops it once the answer is complete.
- **DeepSeek Chat** gains a **Reasoning** setting: Default (Thinking On), Low Effort,
  Max Effort and Thinking Off.
- **DeepSeek Chat** can delete a saved chat with `⌘↩` in the history browser (the file
  goes to the Trash, and the list refreshes).

### Changed

- **DeepSeek Chat** README documents the keyword modifiers, the universal action and
  fallback search, the archive folder, the `pid.txt` file, and that hotkeys must be
  re-recorded after import.

### Fixed

- **DeepSeek Chat** no longer fails with `SyntaxError: JSON Parse error` when the chat
  file does not exist yet.
- **DeepSeek Chat** no longer throws when a streaming chunk omits the content delta or
  the `choices` array.

## [0.0.1] - 2026-09-16

### Added

- **Work Apps** (`work`, `⌥⌘J`) — launches Microsoft Outlook, Microsoft Teams, Slack
  and Google Chrome on the work profile in one go.
- **Opencode Terminal** (`opt`, `⌥⌘O`) — opens a new Ghostty window running `opencode`
  in your home folder.
- **DeepSeek Chat** (`deepseek`, `⌥⌘A`) — streaming chat with the DeepSeek API and saved
  history, adapted from Alfred's official ChatGPT workflow (BSD 3-Clause).
- `scripts/package.sh` — builds an importable `.alfredworkflow` from a workflow folder.
- `scripts/check-secrets.sh` — credential scanner for tracked files, usable as a
  pre-commit hook.
- Release artifacts: `work-apps.alfredworkflow`, `opencode-terminal.alfredworkflow`
  and `deepseek-chat.alfredworkflow`.

### Notes

- Alfred strips hotkeys when a workflow is imported. Re-record `⌥⌘J`, `⌥⌘O` and `⌥⌘A`
  after importing.
- DeepSeek Chat requires your own API key, entered in Alfred's workflow configuration.
  No keys are stored in this repository.

[Unreleased]: https://github.com/mojoaar/alfredapp-workflows/compare/v0.0.4...HEAD
[0.0.4]: https://github.com/mojoaar/alfredapp-workflows/releases/tag/v0.0.4
[0.0.3]: https://github.com/mojoaar/alfredapp-workflows/releases/tag/v0.0.3
[0.0.2]: https://github.com/mojoaar/alfredapp-workflows/releases/tag/v0.0.2
[0.0.1]: https://github.com/mojoaar/alfredapp-workflows/releases/tag/v0.0.1
