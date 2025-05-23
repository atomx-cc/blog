# Debug


- 部署网页 worktree

如果 public 已经存在且是 gh-pages 工作树，脚本就不会试图重复添加，避免了 “gh-pages is already checked out” 的错误。

总结： • 出现错误的原因是由于 public 目录已经是 gh-pages 的工作树，所以再次执行 git worktree add 出错。
• 解决方法是确保在添加工作树前移除已有的 public 目录，或者修改脚本逻辑，直接利用已有的工作树更新内容并推送。

按照以上思路调整你的部署流程，就可以把 public 中构建的静态文件正确推送到远程的 gh-pages 分支中。



# 备忘


benchmark ？ 基准

使用AI代理，批量处理牟总的文章，或试用一下python - frontmatter 库。

1. 文章阅读时长估算？为何都是1分钟？



