#!/bin/bash

# Script to start Jekyll server for local development
# Uses rbenv Ruby if available

set -e

# Initialize rbenv if available
if command -v rbenv &> /dev/null; then
    eval "$(rbenv init - bash)"
fi

echo "🚀 Starting Jekyll development server..."
echo "   Ruby: $(ruby --version | cut -d' ' -f1-2)"
echo "   Bundler: $(bundle --version)"
echo ""

# Install dependencies if needed (only first time)
if [ ! -d "vendor/bundle" ]; then
    echo "📚 Installing Jekyll dependencies (first time only)..."
    bundle install --path vendor/bundle
    echo ""
fi

# Start server with live reload
echo "✅ Starting Jekyll server..."
echo "   📍 Local site: http://localhost:4000"
echo "   📍 CPSY 1950:  http://localhost:4000/cpsy1950/"
echo ""
echo "   Press Ctrl+C to stop"
echo ""

bundle exec jekyll serve --livereload --incremental
