# CV Update Function for Thomas Serre's Website
# Add this to your ~/.zshrc or ~/.bashrc

update_cv() {
    cd /Users/tserre/Projects/tserre.github.io
    ./update_cv.sh
}

# Alternative: Direct function (no separate script file needed)
update_cv_direct() {
    # Configuration
    CV_SOURCE_PATH="$HOME/Projects/prj_cv/latex/serre_cv.pdf"
    CV_DEST_PATH="/Users/tserre/Projects/tserre.github.io/assets/serre_cv.pdf"
    DAYS_THRESHOLD=7
    
    # Colors
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    YELLOW='\033[1;33m'
    NC='\033[0m'
    
    echo -e "${YELLOW}CV Update Checker${NC}"
    
    if [ ! -f "$CV_SOURCE_PATH" ]; then
        echo -e "${RED}Error: CV source file not found${NC}"
        return 1
    fi
    
    if [ ! -f "$CV_DEST_PATH" ]; then
        echo -e "${YELLOW}No existing CV found. Uploading...${NC}"
        cp "$CV_SOURCE_PATH" "$CV_DEST_PATH"
        cd /Users/tserre/Projects/tserre.github.io
        git add assets/serre_cv.pdf
        git commit -m "Add CV - $(date '+%Y-%m-%d')"
        git push
        echo -e "${GREEN}✓ CV uploaded and committed${NC}"
        return 0
    fi
    
    SOURCE_TIME=$(stat -f "%m" "$CV_SOURCE_PATH")
    DEST_TIME=$(stat -f "%m" "$CV_DEST_PATH")
    DAYS_SINCE_UPDATE=$(( (SOURCE_TIME - DEST_TIME) / 86400 ))
    
    if [ $DAYS_SINCE_UPDATE -gt $DAYS_THRESHOLD ]; then
        echo -e "${YELLOW}CV needs updating (${DAYS_SINCE_UPDATE} days old)${NC}"
        cp "$CV_SOURCE_PATH" "$CV_DEST_PATH"
        cd /Users/tserre/Projects/tserre.github.io
        git add assets/serre_cv.pdf
        git commit -m "Update CV - $(date '+%Y-%m-%d')"
        git push
        echo -e "${GREEN}✓ CV updated and committed${NC}"
    else
        echo -e "${GREEN}✓ CV is up to date${NC}"
    fi
}
