# DeepSeek Chat

Chat with the [DeepSeek API](https://api-docs.deepseek.com/) without leaving Alfred.

Adapted from Alfred's official [ChatGPT workflow](https://github.com/alfredapp/openai-workflow):
the image (DALL·E) parts are removed, and the endpoint, models and configuration are
retargeted to DeepSeek.

- **Keyword:** `deepseek`
- **Hotkey:** `⌥⌘A`

## Setup

1. Create an API key at <https://platform.deepseek.com/api_keys>.
2. Import the workflow by double-clicking the `.alfredworkflow` file.
3. Re-record the hotkey: **Alfred Preferences -> Workflows -> DeepSeek Chat**, click the
   Hotkey object, then press `⌥⌘A`. Alfred strips hotkeys from imported workflows.
4. Open **Configure** and paste the key into **DeepSeek API Key**.

Alfred stores the key in this workflow's `prefs.plist`, which is git-ignored and never
committed.

## Shortcuts

### In the chat

| Shortcut | Action |
| --- | --- |
| `↩` | Ask (continues the current chat) |
| `⌘↩` | Start a new chat |
| `⌥↩` | Copy the last answer |
| `⌃↩` | Copy the whole chat |
| `⇧↩` | Stop generating |

Answers are streamed token by token into Alfred's Text View.

### Elsewhere

| Shortcut | Action |
| --- | --- |
| `⌥↩` on the `deepseek` keyword | Browse saved chats |
| `⌘↩` on the `deepseek` keyword | Start a new chat |
| `⌘↩` in the history list | Delete the selected chat (moves it to the Trash) |
| `↩` on the **Ask DeepSeek** universal action | Send the selected text to DeepSeek |

The workflow is also available through the **Ask DeepSeek** universal action and Alfred's
**Fallback Search** (`deepseek <question>`). The separate **Add Context** keyword lets you
prepend a line of text to the next question.

## Reasoning

DeepSeek models think before answering, and **thinking is on by default**. While the model
thinks, the chain of thought streams as a quote under **⊚ Thinking**, above the answer as
it arrives. Once the answer is complete the chain of thought disappears, so saved chats,
archived chats and "Copy the whole chat" only ever contain the final answers.

| Reasoning | What it does |
| --- | --- |
| Default (Thinking On) | Sends nothing extra: thinking on, high effort |
| Low Effort | Faster, shorter reasoning |
| Max Effort | Slowest, most thorough reasoning |
| Thinking Off | Disables thinking entirely — the fastest replies |

## Configuration

| Setting | Default | Notes |
| --- | --- | --- |
| DeepSeek API Key | — | required |
| Keyword | `deepseek` | |
| Keep History | on | save the current chat when starting a new one |
| Model | `deepseek-flash` | alternative: `deepseek-v4-pro` |
| Reasoning | Default (Thinking On) | see [Reasoning](#reasoning) |
| Context | 24 | how many older messages to send (24 ≈ 12 questions and answers) |
| Timeout | 10 s | |
| System Prompt | — | optional |

Advanced: the workflow variables `deepseek_api_endpoint` and `deepseek_model_override`
override the endpoint and model. The endpoint defaults to
`https://api.deepseek.com/chat/completions`, which is OpenAI-compatible.

## Files created at runtime

- `${alfred_workflow_data}/chat.json` — the current conversation
- `${alfred_workflow_data}/archive/` — one file per archived conversation, shown in the history browser
- `${alfred_workflow_cache}/stream.txt` — streaming response buffer
- `${alfred_workflow_cache}/pid.txt` — process id used by "Stop generating"

## License

The `deepseek` helper is adapted from Alfred's official ChatGPT workflow:
Copyright (c) 2024 Running with Crayons Ltd, BSD 3-Clause — see [LICENSE](LICENSE).
