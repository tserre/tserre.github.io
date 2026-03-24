

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
