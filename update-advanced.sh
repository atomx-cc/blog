#!/bin/bash
# 使用文件哈希检测，适合大型站点运行提高效率。

set -e

echo "🚀 Starting advanced deployment with change detection..."

CURRENT_BRANCH=$(git symbolic-ref --short HEAD)

# 1. Commit source changes
git add .
git commit -m "Update content - $(date '+%Y-%m-%d %H:%M:%S')" || echo "No source changes"
git push origin "$CURRENT_BRANCH" || true

# 2. Setup worktree
if ! git worktree list | grep -q " public$"; then
    rm -rf public
    git worktree add public gh-pages
fi

# 3. Create backup of current public state for comparison
cd public
BACKUP_DIR="/tmp/hugo-backup-$(date +%s)"
if [ -d ".git" ]; then
    mkdir -p "$BACKUP_DIR"
    # Copy only non-git files for comparison
    rsync -av --exclude='.git' ./ "$BACKUP_DIR/" 2>/dev/null || true
fi
cd ..

# 4. Build site
echo "🔨 Building site..."
hugo --minify --gc --cleanDestinationDir

# 5. Compare and commit only if there are real changes
cd public

# Use git's built-in change detection
if [ -n "$(git status --porcelain)" ]; then
    # Additional check: compare file contents, not just timestamps
    REAL_CHANGES=$(git diff --name-only | wc -l | tr -d ' ')
    
    if [ "$REAL_CHANGES" -gt 0 ]; then
        echo "📊 Real content changes detected in $REAL_CHANGES files"
        
        # Show what actually changed
        echo "📋 Files with content changes:"
        git diff --name-only | head -5
        
        git add .
        git commit -m "Deploy: $(date '+%Y-%m-%d %H:%M:%S') - $REAL_CHANGES files with content changes"
        
        echo "🌐 Pushing changes..."
        git push origin gh-pages
        echo "✅ Deployment successful!"
    else
        echo "ℹ️  Only timestamp changes detected, skipping deployment"
        git checkout -- .
    fi
else
    echo "ℹ️  No changes detected"
fi

# Cleanup
rm -rf "$BACKUP_DIR" 2>/dev/null || true
cd ..

echo "🎉 Process complete!"
