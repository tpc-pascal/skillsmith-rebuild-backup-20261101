# research — research skills

A collection for research workflows. `orchestrator` routes requests and confirms report requirements.

## Skills

| Skill | Role |
|---|---|
| [`orchestrator`](orchestrator/SKILL.md) | Identify needs and coordinate skills |

## Session skills (fetched per session, not redistributed)

Third-party skills are fetched with `scripts/fetch-session.sh` (URL + commit-SHA pin only, nothing committed here):

| Skill | Source | Used for |
|---|---|---|

## Install

```bash
npx skills add tpc-pascal/skillsmith --skill orchestrator
```

Replace the skill list with the names of the skills to install individually.

## General flow

```text
Request ▸ orchestrator ▸ confirm requirements ▸ choose a research workflow
```

`▸` means hand off to the next step; `/` means choose the relevant skill, not necessarily run all of them.

## Checks

Run `bash scripts/smoke.sh` from the repository root to check syntax, frontmatter, structure, and secrets.
