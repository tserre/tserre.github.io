#!/bin/bash

# Script to start Jekyll server for local development
# Handles bundler setup and starts the server

set -e

echo "🚀 Starting Jekyll development server..."
echo ""

# Check if bundle is installed
if ! command -v bundle &> /dev/null; then
    echo "❌ Bundler not found. Installing..."
    gem install bundler
fi

# Update bundler if needed
echo "📦 Checking bundler version..."
bundle update --bundler 2>/dev/null || true

# Install dependencies if needed
if [ ! -d "vendor/bundle" ]; then
    echo "📚 Installing Jekyll dependencies..."
    bundle install --path vendor/bundle
fi

# Start server with live reload
echo ""
echo "✅ Starting Jekyll server..."
echo "   📍 Local site: http://localhost:4000"
echo "   📍 CPSY 1950:  http://localhost:4000/cpsy1950/"
echo ""
echo "   Press Ctrl+C to stop"
echo ""

bundle exec jekyll serve --livereload --incremental
