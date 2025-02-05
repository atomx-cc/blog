#!/bin/bash

# Exit if any command fails
set -e

# Store current branch name
CURRENT_BRANCH=$(git symbolic-ref --short HEAD)

# Commit and push changes in current branch first
git add .
git commit -m "Update content" || true
git push origin "$CURRENT_BRANCH"

# Remove existing worktree if exists
git worktree remove -f public 2>/dev/null || true

# Add gh-pages worktree
git worktree add -B gh-pages public origin/gh-pages

# Save CNAME file
cp public/CNAME CNAME.tmp || true

# Build static files directly into the worktree
hugo --minify --buildDrafts --verbose


# Restore CNAME file
# cp CNAME.tmp public/CNAME || true
# rm CNAME.tmp

# Commit and push gh-pages
cd public
git add .
git commit -m "Update site content" || true
git push origin gh-pages
cd ..

echo "Deployment complete!"

# test local webpage
# hugo serve -D
# http://localhost:1313/hugo-paper/# http://localhost:1313/hugo-paper/