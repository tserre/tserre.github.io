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

---
## Distilled 2026-04-17 04:30 UTC

### cpsy1950 course site — Week 13 + Week 14 fixes (tserre.github.io)

**Week 14 restructuring** — An earlier LLM edit had broken the consistency of the Week 14 block with prior weeks (Weeks 8/13). Aligned to the canonical template in `cpsy1950/index.md`:
- Tuesday summary uses `Lecture:` / `Guest lecture:` prefix (not topic-only title).
- Readings reverted from nested `<ol>` + focus/skim layout to the simpler intro paragraph + `<ul>` of links (matches Week 8).
- Replaced generic `.../assignments` placeholder URLs (which look like submission links) with per-assignment Canvas URLs once provided.
- Guest (Victor Boutin) given a homepage line ` — site` at `https://victorboutin.github.io/` to match Tuckute / VanRullen pattern.

**Canvas assignment IDs added (Week 14)**:
- W14 Reading Response (Tue 4/21): `https://canvas.brown.edu/courses/1101742/assignments/8113914`
- W14 Reflection (Sun 4/26): `https://canvas.brown.edu/courses/1101742/assignments/8113915`
- Removed stale `cpsy1950/week14-rubrics.md` file that was sitting in the repo.

**Week 13 — Tuckute guest lecture materials**:
- Copied slides into site tree: `~/Downloads/Tuckute_Language_network_LLMs_Brown_sh.pdf` → `personal/website/assets/cpsy1950/Tuckute_Language_network_LLMs_Brown_sh.pdf`. ~66 MB; GitHub warned ≥50 MB — consider Git LFS if more large assets come. `cp -f` is the keep-in-sync step when the file is updated in Downloads.
- Added **Slides (PDF)** + **Lecture capture** line in Tue 4/14 entry using the same `📑 Slides · Lecture capture` pattern as earlier weeks. Zoom play URL uses the short token form (`/rec/play/<token>`), stripping the long query string (works fine; revert to full URL only if browser issues).

**Week 14 — VanRullen guest lecture (Thu 4/16) lecture capture**:
- Zoom recording URL added to Thu 4/16 entry:
  `https://brown.zoom.us/rec/share/Dh6myqJFRT-3kYoYJPZ7G4pIGqXtRzTq05KMS84bkJatb7Q4CxEPdIYKDz0SK4EJ.M_w8D7_v23XlZ-c6`

**Repo/push note**: session also did a batched "push to gh" covering 4 repos — tserre.github.io (this one, incl. the 62 MB Tuckute PDF which tripped GitHub's >50 MB warning; 2 high-severity Dependabot alerts pending at https://github.com/tserre/tserre.github.io/security/dependabot), `serre-lab/prj_papers` (fossils paper), `Singapore_GlobalAI` (grant), `prj_cv`. All clean of secrets and no PLOS PDFs.

### Conventions reinforced
- Per-assignment Canvas URLs preferred over bare `/assignments` page.
- Guest lecture entries should carry: homepage link · slides (PDF) · lecture capture — all three, matching existing Week 13 pattern.
- Tuesday vs Thursday sessions keep `Lecture:` / `Guest lecture:` prefixes in the `<details>` summary.

---
## Distilled 2026-04-18 04:30 UTC

### cpsy1950 sidebar alignment

**File**: `_data/cpsy1950/structure.yml` drives the course site's left-sidebar menu for `layout: course-sidebar` pages.

**Change**: Renamed "W13 - Guest lectures" → "W13 - Frontier topics" and "W14 - Guest lectures" → "W14 - Frontier topics" so the sidebar labels match the schedule headings in `cpsy1950/index.md` (both read "Frontier topics in NeuroAI").

**Rule**: sidebar entries in `_data/cpsy1950/structure.yml` should stay in sync with the `### Week N` headings in `cpsy1950/index.md`. When a schedule heading changes, also update the sidebar label.

Pushed to tserre.github.io in the same session.

---
## Distilled 2026-04-20 04:30 UTC

### Safety rule: exam materials NEVER live in this (public) repo

`tserre.github.io` is a **public** GitHub Pages repo. During a `~/Work` backup audit on 2026-04-19, a `cpsy1950/final-exam/` folder was spotted as untracked in this repo with actual exam content (blueprint, questions, answer key, fake-paper PDF). Thomas deleted it on the spot and moved the materials to the private `tserre/cpsy1950` repo under `internal/`.

**Rule**: any file with "exam", "rubric+samples", "answer-key", "final-*" naming must go to `~/Work/teaching/cpsy1950/internal/` (private repo), **never** anywhere under `~/Work/personal/website/`. Grading spreadsheets were already in `.gitignore` for this repo — the same caution applies to any graded-work content.

### CV asset auto-update

When the CV is regenerated, a copy of `latex/serre_cv.pdf` gets pushed into this repo at `assets/serre_cv.pdf` so the public download link stays current. Expect a small commit here every time the CV repo ships a rebuild.

---
## Distilled 2026-04-21 02:00 UTC

**Brown library proxy URL migration.** Brown moved from their legacy EZproxy host `revproxy.brown.edu` to the OCLC-hosted EZproxy `brown.idm.oclc.org`. Both use the same hyphenated-hostname convention (`www-nature-com.brown.idm.oclc.org`), so a pure string swap of `revproxy.brown.edu` → `brown.idm.oclc.org` is safe — subdomain prefixes transfer unchanged.

Files updated in this repo: `cpsy1950/index.md` (9), `cpsy1950/syllabus.md` (3), `_data/cpsy1950/schedule.yml` (4), `_data/cpsy1950/readings.yml` (2). Committed as `c12686d` on `master` in `tserre/tserre.github.io`.

Action item: spot-check one or two proxied links from the cpsy1950 readings list before next class to confirm OCLC host resolves for Brown credentials. Dependabot flagged 2 high-severity alerts on `tserre.github.io` default branch (unrelated); review at https://github.com/tserre/tserre.github.io/security/dependabot when time allows.
