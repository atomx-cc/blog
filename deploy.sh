#!/bin/bash

# Exit if any command fails
set -e

# Ensure we're on main branch
git checkout main

# Build static files
hugo --minify

# Save public contents to temp
mkdir -p /tmp/hugo-public
cp -r public/* /tmp/hugo-public/

# Push main branch
git add .
git commit -m "Update source content"
git push origin main

# Switch to gh-pages and clean
git checkout gh-pages
rm -rf *

# Copy saved content to root
cp -r /tmp/hugo-public/* .
rm -rf /tmp/hugo-public

# Push gh-pages branch
git add .
git commit -m "Update site content"
git push origin gh-pages

# Return to main
git checkout main