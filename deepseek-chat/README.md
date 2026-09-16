# DeepSeek Chat

Chat with the [DeepSeek API](https://api-docs.deepseek.com/) without leaving Alfred.

Adapted from Alfred's official [ChatGPT workflow](https://github.com/alfredapp/openai-workflow):
the image (DALL·E) parts are removed, and the endpoint, models and configuration are
retargeted to DeepSeek.

- **Keyword:** `deepseek`
- **Hotkey:** `⌥⌘A`

## Setup

1. Create an API key at <https://platform.deepseek.com/api_keys>.
2. Open **Alfred Preferences -> Workflows -> DeepSeek Chat -> Configure**.
3. Paste the key into **DeepSeek API Key**.

Alfred stores the key in this workflow's `prefs.plist`, which is git-ignored and never
committed.

## Shortcuts

| Shortcut | Action |
| --- | --- |
| `↩` | Ask (continues the current chat) |
| `⌘↩` | Start a new chat |
| `⌥↩` | Copy the last answer |
| `⌃↩` | Copy the whole chat |
| `⇧↩` | Stop generating |

Answers are streamed token by token into Alfred's Text View.

## Configuration

| Setting | Default | Notes |
| --- | --- | --- |
| DeepSeek API Key | — | required |
| Keyword | `deepseek` | |
| Save chat history | on | |
| Model | `deepseek-flash` | alternative: `deepseek-v4-pro` |
| Context | 24 | how many older question/answer pairs to send |
| Timeout | 10 s | |
| System Prompt | — | optional |

Advanced: the workflow variables `deepseek_api_endpoint` and `deepseek_model_override`
override the endpoint and model. The endpoint defaults to
`https://api.deepseek.com/chat/completions`, which is OpenAI-compatible.

## Files created at runtime

- `${alfred_workflow_data}/chat.json` — the saved conversation
- `${alfred_workflow_cache}/stream.txt` — streaming response buffer

## License

The `deepseek` helper is adapted from Alfred's official ChatGPT workflow:
Copyright (c) 2024 Running with Crayons Ltd, BSD 3-Clause — see [LICENSE](LICENSE).
