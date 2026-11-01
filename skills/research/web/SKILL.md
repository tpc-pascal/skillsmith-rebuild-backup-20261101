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
|Research a URL or GitHub repository|Optional `efficient-web-research` guidance|Use primary sources; disclose and get approval before sending queries externally|`efficient-web-research`|
|Design or critique a web interface|Optional `impeccable` guidance|Only when requested; ask before first-run binary download, installation, or hooks|`impeccable`|
|Design or review a web page or app screen|Optional `taste-skill` guidance|Only when requested; approve external asset searches first|`taste-skill`|
|Broken/slow internet|use user-supplied local content|Do not silently switch to another network service|—|

## Rules

1. **Match the input language** — answer in the language the user used.
2. **Name every output**: fetched file → cache/`<name>.extract.md|.txt`; never overwrite sources; summaries → `<name>.digest.md`.
3. **Never invent input** — only process real content; no fake URLs or quotes.
4. **Fetch public URLs directly** when possible; disclose and get explicit selection before sending URLs or queries to an external reader.
5. **Locked content** (social, paywalls) — no login or bypass; tell the user if unreadable and ask for accessible content.
6. **Offline**: URLs, search, social APIs need connectivity; offline, read only user-supplied local content — this repo never creates a web cache.
7. **Always report the file written** (name + path) — never silently.
8. **Writing a report from web results** → when `paper` is installed, hand off after confirming requirements with `orchestrator`.
9. **Foreign-language sources** → translate only needed passages and mark `(translated from <language>)`; see [`references/translation.md`](references/translation.md).

## Third-party skills (fetched per session)

Fetch `agent-reach` only on request. Disclose the provider/channel and URL/query; proceed only after user selection. Never log in, transfer sessions/cookies, bypass access controls, or switch backends silently.

Fetch `impeccable` only for requested UI work. It may edit app files or download a first-run binary; ask before running, installing/updating, or enabling hooks.

Fetch `taste-skill` only for requested UI work. It needs Node.js 22+ and a browser, writes under `.taste-skill/`, and may search external assets; disclose and get approval before sharing project details or fetching assets.

Fetch `efficient-web-research` only when requested. Use the host's available tools, treat search snippets as leads rather than evidence, and obtain approval before sending any query to an external provider.

## references

- [`references/translation.md`](references/translation.md) — translating quotes and claims from foreign-language sources, with attribution and hedging preserved.

## Common combined flows

```text
URL web/social [network required] ▸ direct fetch or selected external reader ▸ text ▸ paper (if installed and a report is needed)
Topic search [network required] ▸ selected search tool ▸ URL list ▸ direct fetch ▸ text ▸ paper (if installed and a report is needed)
URL media [network required] ▸ skill media ▸ digest + frame ▸ paper (if installed and a report is needed)
```
