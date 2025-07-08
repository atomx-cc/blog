#!/bin/bash
# 高效的增量同步脚本 - 修复版本
# Exit if any command fails
set -e

echo "🚀 Starting efficient deployment..."

# Store current branch name
CURRENT_BRANCH=$(git symbolic-ref --short HEAD)

# 1. Commit and push source changes
echo "📝 Committing source changes..."
git add .
if git commit -m "Update content - $(date '+%Y-%m-%d %H:%M:%S')"; then
    git push origin "$CURRENT_BRANCH"
    echo "✅ Source changes pushed"
else
    echo "ℹ️  No source changes to commit"
fi

# 2. Clean up any existing worktree issues
echo "🧹 Cleaning up worktree..."
git worktree prune
if git worktree list | grep -q " public "; then
    # Backup CNAME if it exists
    if [ -f "public/CNAME" ]; then
        echo "💾 Backing up CNAME file..."
        cp public/CNAME /tmp/CNAME.backup
    fi
    git worktree remove public --force 2>/dev/null || true
fi
rm -rf public

# 3. Ensure gh-pages branch exists
echo "🔍 Checking gh-pages branch..."
if ! git show-ref --verify --quiet refs/heads/gh-pages; then
    echo "📋 gh-pages branch not found locally, checking remote..."
    if git ls-remote --exit-code --heads origin gh-pages >/dev/null 2>&1; then
        echo "📥 Fetching existing gh-pages from remote..."
        git fetch origin gh-pages:gh-pages
    else
        echo "🆕 Creating new gh-pages branch..."
        # Create orphan branch temporarily
        git checkout --orphan temp-gh-pages
        git rm -rf . 2>/dev/null || true
        echo "# GitHub Pages" > index.html
        git add index.html
        git commit -m "Initial gh-pages commit"
        git branch -M temp-gh-pages gh-pages
        git push origin gh-pages
        git checkout "$CURRENT_BRANCH"
    fi
fi

# 4. Create worktree
echo "📁 Creating worktree..."
if git worktree add public gh-pages; then
    echo "✅ Worktree created successfully"
else
    echo "❌ Failed to create worktree"
    exit 1
fi

# 5. Restore CNAME if it was backed up
if [ -f "/tmp/CNAME.backup" ]; then
    echo "🔄 Restoring CNAME file..."
    cp /tmp/CNAME.backup public/CNAME
    rm /tmp/CNAME.backup
fi

# 6. Build site with Hugo (Hugo is smart about incremental builds)
echo "🔨 Building site..."
# Use Hugo's built-in change detection
if hugo --minify --gc --cleanDestinationDir; then
    echo "✅ Hugo build successful"
else
    echo "❌ Hugo build failed"
    exit 1
fi

# 7. Ensure CNAME file exists (create if missing)
if [ ! -f "public/CNAME" ]; then
    echo "📝 Creating CNAME file..."
    echo "atomx.cc" > public/CNAME
fi

# 8. Check if build generated files
if [ ! -d "public" ] || [ ! -f "public/index.html" ]; then
    echo "❌ Build failed - no index.html generated"
    echo "📋 Public directory contents:"
    ls -la public/ 2>/dev/null || echo "Public directory doesn't exist"
    exit 1
fi

# 9. Efficient git operations in public directory
cd public

# Check what actually changed (use --force to ignore .gitignore)
echo "📊 Checking for changes..."
git add . --force
CHANGED_FILES=$(git status --porcelain | wc -l | tr -d ' ')

if [ "$CHANGED_FILES" -eq 0 ]; then
    echo "ℹ️  No changes detected in generated files"
    cd ..
    exit 0
fi

echo "📊 Found $CHANGED_FILES changed files"

# Show a summary of changes (optional, for debugging)
echo "📋 Change summary:"
git status --short | head -10
if [ "$CHANGED_FILES" -gt 10 ]; then
    echo "... and $(($CHANGED_FILES - 10)) more files"
fi

# 10. Commit only the changed files
echo "📤 Committing changes..."

# Create a more informative commit message
COMMIT_MSG="Deploy: $(date '+%Y-%m-%d %H:%M:%S') - $CHANGED_FILES files updated"
git commit -m "$COMMIT_MSG"

# 11. Push changes
echo "🌐 Pushing to GitHub Pages..."
if git push origin gh-pages; then
    echo "✅ Deployment successful!"
    echo "🌍 Site will be available at: https://atomx.cc"
    echo "📝 Latest commit: $(git log --oneline -1)"
else
    echo "❌ Push failed, retrying with force-with-lease..."
    sleep 2
    git push origin gh-pages --force-with-lease
fi

cd ..

echo "🎉 Deployment complete!"
echo "🔍 You can verify the deployment at: https://github.com/atomx-cc/blog/tree/gh-pages"
