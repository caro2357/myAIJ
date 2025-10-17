# Repository Guidelines

## Project Structure & Module Organization
- `AIJ-2025 (ver 2.1).tex`: main manuscript (Elsevier `elsarticle` review format).
- `AIJ-2025.bib`: BibTeX database; style is `elsarticle-num-names`.
- `fig/`: figure assets (`.png`). Prefer pattern `topic-variant-{s,f}.png` (e.g., `fig/normal-nim-s.png`).
- `elsarticle*.bst`, `.dtx`, `.ins`: class/style assets. Do not modify unless updating vendor files.
- Build artifacts: `.aux`, `.log`, `.out`, `.spl`, `.synctex.gz`, and the compiled `.pdf`.

## Build, Test, and Development Commands
- Fast build (recommended): `latexmk -pdf -interaction=nonstopmode "AIJ-2025 (ver 2.1).tex"`
- Manual build: `pdflatex "AIJ-2025 (ver 2.1).tex" && bibtex "AIJ-2025 (ver 2.1)" && pdflatex "AIJ-2025 (ver 2.1).tex" && pdflatex "AIJ-2025 (ver 2.1).tex"`
- Clean: `latexmk -C` (or delete typical aux files). Always quote the filename due to spaces/parentheses.

## Coding Style & Naming Conventions
- One sentence per line for readable diffs; wrap manually as needed.
- Indentation: 2 spaces; no tabs. Place all `\newcommand`/packages in the preamble.
- Labels: `sec:*`, `fig:*`, `tab:*`, `thm:*`. Example: `\label{fig:normal-nim-s}`.
- Figures: keep under `fig/`. Example include: `\includegraphics[width=0.48\textwidth]{fig/normal-nim-s.png}`.
- Citations: use natbib-style commands consistent with the chosen `.bst` (numeric names); avoid bare URLs—use `\url{}`.

## Testing Guidelines
- Build must succeed without errors; no “Undefined references/citations”.
- Fix overfull boxes (>2pt) where feasible; check PDF links (`hyperref`).
- Optional lint: `chktex -q "AIJ-2025 (ver 2.1).tex"` if available.

## Commit & Pull Request Guidelines
- Commits: imperative, concise subject. Suggested scopes: `tex:`, `fig:`, `refs:`, `proofs:`.
- PRs: describe changes, list affected sections/figures, note new packages, and attach a compiled PDF or screenshots of modified pages. Link related issues.

## Environment Notes
- TeX distribution: TeX Live/MiKTeX with packages used in the preamble (e.g., `algorithm2e`, `tikz`, `subcaption`, `booktabs`, `amsmath`, `hyperref`, `lineno`). Let MiKTeX auto-install or use `tlmgr install <pkg>`.
- Avoid renaming the main `.tex` file; scripts and bibliography expect the current basename.

