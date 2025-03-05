#!/bin/bash

# Exit if any command fails
set -e

# Store current branch name
CURRENT_BRANCH=$(git symbolic-ref --short HEAD)

# Commit and push changes in current branch first
git add .
git commit -m "Update content" || true
git push origin "$CURRENT_BRANCH"

# # 如果 public 已经是 worktree，则直接复用；否则创建 worktree
# if git worktree list | grep -q " public$"; then
#     echo "Worktree public already exists, reusing it."
# else
#     git worktree add -B gh-pages public origin/gh-pages
# fi


# 移除已存在的 public 工作树（忽略错误）
git worktree remove -f public 2>/dev/null || true

# 添加新的 gh-pages 工作树
git worktree add -B gh-pages public origin/gh-pages


# # Save CNAME file
# cp public/CNAME CNAME.tmp || true

# Build static files directly into the worktree
hugo --minify


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
# http://localhost:1313/hugo-paper/