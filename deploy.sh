#!/bin/bash

# Exit if any command fails
set -e

# Build static files
hugo --minify

# Push main branch first
git add .
git commit -m "Update source content"
git push origin main

# Clean untracked files and switch branch
git clean -f -d
git checkout gh-pages

# Clean current branch
rm -rf *

# Copy public files
cp -r public/* .

# Push gh-pages branch
git add .
git commit -m "Update site content"
git push origin gh-pages

# Clean and return to main
git clean -f -d
git checkout main