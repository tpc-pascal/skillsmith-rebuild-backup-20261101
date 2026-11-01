---
name: paper
description: Write international-standard or Vietnamese public-facing reports from collected sources, export `.report.md`/`.docx`. Use when a report is requested.
license: MIT
metadata:
  audience: reporting
  origin: custom
---

# paper — report writing

Writes reports from collected sources — choose **one** form; never mix both frameworks.

## Two report forms

|Form|Reference|Use when|
|---|---|---|
|International-standard report|[`references/report-academic.md`](references/report-academic.md)|Research structure, assessable methods, full citations; pick the guideline by study type, no compliance claim without a checklist.|
|Vietnamese popular report|[`references/report-template.md`](references/report-template.md)|For a general Vietnamese audience; evidence and limitations preserved.|

Shared rules: [`references/output-format.md`](references/output-format.md). Extract documents/media with the relevant skill first.

## Workflow rules

1. Confirm report form, purpose, audience, language, output format, and source scope; ask only for missing details. If the user delegates decisions, state assumptions.
2. Use only the selected report framework. Match the requested/contextual language; do not force bilingual output.
3. Keep `.report.md` on findings/reasoning; raw extracts, large tables, tool logs go to support files (see `references/output-format.md`).
4. Prefer local tools; disclose and get approval before sending search terms or identifiers to an external source. Never send confidential manuscript text or switch services silently; use optional API keys only when the user has configured them and explicitly approved that provider and data flow.
5. Save `<source_name>.report.md` next to the source; never overwrite sources.
6. Do not invent data, citations, or page numbers. Cite claims; mark facts vs observations vs inferences.
7. Check citations/links/consistency; verify DOCX/PDF exports with local tools; disclose unavailable ones.
8. Respond in the user's language; name every file created.

## DOCX and PDF export

Local first: `pandoc <file>.report.md -o <file>.report.docx` or `libreoffice --headless --convert-to pdf`. Verify with `pdfinfo` + `pdftotext`; disclose unavailable tools or verification limits.

## Third-party skills (fetched per session)

Optional `citation-management`, `litreview`, and `ppt-master` guidance can be fetched per session with `./scripts/fetch-session.sh --skill <name>` when requested. Scholarly searches use external services; obtain approval before sending queries, and do not send confidential manuscript text. Use `ppt-master` only for requested decks, preserve source files, and ask before installing dependencies or sending content to an external service. Do not use authenticated research or AI services unless the user explicitly selects the provider and approves the data flow.

## references

Citation formats: [`citation-styles.md`](references/citation-styles.md). Source credibility: [`source-assessment.md`](references/source-assessment.md). Synthesis: [`synthesis.md`](references/synthesis.md). Reporting principles: [`reporting-principles-sources.md`](references/reporting-principles-sources.md). Natural prose: [`ai-writing-tells.md`](references/ai-writing-tells.md) + [`slop-scoring.md`](references/slop-scoring.md) — sweep against both before delivering. Slides: [`pptx-decks.md`](references/pptx-decks.md).
