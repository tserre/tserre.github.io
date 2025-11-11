# Custom Domain Setup for thomas-serre.com

## Date: November 11, 2025

## Changes Made

Your personal website has been configured to use **thomas-serre.com** as the canonical URL instead of **tserre.github.io**.

### Files Updated

1. ✅ **`_config.yml`** - Changed base URL from `https://tserre.github.io` to `https://thomas-serre.com`
2. ✅ **`index.html`** - Updated Open Graph and JSON-LD structured data URLs
3. ✅ **`CNAME`** - Created new file to tell GitHub Pages to serve from thomas-serre.com
4. ✅ **Canonical tags** - Automatically updated via Jekyll's `site.url` variable in layouts
5. ✅ **Sitemap** - Automatically updated via Jekyll's `site.url` variable

## How It Works

### Canonical Tags

The `_layouts/default.html` file uses:
```html
<link rel="canonical" href="{{ page.url | prepend: site.url }}">
```

This means all pages will now have canonical tags like:
- `<link rel="canonical" href="https://thomas-serre.com/">`
- `<link rel="canonical" href="https://thomas-serre.com/blog.html">`
- `<link rel="canonical" href="https://thomas-serre.com/2020/05/23/GAN.html">`

### Sitemap

The `sitemap.xml` file uses:
```xml
<loc>{{ site.url }}{{ page.url }}</loc>
```

All URLs in the sitemap will now use `https://thomas-serre.com/` as the base.

### CNAME File

The `CNAME` file tells GitHub Pages to:
1. Serve your site from thomas-serre.com instead of tserre.github.io
2. Automatically redirect tserre.github.io → thomas-serre.com
3. Handle SSL/HTTPS certificates for the custom domain

## DNS Configuration Required

For this to work, you need to configure your DNS settings at your domain registrar (where you bought thomas-serre.com):

### Option 1: Using an A Record (Apex Domain)

Add the following A records to point to GitHub Pages:

```
Type: A
Name: @ (or thomas-serre.com)
Value: 185.199.108.153
TTL: 3600

Type: A
Name: @ (or thomas-serre.com)
Value: 185.199.109.153
TTL: 3600

Type: A
Name: @ (or thomas-serre.com)
Value: 185.199.110.153
TTL: 3600

Type: A
Name: @ (or thomas-serre.com)
Value: 185.199.111.153
TTL: 3600
```

### Option 2: Using a CNAME Record (with www subdomain)

If you prefer using www.thomas-serre.com:

```
Type: CNAME
Name: www
Value: tserre.github.io
TTL: 3600
```

Then add a redirect from apex domain to www, or use the A records above for the apex domain.

### Recommended: Both

Add both the A records for thomas-serre.com AND a CNAME for www.thomas-serre.com:

```
# For thomas-serre.com (apex domain)
Type: A records (see Option 1 above)

# For www.thomas-serre.com
Type: CNAME
Name: www
Value: tserre.github.io
TTL: 3600
```

## Deployment Steps

### 1. Push Changes to GitHub

The changes have been made locally. Push them:

```bash
cd /Users/tserre/Projects/tserre.github.io
git add _config.yml index.html CNAME CUSTOM_DOMAIN_SETUP.md
git commit -m "Configure custom domain thomas-serre.com"
git push origin main
```

### 2. Configure DNS at Your Domain Registrar

1. Log in to your domain registrar (e.g., GoDaddy, Namecheap, Google Domains, etc.)
2. Navigate to DNS settings for thomas-serre.com
3. Add the A records listed above
4. Optionally add the CNAME record for www
5. Save changes (DNS propagation can take 24-48 hours)

### 3. Configure GitHub Pages Settings

1. Go to your GitHub repository: https://github.com/tserre/tserre.github.io
2. Navigate to **Settings** → **Pages**
3. Under "Custom domain", enter: `thomas-serre.com`
4. Click **Save**
5. Check **"Enforce HTTPS"** (may need to wait a few minutes after DNS propagates)

### 4. Verify Setup

After DNS propagates (usually within a few hours):

1. Visit https://thomas-serre.com - should show your site
2. Visit https://tserre.github.io - should redirect to thomas-serre.com
3. View source and check for canonical tag:
   ```html
   <link rel="canonical" href="https://thomas-serre.com/">
   ```

### 5. Submit to Google Search Console

1. Go to [Google Search Console](https://search.google.com/search-console)
2. Add thomas-serre.com as a new property
3. Verify ownership (use the HTML file or meta tag method)
4. Submit the sitemap: https://thomas-serre.com/sitemap.xml
5. (Optional) Set up a 301 redirect from the old property to the new one

## What This Accomplishes

### SEO Benefits

✅ **Single Canonical URL**: Google will index thomas-serre.com, not tserre.github.io  
✅ **Brand Consistency**: Your personal domain appears in search results  
✅ **Link Equity**: All backlinks consolidate to your branded domain  
✅ **Professional Appearance**: thomas-serre.com looks more professional than github.io  

### How It Works

1. **Users visit**: thomas-serre.com or tserre.github.io
2. **GitHub Pages**: Serves content from your repo
3. **Automatic redirect**: tserre.github.io → thomas-serre.com
4. **Canonical tags**: Tell Google thomas-serre.com is the "real" URL
5. **Search engines**: Index and rank thomas-serre.com

### Existing tserre.github.io Links

Don't worry about existing links! GitHub Pages automatically redirects:
- https://tserre.github.io → https://thomas-serre.com
- All subpages redirect too (e.g., /blog.html → thomas-serre.com/blog.html)

## Troubleshooting

### DNS Not Resolving

- Wait 24-48 hours for full DNS propagation
- Use `dig thomas-serre.com` to check DNS records
- Check your domain registrar's DNS management interface

### GitHub Pages Not Loading Custom Domain

- Verify CNAME file exists in repository root
- Check GitHub Pages settings in repository
- Ensure DNS A records point to correct IPs

### HTTPS Certificate Error

- Wait a few hours after DNS propagates
- GitHub automatically provisions SSL certificates
- Make sure "Enforce HTTPS" is checked in GitHub Pages settings

### Canonical Tags Not Updating

- Rebuild the Jekyll site (it rebuilds automatically on push)
- Clear browser cache
- Check that Jekyll build succeeded in GitHub Actions

## Technical Notes

### Jekyll Site Variables

The site uses these variables throughout:
- `{{ site.url }}` - Now resolves to https://thomas-serre.com
- `{{ page.url }}` - Relative page path
- Combined: `{{ page.url | prepend: site.url }}` - Full canonical URL

### CNAME File

The CNAME file **must**:
- Be in the repository root
- Contain only the domain name (no https://, no trailing slash)
- Contain only one domain
- Use the apex domain (thomas-serre.com) or www subdomain, not both

### GitHub Pages IP Addresses

Current GitHub Pages IPs (as of 2025):
- 185.199.108.153
- 185.199.109.153
- 185.199.110.153
- 185.199.111.153

These may change in the future. Check [GitHub's documentation](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site) for updates.

## Summary

✅ **Website configured** to use thomas-serre.com as canonical URL  
✅ **CNAME file created** for GitHub Pages custom domain  
✅ **Canonical tags updated** via Jekyll templates  
✅ **Sitemap updated** to use new domain  
✅ **Structured data updated** with new URL  

**Next**: Push changes to GitHub, configure DNS, and enable custom domain in GitHub Pages settings.

