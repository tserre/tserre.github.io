#!/bin/bash

# CV Update Script for Thomas Serre's Website
# Checks if CV has been updated and uploads new version if needed

# Configuration
CV_SOURCE_PATH="$HOME/Projects/prj_cv/latex/serre_cv.pdf"
CV_DEST_PATH="assets/serre_cv.pdf"
WEBSITE_DIR="/Users/tserre/Projects/tserre.github.io"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}CV Update Checker for Thomas Serre's Website${NC}"
echo "================================================"

# Check if source CV exists
if [ ! -f "$CV_SOURCE_PATH" ]; then
    echo -e "${RED}Error: CV source file not found at $CV_SOURCE_PATH${NC}"
    exit 1
fi

# Check if destination CV exists
if [ ! -f "$CV_DEST_PATH" ]; then
    echo -e "${YELLOW}No existing CV found. Uploading new CV...${NC}"
    cp "$CV_SOURCE_PATH" "$CV_DEST_PATH"
    echo -e "${GREEN}✓ CV uploaded successfully${NC}"
    
    # Commit and push
    cd "$WEBSITE_DIR"
    git add "$CV_DEST_PATH"
    git commit -m "Update CV - $(date '+%Y-%m-%d')"
    git push
    echo -e "${GREEN}✓ Changes committed and pushed${NC}"
    exit 0
fi

# Get file modification times
SOURCE_TIME=$(stat -f "%m" "$CV_SOURCE_PATH")
DEST_TIME=$(stat -f "%m" "$CV_DEST_PATH")

echo "Source CV last modified: $(date -r $SOURCE_TIME)"
echo "Website CV last updated: $(date -r $DEST_TIME)"

# Check if source is newer than destination
if [ $SOURCE_TIME -gt $DEST_TIME ]; then
    echo -e "${YELLOW}CV has been updated. Uploading new version...${NC}"
    
    # Copy new CV
    cp "$CV_SOURCE_PATH" "$CV_DEST_PATH"
    echo -e "${GREEN}✓ CV updated successfully${NC}"
    
    # Commit and push
    cd "$WEBSITE_DIR"
    git add "$CV_DEST_PATH"
    git commit -m "Update CV - $(date '+%Y-%m-%d')"
    git push
    echo -e "${GREEN}✓ Changes committed and pushed${NC}"
    
else
    echo -e "${GREEN}✓ CV is already up to date${NC}"
fi

echo "================================================"
echo -e "${GREEN}CV check complete!${NC}"
