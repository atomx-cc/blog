#!/bin/bash
# 高效的增量同步脚本
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

# 2. Check if worktree exists and is properly set up
if git worktree list | grep -q " public$"; then
    echo "📁 Using existing worktree"
    cd public
    # Ensure we're on the right branch and up to date
    git checkout gh-pages 2>/dev/null || true
    git pull origin gh-pages --rebase || true
    cd ..
else
    echo "📁 Creating new worktree"
    rm -rf public
    git worktree add public gh-pages
fi

# 3. Build site with Hugo (Hugo is smart about incremental builds)
echo "🔨 Building site..."
# Use Hugo's built-in change detection
hugo --minify --gc --cleanDestinationDir

# 4. Efficient git operations in public directory
cd public

# Check what actually changed
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

# 5. Commit only the changed files
echo "📤 Committing changes..."
git add .

# Create a more informative commit message
COMMIT_MSG="Deploy: $(date '+%Y-%m-%d %H:%M:%S') - $CHANGED_FILES files updated"
git commit -m "$COMMIT_MSG"

# 6. Push changes
echo "🌐 Pushing to GitHub Pages..."
if git push origin gh-pages; then
    echo "✅ Deployment successful!"
    echo "🌍 Site will be available at: https://atomx.cc"
else
    echo "❌ Push failed, retrying..."
    sleep 2
    git push origin gh-pages
fi

cd ..

echo "🎉 Deployment complete!"