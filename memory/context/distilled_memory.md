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

---
## Distilled 2026-04-22 04:30 UTC

### cpsy1950 Week 14 Tue lecture — Slides + Panopto added (2026-04-21)

Two incremental updates to `cpsy1950/index.md`, Week 14 Tuesday 4/21 block ("The role of feedback in biological and artificial vision"):
- **Slides link** (Google Slides): `https://docs.google.com/presentation/d/13vkYs1nYExpOY4bi03koeweiuxT4GEaE5Cd-3FHZ6u8/edit?usp=sharing` — commit `f6bfad3` on `master` in `tserre/tserre.github.io`.
- **Panopto lecture capture** (one-link-per-push workflow): `https://brown.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=5b74eb9c-6077-4576-933c-b43301314ef1` — placed next to the Slides link using the canonical `📑 Slides · Lecture capture` pattern, pushed separately.

Notes:
- Tuesday CPSY1950 sessions are recorded to **Panopto** (Brown-hosted), Thursday guest lectures have previously used **Zoom share** recordings — both are valid, just different hosts. Use whichever URL the instructor/guest provides.
- Distilled memory file is explicitly included in `git add` when Thomas says "push to gh" — this is the expected behavior (auto-staged like other "reasonable files"), not a stray file.

### Lab-website (serre-lab/Lab-Website, `~/Work/research/lab-website/`) — Selected Publications card swap

Replaced the "Deceptive learning in histopathology" card in the **Selected Recent Publications** grid on the Home page with the newer Calvert et al. 2026 spinal-cord paper:

- **Title**: "Perilesional neuromodulation replaces lost sensorimotor function in persons with spinal cord injury"
- **Authors**: J.S. Calvert et al.
- **Venue**: *Nature Biomedical Engineering*, 2026
- **Source of truth for citation details**: `src/data/publications_by_year.json` (already had the full record + Nature URL). Always pull metadata from this file rather than typing by hand — ensures consistency with the publications page.

Structural notes for future edits on this repo:
- Home page publication cards live in `src/pages/Home/Home.tsx` as **hard-coded `<div className="highlight-card">` blocks** — they are NOT auto-generated from `publications_by_year.json`. To swap/add/remove a card, edit Home.tsx directly.
- Journal names on these cards are run through a `shortenJournalName()` helper (also in `Home.tsx`) that maps full names to display abbreviations (e.g. `'Attention, Perception, & Psychophysics' → 'Atten Percept Psychophys'`). To abbreviate a new journal, **add an entry to that map** — don't hand-edit the card text. Added `'Nature Biomedical Engineering': 'Nature BME'` in this session.
- Commits landed on `main` in `serre-lab/Lab-Website`; most recent: `4327ebb` ("Abbreviate Nature Biomedical Engineering to Nature BME").

### Conventions reinforced
- Weekly lecture updates pattern for cpsy1950/index.md: (1) pre-class, add Slides link; (2) post-class, add Lecture capture link next to it with ` · ` separator. Two separate commits is fine and is the actual workflow.
- On the lab website, publication card edits on Home.tsx must be kept consistent with `publications_by_year.json`; the JSON is the source of truth for citation strings, URLs, and year.

---
## Distilled 2026-04-27 04:30 UTC

### Lab-website (serre-lab/Lab-Website) — SciComm card added for Brown news on LLM "understanding"

Prepended a new entry to `src/data/scicomm.json` (newest-first ordering) for the Brown News piece "Do AI language models 'understand' the real world? On a basic level, they do, a new study finds" (2026-04-22, Kevin Stacey). Lepori / Serre / Pavlick, ICLR 2026 mechanistic-interpretability work classifying events as commonplace / improbable / impossible / nonsense.

- **Link:** `https://www.brown.edu/news/2026-04-22/artificial-intelligence-understanding-real-world`
- **Image:** Pulled the page's `og:image` (`neuralnets.jpg` on brown.edu) — same pattern as prior Brown news entries.
- **Commit:** `739ac6c` on `main` in `serre-lab/Lab-Website`. Pushed cleanly.

### Reinforced workflow conventions

- **Media page entries** are sourced from `src/data/scicomm.json` and rendered by `src/pages/SciComm/SciComm.tsx`. Order is **newest first** — always prepend, don't append.
- For Brown News (and similar) pieces, lift the hero image from `og:image` rather than typing one by hand: `curl -sL <url> | grep og:image` then HTML-decode the URL. Keeps cards consistent with the source page.
- After editing JSON data files (`scicomm.json`, `publications_by_year.json`), always validate with `node -e "JSON.parse(require('fs').readFileSync('<path>'))"` before committing — silent JSON parse errors break the build.
- Dependabot still has open high-severity alerts on `tserre.github.io` (unrelated to this commit but still pending — see 2026-04-21 entry).
