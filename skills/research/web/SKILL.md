---
name: web
description: Read web pages, social media and search online sources. Use when looking up URLs, articles, social posts or doing topic search.
license: MIT
metadata:
  audience: web/social/search reading
  origin: custom
---

# web — web, social media and search reader

Thin self-written skill: **no code** — reads public URLs and searches with available tools. Network requests need disclosure.

## Routing table by need

|Need|Tool|Notes|Third-party skill|
|---|---|---|---|
|Read a public web page/article|direct HTTP request or browser|Fetch the source directly; disclose any external reader used|—|
|Read a public social post|browser, direct request, or selected `agent-reach` channel|Ask before sending a URL/query to an external channel; never log in or bypass controls|`agent-reach`|
|YouTube/Bilibili → text/auto-captions|`yt-dlp --write-auto-subs --skip-download`|Network required; summarize local media with skill `media`|—|
|Web search by topic|a configured web-search tool or selected `agent-reach` channel|Disclose the provider and get explicit selection before sending the query|`agent-reach`|
|Research a URL or GitHub repository|Optional `efficient-web-research` or `wiki-researcher` guidance|Use primary sources; disclose and get approval before sending queries externally|`efficient-web-research`, `wiki-researcher`|
|Design or critique a web interface|Optional `impeccable` guidance|Only when requested; ask before first-run binary download, installation, or hooks|`impeccable`|
|Design or review a web page or app screen|Optional `taste-skill` guidance|Only when requested; approve external asset searches first|`taste-skill`|
|Broken/slow internet|use user-supplied local content|Do not silently switch to another network service|—|

## Rules

1. **Match the input language** — answer in the language the user used.
2. **Name outputs**; never overwrite sources or leave writes unreported. Summaries use `<name>.digest.md`.
3. **Use real content only** — no invented URLs or quotes.
4. **Fetch public URLs directly**; get explicit selection before sending URLs or queries to an external reader.
5. **Locked content** (social, paywalls) — no login or bypass; tell the user if unreadable and ask for accessible content.
6. **Offline**: read user-supplied content only; this repo creates no web cache.
7. **Reports** → hand off to `paper` after `orchestrator` confirms requirements.
8. **Translate only needed passages**; mark `(translated from <language>)`. See [`references/translation.md`](references/translation.md).

## Third-party skills (fetched per session)

Use `agent-reach` only on request. Disclose provider/channel and URL/query; wait for selection. Never log in, transfer sessions/cookies, bypass controls, or switch silently.

Use `impeccable` only for requested UI work; ask before execution, first-run downloads, installs/updates, or hooks.

Use `taste-skill` only for requested UI work; it needs Node.js 22+ and a browser, writes in `.taste-skill/`, and may search assets. Disclose and get approval first.

Use `efficient-web-research` only on request; use host tools, verify primary sources, and get approval before external queries.

Use `wiki-researcher` only for requested in-depth codebase research. Trace implementation, cite evidence, state scope, and use authorized repositories only.

## references

- [`references/translation.md`](references/translation.md) — translating quotes and claims from foreign-language sources, with attribution and hedging preserved.

## Common combined flows

```text
URL web/social [network required] ▸ direct fetch or selected external reader ▸ text ▸ paper (if installed and a report is needed)
Topic search [network required] ▸ selected search tool ▸ URL list ▸ direct fetch ▸ text ▸ paper (if installed and a report is needed)
URL media [network required] ▸ skill media ▸ digest + frame ▸ paper (if installed and a report is needed)
```
