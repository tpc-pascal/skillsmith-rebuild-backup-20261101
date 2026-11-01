---
name: doc
description: Extract/OCR/convert PDF/DOCX/XLSX with local CLIs. Use when a document needs text, OCR, page merge/split or DOCX export.
license: MIT
metadata:
  audience: document processing
  origin: custom
---

# doc — document processing (PDF/DOCX/XLSX)

Thin skill, **no code of its own**: routes to local CLIs using the recipes in [`references/doc-recipes.md`](references/doc-recipes.md).

## Routing table by input type

Identify the type with `file <f>` and by opening one page.

|Input + need|Main command|Notes|Third-party skill|
|---|---|---|---|
|PDF with text layer, want text|`pdftotext -layout`|§1|—|
|Scanned PDF/image, want text|OCR `pdftoppm` + `tesseract`|§1|—|
|Complex PDF/DOCX (tables, layout) → markdown/JSON|local `docling` CLI, if installed|§1 — PDF >5 pages: `--page-range`, timeout 180|`docling`|
|XLSX → CSV/markdown|libreoffice headless|§1|—|
|Authorized local CSV/TSV/JSON data → bounded exploration|local tools; optional `exploratory-data-analysis` guidance|Use only supported formats; do not send data externally|`exploratory-data-analysis`|
|CSV/XLSX data → statistics/charts|local pandas/matplotlib, if installed|Run EDA checks and choose tests/charts appropriate to the data|—|
|Merge/split/rotate/extract PDF pages|`qpdf`/`pdftk` + `pdfinfo`/`pdftoppm`|§2|—|
|Duplex/faded file, quick probe|`pdfinfo` + `pdftotext` (local)|empty/odd text → `pdftoppm` image probe, then `tesseract`|—|
|MD/text → DOCX/PDF export|local `pandoc`/`libreoffice`|§4|—|
|Verify freshly extracted output|`pdfinfo` + `pdftotext`|§4 — pages must match, text must not be empty|—|

## Rules

1. **Match the input language** — answer in the language the user used.
2. **Write output next to the source**: `<original_name>.extract.md|.txt|.csv`. Never overwrite the source.
3. **Label sources extracted from scans**: mark `[ocr]` — never blend with observed content.
4. **Verify before delivering**: page count must match (`pdfinfo`), extracted text must match the pages (`pdftotext`); missing/empty → re-extract.
5. **Local-first**: offline only when required CLIs/models are installed or cached; if missing, disclose or choose another local recipe — never claim offline completion.
6. After writing output, report the file written (name + path) — never silently.

## Third-party skills (fetched per session)

Optional `docling` and `exploratory-data-analysis` guidance can be fetched per session with `./scripts/fetch-session.sh --skill <name>` when requested. Prefer local processing; Docling may download models on first use. Analyze only authorized data, use EDA only for its supported formats, and never send local data to a remote service unless the user explicitly selects it after a data-handling disclosure. Do not auto-install dependencies.

## references

- [`references/doc-recipes.md`](references/doc-recipes.md) — §1 extraction (PDF/OCR/docling/DOCX/XLSX), §2 PDF conversion, §3 writing output, §4 DOCX export for the `paper` skill.
