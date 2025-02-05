#!/bin/bash

# Exit if any command fails
set -e

# Store current branch name
CURRENT_BRANCH=$(git symbolic-ref --short HEAD)

# Commit and push changes in current branch first
git add .
git commit -m "Update content" || true
git push origin "$CURRENT_BRANCH"

# Build static files
hugo --minify

# Switch to gh-pages branch
git checkout gh-pages

# Use rsync to update files, excluding CNAME
rsync -av \
    --exclude=CNAME \
    --exclude=.git \
    public/ ./ || true

# Push gh-pages branch
git add .
git commit -m "Update site content" || true
git push origin gh-pages

# Return to original branch
git checkout "$CURRENT_BRANCH"

echo "Deployment complete! Returned to $CURRENT_BRANCH branch."

# test local webpage
# hugo serve -D
# http://localhost:1313/hugo-paper/