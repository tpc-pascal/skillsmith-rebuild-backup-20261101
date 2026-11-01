# Session-scoped third-party skills (fetch, never install permanently)

Optional third-party skills are fetched into a session temp directory and are never committed or installed permanently.

## Fetching

1. `scripts/fetch-session.sh --list` → see names; `--skill <name>` or `--all` — the script sparse-clones each source repo at the pinned commit SHA, copies into session temp.
2. Use from the fetched skill directory's `scripts/` folder.
3. Fetching session skills, downloading URLs, and downloading uncached models require network. Local-file operations can work offline when required CLIs and models are already available.

## `watch`

`watch` from [bradautomates/claude-video](https://github.com/bradautomates/claude-video), pinned to `03ceb42f7fa2c4439aca01752118044baabffb8f` (MIT), supports local processing and optional cloud backends. Fetch it with `./scripts/fetch-session.sh --skill watch` and read its `SKILL.md` before use.

Prefer local processing. Before setup or use that downloads software, uploads a video, or sends a URL, audio, or transcript to a cloud provider, explain what will be sent and to whom and get the user's explicit choice. Do not infer consent from configured credentials or automatically switch to a cloud backend.
