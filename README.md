# Alfred Workflows

A small collection of [Alfred 5](https://www.alfredapp.com/) workflows for macOS.
Requires Alfred 5 with the [Powerpack](https://www.alfredapp.com/powerpack/).

| Workflow | Keyword | Hotkey | What it does |
| --- | --- | --- | --- |
| [Work Apps](work-apps/) | `work` | `⌥⌘J` | Launches Outlook, Teams, Slack and Chrome (work profile) |
| [Opencode Terminal](opencode-terminal/) | `opt` | `⌥⌘O` | Opens Ghostty and starts `opencode` in your home folder |
| [DeepSeek Chat](deepseek-chat/) | `deepseek` | `⌥⌘A` | Chats with the DeepSeek API, with saved history |
| [Nyheder](nyheder/) | `nyheder` | — | Shows the latest news from DR and TV 2, newest first |

## Download

Ready-to-import workflow files are attached to the
[latest release](https://github.com/mojoaar/alfredapp-workflows/releases/latest):

| Workflow | File |
| --- | --- |
| Work Apps | [work-apps.alfredworkflow](https://github.com/mojoaar/alfredapp-workflows/releases/latest/download/work-apps.alfredworkflow) |
| Opencode Terminal | [opencode-terminal.alfredworkflow](https://github.com/mojoaar/alfredapp-workflows/releases/latest/download/opencode-terminal.alfredworkflow) |
| DeepSeek Chat | [deepseek-chat.alfredworkflow](https://github.com/mojoaar/alfredapp-workflows/releases/latest/download/deepseek-chat.alfredworkflow) |
| Nyheder | [nyheder.alfredworkflow](https://github.com/mojoaar/alfredapp-workflows/releases/latest/download/nyheder.alfredworkflow) |

Double-click a downloaded file to import it, then re-record its hotkey — see
[Hotkeys after import](#hotkeys-after-import).

## Building from source

Each workflow is a folder that Alfred can import directly. To build an importable
`.alfredworkflow` file yourself:

```bash
./scripts/package.sh deepseek-chat       # -> dist/deepseek-chat.alfredworkflow
```

Then either double-click the built file, or drag the workflow **folder** onto the
**Alfred Preferences -> Workflows** sidebar.

### Hotkeys after import

Alfred **strips hotkeys when a workflow is imported** (a safety measure). The hotkeys in
the table above are stored in each `info.plist` and keep working on the machine where they
were set, but after importing on another machine you may need to record them again:

> Alfred Preferences -> Workflows -> *workflow* -> click the **Hotkey** object -> click the
> hotkey field -> press the keys.

## Secrets

No API keys are stored in this repository. The DeepSeek API key is entered locally in
**Alfred Preferences -> Workflows -> DeepSeek Chat -> Configure**, and Alfred stores it in
`prefs.plist`, which is git-ignored.

`scripts/check-secrets.sh` scans tracked files for credential material and can be wired up
as a pre-commit hook:

```bash
ln -sf ../../scripts/check-secrets.sh .git/hooks/pre-commit
```

## Versioning

Releases follow [Semantic Versioning](https://semver.org/spec/v2.0.0.html) and are
documented in [CHANGELOG.md](CHANGELOG.md), which follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## License

MIT — see [LICENSE](LICENSE). The DeepSeek Chat helper is adapted from Alfred's official
ChatGPT workflow, which is BSD 3-Clause licensed — see
[deepseek-chat/LICENSE](deepseek-chat/LICENSE).
