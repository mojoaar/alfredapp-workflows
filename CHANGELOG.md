# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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

[Unreleased]: https://github.com/mojoaar/alfredapp-workflows/compare/v0.0.1...HEAD
[0.0.1]: https://github.com/mojoaar/alfredapp-workflows/releases/tag/v0.0.1
