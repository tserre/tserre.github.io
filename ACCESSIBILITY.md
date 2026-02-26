# WCAG 2.1 AA Accessibility Compliance

Brown University requires full WCAG 2.1 AA compliance by May 2026.

## Ongoing Compliance Checklist

For every future change to this site — new pages, layout edits, style changes, data updates — verify:

1. **Heading hierarchy** — Single H1 per page, logical nesting (H1 → H2 → H3)
2. **Images** — Meaningful `alt` text for content images; `alt=""` for decorative images
3. **Links** — Descriptive link text (avoid "here", "click here", bare URLs)
4. **Color contrast** — Text/background meets 4.5:1 (3:1 for large text ≥18pt or 14pt bold)
5. **Keyboard accessibility** — All interactive elements focusable with visible focus styles
6. **ARIA** — `aria-label` on icon-only buttons/links; `aria-hidden="true"` on decorative icons
7. **Media** — No auto-playing video/audio without user controls

## Implemented Fixes (Jan 2026)

- Skip-to-main-content link (first focusable element)
- Correct heading hierarchy (sidebar "CPSY 1950" changed from H2 to styled div)
- `<main>`, `<header>`, `<nav>`, `<footer>` landmarks with `role` attributes
- `lang="en-US"` on `<html>`; viewport meta
- ARIA labels on all `<nav>` elements
- Font Awesome icons: `aria-hidden="true"` for decorative; `aria-label` for meaningful
- `.sr-only` utility class; `:focus-visible` styles for keyboard focus
- Schedule table: `<caption>`, `scope="col"` on `<th>`, `role="table"`
- External links: `rel="noopener noreferrer"`, `title="Opens in new tab"`
- Emoji icons wrapped in `<span aria-hidden="true">` where decorative
