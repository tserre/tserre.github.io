# CPSY 1950 Course Site — Accessibility Audit Report

**Date:** March 3, 2026  
**Standard:** WCAG 2.1 AA (Brown University requirement: https://digital-accessibility.brown.edu/)

## Lighthouse Accessibility Scores

| Page | Score |
|------|-------|
| Main course page (`/cpsy1950/`) | **100%** |
| Syllabus (`/cpsy1950/syllabus`) | **100%** |
| Outline (`/cpsy1950/outline`) | **100%** |

## Issues Found & Fixed

### 1. Outline page — Multiple h1 elements (FIXED)

**Issue:** The outline page had 3 `<h1>` elements (Course Outline, CPSY 1950 — Course Overview, Schedule), violating the single-h1-per-page rule.

**Fix:** Updated `cpsy1950/outline.md` so the layout provides the only h1 ("Course Outline"). Content sections use h2/h3 with proper nesting:
- h1: Course Outline (from layout)
- h2: CPSY 1950 — Course Overview, Schedule
- h3: Core format, Group & presentation plan, Week 1–14, Final Exam

## Manual Checks (Passed)

| Check | Status |
|-------|--------|
| Skip-to-content link | ✓ Present (first focusable element) |
| `lang="en-US"` on `<html>` | ✓ Present |
| Landmarks (header, nav, main, footer) | ✓ Present |
| External links have `target="_blank"` + `rel="noopener noreferrer"` + `title="Opens in new tab"` | ✓ Present on index |
| No iframes in course content (no YouTube embeds requiring title) | ✓ N/A |

## Recommendations

1. **Before each deploy:** Run `npx lighthouse http://localhost:4000/cpsy1950/ --only-categories=accessibility` after `bundle exec jekyll serve`
2. **When adding links:** Ensure external links include `target="_blank" rel="noopener noreferrer" title="Opens in new tab"`
3. **When adding images/iframes:** Every `<img>` needs alt text; every `<iframe>` needs a `title` attribute
4. **Heading hierarchy:** Never add h1 in content — the layout provides it. Use h2 > h3 > h4 in logical order
