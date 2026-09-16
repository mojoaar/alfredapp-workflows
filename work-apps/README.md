# Work Apps

Launches your work applications in one go.

- **Keyword:** `work`
- **Hotkey:** `⌥⌘J`

## What it launches

| App | Command |
| --- | --- |
| Microsoft Outlook | `open -a "Microsoft Outlook"` |
| Microsoft Teams | `open -a "Microsoft Teams"` |
| Slack | `open -a "Slack"` |
| Google Chrome (work profile) | `open -na "Google Chrome" --args --profile-directory="Profile 3"` |

`open -a` focuses an app that is already running and launches it otherwise, so running the
workflow twice does not create duplicate windows.

Chrome needs `-n` (new instance) together with `--profile-directory`, because there is no
other way to select a profile from the command line.

## Changing the Chrome profile

`--profile-directory` takes the **on-disk folder name**, not the display name shown in
Chrome's profile menu. Open `chrome://version` in the profile you want and read the last
segment of **Profile Path** — for example `Default`, `Profile 1`, `Profile 3`. Put that
value in the script.
