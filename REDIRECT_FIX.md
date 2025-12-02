# Google Search Console "Page with redirect" Fix

## Problem

Google Search Console is reporting **"Page with redirect"** errors for pages on `thomas-serre.com`. This happens because:

1. **GitHub Pages Automatic Redirects**: When you set up a custom domain with a `CNAME` file, GitHub Pages automatically redirects all `tserre.github.io` URLs to `thomas-serre.com`
2. **Google Discovers Redirects**: Google Search Console tracks both domains and flags redirects as issues
3. **Expected Behavior**: These redirects are actually **intentional and necessary** for GitHub Pages custom domains

## Root Cause

- GitHub Pages redirects `https://tserre.github.io/*` → `https://thomas-serre.com/*`
- Google discovers URLs that redirect and flags them in Search Console
- Even though redirects are expected, Google reports them as issues

## Solution

### ✅ 1. Ensure All URLs Use `thomas-serre.com`

All canonical tags, sitemap URLs, and meta tags should reference `thomas-serre.com` only:

- ✅ **`_config.yml`**: `url: https://thomas-serre.com` (already correct)
- ✅ **Canonical tags**: Using `{{ page.url | prepend: site.url }}` (already correct)
- ✅ **Sitemap**: Only lists `thomas-serre.com` URLs (already correct)

### ✅ 2. Complete Sitemap

The sitemap has been updated to include all pages:
- Homepage
- About page
- Blog page
- All blog posts
- Other pages (docs, boxes, etc.)

### ✅ 3. Google Search Console Actions

Since the redirects are automatic and expected, you should:

1. **Remove `tserre.github.io` Property** (if you have it):
   - Go to Google Search Console
   - Remove the `tserre.github.io` property
   - Only keep `thomas-serre.com` as the verified property
   - This prevents Google from tracking redirects between domains

2. **Validate the Fix**:
   - In Google Search Console, go to the "Page indexing" report
   - Click "Validate Fix" for the redirect errors
   - Google will recrawl and update the status

3. **Request Indexing** (optional):
   - Use URL Inspection tool to request indexing for key pages
   - This speeds up the process

## Why Redirects Are Expected

GitHub Pages automatically redirects the old domain to preserve:
- **SEO value**: Passes link equity to the new domain
- **User experience**: Old bookmarks and links still work
- **Domain authority**: Consolidates all traffic to one domain

These redirects are **301 (permanent)** redirects, which is the correct type for domain migrations.

## Expected Outcome

After these changes:
1. ✅ All pages use `thomas-serre.com` URLs
2. ✅ Sitemap only lists `thomas-serre.com` URLs
3. ✅ Canonical tags point to `thomas-serre.com`
4. ✅ Google will eventually stop flagging redirects as errors (they're expected)
5. ✅ Only `thomas-serre.com` will be indexed (as intended)

## Timeline

- **Immediate**: Code changes are complete
- **5-10 minutes**: GitHub Pages rebuilds site
- **1-3 days**: Google recrawls pages
- **1-2 weeks**: Redirect errors should clear from Search Console
- **Ongoing**: Google indexes `thomas-serre.com` URLs

## Files Changed

- ✅ `sitemap.xml` - Updated to include all pages with `thomas-serre.com` URLs
- ✅ `_config.yml` - Already configured with `url: https://thomas-serre.com`
- ✅ `_layouts/default.html` - Already has canonical tags using `site.url`

## Notes

- The redirects from `tserre.github.io` to `thomas-serre.com` are **automatic and cannot be disabled**
- This is expected behavior for GitHub Pages custom domains
- Google Search Console may continue to show redirect warnings temporarily
- The redirects are 301 (permanent), which is correct for SEO
- As long as all canonical tags and sitemaps use `thomas-serre.com`, Google will eventually understand and index correctly

