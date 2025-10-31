# Jekyll Local Development Setup - Status

**Date:** October 31, 2025  
**Branch:** `dev`  
**Goal:** Set up local Jekyll development environment to test website changes

---

## What is Bundler?

**Bundler** is a Ruby tool (like `npm` for Node.js or `pip` for Python) that:
- Manages all the Ruby packages (called "gems") your Jekyll site needs
- Ensures everyone uses the same versions of dependencies
- Isolates your project's dependencies from other Ruby projects

Think of it as a package manager that reads your `Gemfile` and installs everything listed there.

---

## Progress So Far

### ✅ Completed
1. Created `dev` branch for safe testing
2. Installed Ruby 3.4.7 via Homebrew (isolated from system Ruby)
3. Installed Bundler 2.7.2 via Homebrew Ruby
4. Updated `Gemfile.lock` to use Bundler 2.7.2 (was 2.1.4)

### ⚠️ Current Issue

**Problem:** The `eventmachine` gem (version 1.2.7) is failing to compile native extensions.

**Error:**
```
fatal error: 'iostream' file not found
make failed, exit code 2
```

**Root Cause:** 
- The C++ headers from Xcode Command Line Tools are incomplete in `/Library/Developer/CommandLineTools/usr/include/c++/v1/` (only ~11 files instead of 200+)
- The proper headers exist in `/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/c++/v1/` but the symlink is broken
- This affects ALL C++ compilation on the system, not just Ruby gems
- Requires fixing the Command Line Tools installation (user intervention needed)

**System Info:**
- ⚠️ Xcode Command Line Tools: Installed but incomplete C++ headers
- ✅ Conda: Available
- ✅ rbenv: Installed with Ruby 2.7.8 and 3.4.7

---

## Options to Fix (For Future Agent)

### Option 0: Fix C++ Headers (Recommended First Step)
The Command Line Tools installation has incomplete C++ headers. Fix this first:

```bash
sudo rm -rf /Library/Developer/CommandLineTools/usr/include/c++
sudo ln -s /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/c++ /Library/Developer/CommandLineTools/usr/include/c++
```

Then retry bundle install with either Ruby version.

### Option 1: Use Conda Environment (User's Preference)
Create an isolated conda environment with an older Ruby version that's compatible with `github-pages`:

```bash
conda create -n jekyll-env ruby=2.7
conda activate jekyll-env
cd /Users/tserre/Projects/tserre.github.io
gem install bundler
bundle install
bundle exec jekyll serve
```

**Pros:** 
- Complete isolation (user's preferred approach)
- Ruby 2.7 works well with old Jekyll versions

**Cons:**
- Ruby 2.7 is older (but fine for this use case)

### Option 2: Update to Modern Jekyll
Remove `github-pages` gem and use a newer Jekyll version directly:

1. Update `Gemfile`:
   ```ruby
   source 'https://rubygems.org'
   gem "jekyll", "~> 4.3"
   gem "jekyll-seo-tag"
   gem "jekyll-theme-minimal"
   ```

2. Run `bundle update` (will resolve newer compatible gems)

**Pros:**
- Modern, actively maintained
- Better compatibility with Ruby 3.4.7

**Cons:**
- Need to test that site still works with newer Jekyll
- May need minor theme adjustments

### Option 3: Use rbenv with Ruby 2.7 (Alternative Isolation)
```bash
brew install rbenv ruby-build
rbenv install 2.7.8
cd /Users/tserre/Projects/tserre.github.io
rbenv local 2.7.8
gem install bundler
bundle install
bundle exec jekyll serve
```

---

## Files Modified

- `Gemfile.lock`: Updated `BUNDLED WITH` from 2.1.4 → 2.7.2

---

## ✅ SETUP COMPLETE!

**Date:** October 31, 2025, Evening

**Final Solution:**
1. ✅ Fixed C++ headers by creating proper symlink (user action)
2. ✅ Installed Ruby 3.3.0 via rbenv (compatible with eventmachine)
3. ✅ Installed Jekyll 4.4.1 with all dependencies
4. ✅ Server running successfully at http://localhost:4000

**Lessons Learned:**
- Ruby 3.4.7 is too new for `eventmachine 1.2.7` (has C++ compiler detection bug)
- Ruby 3.3.0 works perfectly
- The C++ header fix was essential for any native extension compilation
- Modern Jekyll (4.x) is much easier to set up than old github-pages

## How to Use

**Start the server:**
```bash
cd /Users/tserre/Projects/tserre.github.io
eval "$(rbenv init - zsh)"  # Make sure rbenv is active
bundle exec jekyll serve
# Opens at http://localhost:4000
```

**Make changes:**
- Edit files in the project
- Jekyll auto-rebuilds
- Refresh browser to see changes

**Stop the server:**
- Press Ctrl+C in terminal

---

## Testing Commands (Once Fixed)

```bash
# Navigate to project
cd /Users/tserre/Projects/tserre.github.io

# Make sure you're on dev branch
git checkout dev

# Start local server
bundle exec jekyll serve

# Visit http://localhost:4000 in browser
# Make changes to files and see them update automatically
```

---

## Notes for Future Agent

- User prefers **brew or conda** for isolation (avoids system mess)
- User is new to web dev, so simple explanations help
- The `dev` branch is set up and ready for testing once Jekyll works
- Personal site uses Jekyll, lab site uses Vite/React (different stack)

---

## Useful Resources

- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [Bundler Documentation](https://bundler.io/)
- [Conda Ruby Packages](https://anaconda.org/search?q=ruby)
- [Jekyll with GitHub Pages](https://jekyllrb.com/docs/github-pages/)

