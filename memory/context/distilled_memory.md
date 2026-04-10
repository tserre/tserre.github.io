# Lab Website Memory

## Distilled 2026-04-10 20:44 UTC

### Recent Changes
- **Colin et al. publication update** (2026-03-11): Updated arXiv preprint for interpretability paper from v1 to v2 (`https://arxiv.org/abs/2411.03993v2`). Title: "Choosing the right basis for interpretability: Psychophysical comparison between neuron-based and dictionary-based representations." Changes synced across `publications_by_year.json`, `officialPublicationUrls.js`, and `serre_lab_publications.bib`.

- **Highlights section removal** (2026-03-11): Removed the new Highlights section from home page (`index.html`) after it replaced previous highlights unintentionally. The "Selected Recent Publications" section was kept as the main feature list. No separate highlights needed.

### Key Files & Locations
- **Publications data**: `src/data/publications_by_year.json` (source of truth)
- **URL resolver**: `src/data/officialPublicationUrls.js` (title → URL mapping)
- **BibTeX**: `serre_lab_publications.bib` (kept in sync with JSON)
- **Static dump**: `public/misc/publications` (legacy, synced with JSON)
- **Home page**: `index.html` (has "Selected recent publications" section only)

### Workflow Notes
- All publication updates go through `publications_by_year.json` first
- `sync_from_central.py` keeps lab site aligned with CV's central publication data
- Avoid adding duplicate publication metadata — use URL resolver for lookups
- Jekyll builds the site from `src/` to `public/`
