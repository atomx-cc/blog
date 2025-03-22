---
title: "AI代理和工具"
date: 2025-03-09
description:
categories:
  - IT
tags:
  - 互联网
  - 数学&计算机
  - AI
---

# 项目需求

最近我在整理过去的历史档案，有超过100篇文章需要添加到hugo的文档库中，每篇都要加一个类似如下的头信息front matter：

```yaml
---
title: "AI代理和工具"
date: 2025-03-09
description:
categories:
  - IT
tags:
  - 互联网
  - 数学&计算机
  - AI
weight: 1
---
```
每个文件都是个性化的“标题、日期”，甚至“分类、标签”和排序“weight:”也不同。

这么多文章一个个手动，我觉着一下子就懒癌发作了，但是我又特别对这些文章感兴趣并想分享出来。我突然灵机一动想到的，或许可以试一下AI代理。

# 解决方案：

批量处理工具：有一些工具可以帮助你批量处理文件并添加或修改文件中的特定部分。例如，Python 中的 frontmatter 库可以帮助你处理 Markdown 文件的头信息。结合 glob 库，你可以一次性处理多个文件。

定制化脚本：你可以编写一个简单的脚本，读取每篇文章的标题、日期、分类、标签等信息，然后生成符合 Hugo 规范的头信息。使用 Python 和 YAML 库，可以轻松实现这一点。

AutoGPT 或类似工具：你可以探索使用 AutoGPT 或其他 AI 代理工具，它们可以帮助你自动化处理这些任务。你可以提供特定的任务描述和示例，然后 AI 代理会按照你的要求生成代码或执行任务。

# AI代理
也就是模拟人的手，去批量操作，告诉它规则就好了，这么简单的任务应该轻松松就干完了。

查看了一下，有以下这些选择：

- [Manus](https://manus.im/)
- [Claud](https://claude.ai/), [**computer use**](https://docs.anthropic.com/en/docs/agents-and-tools/computer-use)
- [OpenAI](https://openai.com), [AutoGPT](https://agpt.co/)
- [Lovable](https://lovable.dev/), [Github - Anton Osika](https://github.com/AntonOsika/gpt-engineer), [GPT Engineer](https://chatgpt.com/g/g-WwXQO67cv-gpt-engineer)
  

目前国产的Manus很火爆，刚刚在前几天发布了，但是处于测试阶段，需要获得邀请码才能试用；

而Anthropic大厂computer use 似乎也是测试状态，需要开发者的终端工作环境中才能用，所以也不算是成熟的产品。

而GPT Engineer 主要用来写代码的，非用于日常通用的任务。

所以，就只剩下AutoGPT可以试用一下，

# 体验报告 - AutoGPT

有待补充 。。。