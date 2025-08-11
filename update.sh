#!/bin/bash

# Exit if any command fails
set -e

# Store current branch name
CURRENT_BRANCH=$(git symbolic-ref --short HEAD)

# Commit and push changes in current branch first
git add .
git commit -m "Update content" || true
git push origin "$CURRENT_BRANCH"

# # 如果 public 已经是 worktree，则直接复用；否则创建 worktree，这个命令似乎不管用
# # 总是导致错误 “fatal: 'gh-pages' is already checked out at './public'”
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


# Commit and push gh-pages
# if the execution of scriptures of update.sh is not successful
# then push below scriptures manually in terminal.
cd public
git add .
git commit -m "Update site content" || true
git push origin gh-pages
cd ..

echo "Deployment complete!"
# if the git push can not be success, wait for a while and try again
# or cd public and run `git push` command manually, it does work soon.

# test local webpage
# hugo serve -D
# http://localhost:1313/hugo-paper/