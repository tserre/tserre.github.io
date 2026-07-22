

---
## Distilled 2026-03-24 08:01 UTC

## Decisions
- **Publisher source links only**: All publications now link to publisher sources (ScienceDirect, arXiv, OpenReview, etc.) instead of PubMed or other aggregators (why: user preference for direct sources)
- **Title accuracy**: Publication titles updated to match publisher wording exactly, with sentence-case capitalization (why: consistency and SEO)
- **HTTPS upgrade**: All `http://` URLs upgraded to `https://` where possible, except for sites that don’t support HTTPS (`scholarpedia.org`, `cbcl.mit.edu`) (why: security and modern web standards)
- **Local PDF links**: Old server PDF links (`serre-lab.clps.brown.edu`) replaced with local `/papers/` paths (why: remove dependency on old server)

## Context Updates
- **Critical fix**: `officialPublicationUrls.js` had a wrong arXiv link (`2208.11746` instead of `2110.02772`) for "The challenge of appearance-free object tracking..." — now corrected
- **Minor title mismatches**: 4 titles updated to match publisher wording (e.g., "vs." → "versus", "mood-related" → "psychiatric-related")
- **Dead links**: 3 external dead links fixed (ClickMe, Brown mice article, PCMag article)

## Procedures
- **Publication verification workflow**: For future updates, verify publication URLs against publisher titles using:
  1. Direct fetching (with browser-like headers)
  2. CrossRef API for DOI-based links
  3. Manual review for access-restricted publishers (403/303 errors)

---
## Pending / watch (added 2026-07-22)
- **CVPR 2026 keynote video watch** — Waiting for the public recording of Thomas's CVPR 2026
  plenary *"Scaling Laws vs. Neural Laws: Toward More Natural Artificial Vision"* (Jun 7, 2026).
  When it's public, **replace all three blocks in the `<h2>Selected Talks</h2>` section of
  `index.html`** with a single block for this keynote (Thomas considers it the best summary of
  his current work), and optionally feature it on the lab website. Full details + where to check:
  Obsidian `Talks/2026-Jun-cvpr-plenary-video-watch.md`. As of 2026-07-22 it is **not yet public**
  (only a third-party commentary video exists on YouTube — not the official talk).
