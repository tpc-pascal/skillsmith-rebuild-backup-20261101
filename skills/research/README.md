# research — research skills

A collection for research workflows. `orchestrator` routes requests; `doc` extracts and converts local documents.

## Skills

| Skill | Role |
|---|---|
| [`orchestrator`](orchestrator/SKILL.md) | Identify needs and coordinate skills |
| [`doc`](doc/SKILL.md) | Read/convert PDF, DOCX, and XLSX |

## Session skills (fetched per session, not redistributed)

Third-party skills are fetched with `scripts/fetch-session.sh` (URL + commit-SHA pin only, nothing committed here):

| Skill | Source | Used for |
|---|---|---|

## Install

```bash
npx skills add tpc-pascal/skillsmith --skill orchestrator --skill doc
```

Replace the skill list with the names of the skills to install individually.

## General flow

```text
Request ▸ orchestrator ▸ doc (when documents need extraction or conversion)
```

`▸` means hand off to the next step; `/` means choose the relevant skill, not necessarily run all of them.

## Checks

Run `bash scripts/smoke.sh` from the repository root to check syntax, frontmatter, structure, and secrets.
