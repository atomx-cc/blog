#!/bin/bash

# Exit if any command fails
set -e

# Store current branch name
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Build static files
hugo --minify

# Save public contents to temp
mkdir -p /tmp/hugo-public
cp -r public/* /tmp/hugo-public/

# Push main branch
git add .
git commit -m "Update source content" || true
git push origin main

# Switch to gh-pages and clean
git checkout gh-pages
rm -rf *

# Copy saved content to root
cp -r /tmp/hugo-public/* .
rm -rf /tmp/hugo-public

# Push gh-pages branch
git add .
git commit -m "Update site content" || true
git push origin gh-pages

# Return to original branch
git checkout "$CURRENT_BRANCH"

echo "Deployment complete! Returned to $CURRENT_BRANCH branch."