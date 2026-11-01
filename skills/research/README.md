# research — research skills

A collection for research and reporting workflows. `orchestrator` routes requests; `doc`, `media`, and `web` gather or process sources, and `paper` writes reports.

## Skills

| Skill | Role |
|---|---|
| [`orchestrator`](orchestrator/SKILL.md) | Identify needs and coordinate skills |
| [`doc`](doc/SKILL.md) | Read/convert PDF, DOCX, and XLSX |
| [`media`](media/SKILL.md) | Process video, audio, and images |
| [`web`](web/SKILL.md) | Read and search online sources |
| [`paper`](paper/SKILL.md) | Write international-standard or Vietnamese public-facing reports |

## Session skills (fetched per session, not redistributed)

Third-party skills are fetched with `scripts/fetch-session.sh` (URL + commit-SHA pin only, nothing committed here):

| Skill | Source | Used for |
|---|---|---|
| `watch` | [bradautomates/claude-video](https://github.com/bradautomates/claude-video) | Optional video content summaries for `media`; fetched per session |
| `agent-reach` | [Panniantong/Agent-Reach](https://github.com/Panniantong/Agent-Reach) | Optional public web/social reading channels for `web`; explicit provider selection required |
| `docling` | [docling-project/docling](https://github.com/docling-project/docling) | Optional local document conversion guidance for `doc`; fetched per session |
| `citation-management` | [K-Dense-AI/scientific-agent-skills](https://github.com/K-Dense-AI/scientific-agent-skills) | Optional citation search and management for `paper`; disclose external queries |
| `litreview` | [K-Dense-AI/scientific-agent-skills](https://github.com/K-Dense-AI/scientific-agent-skills) | Optional systematic literature review guidance for `paper`; disclose external queries |

## Install

```bash
npx skills add tpc-pascal/skillsmith --skill orchestrator --skill doc --skill media --skill paper --skill web
```

Replace the skill list with the names of the skills to install individually.

## General flow

```text
Request ▸ orchestrator ▸ doc / media / web ▸ paper (when a report is needed)
```

`▸` means hand off to the next step; `/` means choose the relevant skill, not necessarily run all of them.

## Reports

The `paper` skill supports exactly two forms:

- **International-standard report:** follow the requirements of the relevant field, journal, or organization and guidance for the study type.
- **Vietnamese public-facing report:** explain content to general readers in clear Vietnamese; this is an editorial form, not an official national standard.

Before writing, confirm purpose, audience, report form, language, output, and source scope when not already clear. Keep the report focused; put long extractions, raw data, and supporting assets in separate files when useful.

## Checks

Run `bash scripts/smoke.sh` from the repository root to check syntax, frontmatter, structure, and secrets.
