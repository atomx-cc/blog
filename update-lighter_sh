#!/bin/bash

# Exit if any command fails
set -e

# Store current branch name
CURRENT_BRANCH=$(git symbolic-ref --short HEAD)

# Commit and push changes in current branch first
git add .
git commit -m "Update content" || true
git push origin "$CURRENT_BRANCH"

# 移除已存在的 public 工作树（忽略错误）
git worktree remove -f public 2>/dev/null || true

# 添加新的 gh-pages 工作树
git worktree add -B gh-pages public origin/gh-pages

# Save CNAME file if it exists
cp public/CNAME CNAME.tmp 2>/dev/null || true

# Build static files directly into the worktree
echo "🔨 Building with Hugo..."
if hugo --minify; then
    echo "✅ Hugo build successful"
else
    echo "❌ Hugo build failed"
    exit 1
fi

# Restore CNAME file
cp CNAME.tmp public/CNAME 2>/dev/null || true
rm -f CNAME.tmp

# Ensure CNAME exists
if [ ! -f "public/CNAME" ]; then
    echo "atomx.cc" > public/CNAME
fi

# Verify build
if [ ! -f "public/index.html" ]; then
    echo "❌ Build failed - no index.html generated"
    exit 1
fi

# Commit and push gh-pages
cd public
git add .
git commit -m "Update site content" || true

# Configure git for large pushes
git config http.postBuffer 524288000

# Push with timeout
echo "🌐 Pushing to GitHub Pages..."
if timeout 300 git push origin gh-pages; then
    echo "✅ Push successful"
else
    echo "⚠️ Push timed out, trying force push..."
    git push origin gh-pages --force-with-lease
fi

cd ..

echo "Deployment complete!"
echo "🌍 Site: https://atomx.cc"

# if the git push can not be success, wait for a while and try again
# or cd public and run `git push` command manually, it does work soon.

# test local webpage
# hugo serve -D
# http://localhost:1313/hugo-paper/
