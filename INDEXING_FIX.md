# Personal Site: "Crawled - Currently Not Indexed" Fix

## Problem

Google Search Console shows pages as **"Crawled - currently not indexed"**, meaning Google successfully crawled the pages but chose not to index them. This typically happens when:

1. **Empty meta descriptions** - Makes Google think pages are low quality
2. **Missing canonical URLs** - Google can't determine preferred page versions
3. **Incomplete sitemap** - Missing pages from sitemap

## Root Causes Identified

1. **Empty Description in `_config.yml`**: 
   - Had `description: []` (empty array)
   - Caused Jekyll SEO plugin to generate empty meta descriptions
   - Google sees empty descriptions as low-quality content

2. **Incomplete Sitemap**:
   - Only contained homepage URL
   - Missing blog posts (`_posts/`)
   - Missing other pages (about, blog, docs, etc.)

3. **Missing Canonical URLs**:
   - No canonical tags in layout
   - Google couldn't determine preferred page versions

## Solutions Implemented

### ✅ 1. Fixed Site Description

**File**: `_config.yml`

**Before**:
```yaml
description: []
```

**After**:
```yaml
description: "Thomas Serre is the Thomas J. Watson, Sr. Professor of Science at Brown University. Research in computational neuroscience, AI, brain-inspired vision models, visual perception, and explainable AI."
```

**Impact**: Jekyll SEO plugin now generates proper meta descriptions for all pages.

### ✅ 2. Added Canonical URLs

**File**: `_layouts/default.html`

**Added**:
```html
<link rel="canonical" href="{{ page.url | prepend: site.url }}">
```

**Impact**: Every page now has a canonical URL telling Google which version to index.

### ✅ 3. Created Complete Sitemap

**File**: `sitemap.xml`

**Before**: Only homepage

**After**: Includes:
- All blog posts from `_posts/`
- All pages (homepage, about, blog, docs, etc.)
- Proper priorities and change frequencies
- Last modified dates

**Impact**: Google can discover all pages and understand site structure.

## How It Works

### Sitemap Generation
The sitemap is a Jekyll template that automatically:
- Lists all blog posts with their publication dates
- Lists all pages (excluding system files like `_site`, `_posts`, `404.html`, etc.)
- Sets appropriate priorities (homepage = 1.0, others = 0.7-0.8)
- Sets change frequencies (homepage = weekly, others = monthly)

### Canonical URLs
Every page now includes:
```html
<link rel="canonical" href="https://tserre.github.io/page-url">
```

This tells Google:
- Which URL is the "official" version
- Prevents duplicate content issues
- Helps with indexing decisions

### Meta Descriptions
Jekyll SEO plugin (`{% seo %}`) now generates proper descriptions because:
- Site has a valid description in `_config.yml`
- Each page can override with front matter if needed
- Google sees meaningful content summaries

## Next Steps

1. **Wait for GitHub Pages to Rebuild** (5-10 minutes):
   - GitHub Pages will rebuild the site with new changes
   - Sitemap will be regenerated with all pages
   - Canonical URLs will appear on all pages

2. **Submit Updated Sitemap** (in Google Search Console):
   - Go to Google Search Console → Sitemaps
   - Submit/refresh: `https://tserre.github.io/sitemap.xml`
   - Google will discover all pages

3. **Request Indexing** (Optional, for faster results):
   - Use URL Inspection tool in Search Console
   - Enter each page URL
   - Click "Request Indexing"
   - Speeds up the process but not required

4. **Monitor Progress** (1-2 weeks):
   - Check Coverage report in Search Console
   - Pages should move from "Crawled - not indexed" to "Indexed"
   - Should see improvement over 1-2 weeks

## Expected Timeline

- **Immediate**: Changes are live on GitHub
- **5-10 minutes**: GitHub Pages rebuilds site
- **1-3 days**: Googlebot may recrawl some pages
- **1-2 weeks**: Most pages should be indexed
- **Ongoing**: Google continues to discover and index content

## Files Changed

- ✅ `_config.yml` - Added site description
- ✅ `_layouts/default.html` - Added canonical URL
- ✅ `sitemap.xml` - Complete sitemap with all pages

## Additional Notes

### Branch
Changes were committed to `dev` branch. If GitHub Pages deploys from `main`, you may need to merge:
```bash
git checkout main
git merge dev
git push origin main
```

### Jekyll SEO Plugin
The site uses Jekyll SEO plugin (`{% seo %}`) which automatically generates:
- Page titles
- Meta descriptions
- Open Graph tags
- Twitter Card tags
- Structured data

With the fixed description in `_config.yml`, all of these will now work properly.

## Summary

✅ **Fixed**: Empty site description  
✅ **Fixed**: Missing canonical URLs  
✅ **Fixed**: Incomplete sitemap  
✅ **Deployed**: Changes pushed to GitHub  

The "Crawled - currently not indexed" issue should resolve as Google recrawls pages with proper meta descriptions, canonical URLs, and a complete sitemap.

