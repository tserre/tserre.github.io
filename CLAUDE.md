# Personal Website — tserre.github.io

Jekyll site hosted on GitHub Pages. Contains personal homepage and course pages.

## Structure

- Root: personal homepage (index.html, publications, research, etc.)
- `cpsy1950/` — course website (will become a git submodule)
- `cpsy1291/` — course website (will become a git submodule)
- `assets/serre_cv.pdf` — latest CV (copied from `~/Work/personal/cv/latex/serre_cv.pdf`)

## Accessibility

Brown requires WCAG 2.1 AA compliance by May 2026. See `.cursor/rules/accessibility.mdc`.

## Updating the CV

Run `./update_cv.sh` or manually: `cp ~/Work/personal/cv/latex/serre_cv.pdf assets/serre_cv.pdf`

# Session Memory
If `distilled_memory.md` exists in this directory, read it at the start of each session for recent decisions, context, and procedures from prior sessions.
