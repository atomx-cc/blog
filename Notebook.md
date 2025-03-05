# Debug


- 部署网页 worktree

如果 public 已经存在且是 gh-pages 工作树，脚本就不会试图重复添加，避免了 “gh-pages is already checked out” 的错误。

总结： • 出现错误的原因是由于 public 目录已经是 gh-pages 的工作树，所以再次执行 git worktree add 出错。
• 解决方法是确保在添加工作树前移除已有的 public 目录，或者修改脚本逻辑，直接利用已有的工作树更新内容并推送。

按照以上思路调整你的部署流程，就可以把 public 中构建的静态文件正确推送到远程的 gh-pages 分支中。



# 备忘

翻译 translate_ai.py， is_already_translated 函数

关于目标语言比例多少时，将启动翻译？参数设置0.6 ？

是否固定只能做 zh-CN 到 en 翻译，而不能做其他语言？

其中包括各种不需要翻译的符号也考虑在内，

详情参考 translate_ai/debug-others.md 

1. 增加数学符号显示样式
2. 文章阅读时长估算？为何都是1分钟？

两种场景的应用的prompt
1. 从中文简体翻译为英文和其他语言；
2. 从英文翻译为中文或其他语言；

