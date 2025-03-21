---
title: "翻译项目需求概述"
date: 2024-12-11
description:
categories:
  - IT
tags:
  - 互联网
  - 数学&计算机
  - AI
---

适用于多语言版本的博客或网页文档翻译

- 开发程序语言：python，给程序逐行写英文注释；

- API：Google Cloud Translation API，使用高级翻译模型；

备注：此前尝试调用 Google Translation API 的NMT基础模型，可能它不识别文档格式的语法标记，导致被翻译后的文件格式混乱。为了避免这种情况，需要使用更先进的翻译模型，能够理解和保留文档格式；

- 源语言：此为源文件内容的人类自然语言版本（语言标签），程序应能自动识别源语言类别，也可在程序中定义默认源语言；

- 语言标签： Translation API 的多语种翻译功能使用 BCP 47 语言标签作为输入和输出的语言标识符，主要组成部分是ISO 639 标准中的语言代码，和ISO 3166 标准中的地区代码，例如 zh-TW 台湾正体、zh-CN 中文简体。

- 目标语言：把源文件内容翻译成我们想要的其他人类自然语言版本，文件的目录名称定义了目标语言，例如目录名 en 英文，de 德文。目录名并不一定与语言标签完全一致，例如目录zhs中文简体（语言标签 zh-CN ），en英文（不区分en-US美国英语 和 en-GB英国英语）；

- 源文件目录中可能有多级子目录、子文件等等，程序应该能识别并逐个检索并完成全部文件的翻译；

- 全部的目标语言目录及其文件结构与源语言目录保持一致，文件名也都是一样的，仅仅是目录名（en，de，zhs）不同。

- 本项目处理多语言版本的博客文件，在目标语言目录中持续有新的源语言文件，程序应跳过已经翻译成目标语言的文件，仅仅翻译新的源语言文件。例如en目录中大部分都是英文版本内容的文件，但是持续有源语言zh-TW的文件被添加进去，每次运行程序将其批量翻译成目标语言en。

- 程序会直接将翻译后的内容覆盖到目标语言目录中对应的源语言文件中，而不需要从源语言目录中复制文件到目标语言目录中。

# 文件格式
- 源文件格式：根据文件名后缀判断文件格式，如.md, .yaml, .xml等等。例如文件名以.md结尾，filename.md，属于markdown格式；
- 多格式并存：可能需要同时处理多种混合格式的文件，但是为了提高效率，我们尽可能每次只处理同一种格式文件；
- 自动检测文件格式：确保翻译模型能理解不同格式的语法标记，根据格式类型选择相应的处理方案，能保留源文件格式，这是最重要的翻译模型能力；


# 特别注意事项
- 文件格式的语法标记是不可翻译的，例如md文件中带有markdown格式标记，必须保留翻译后的文件与源文件相同的格式；
- 引用圣经、名言、人名、地名、图书、电影名称、汉语成语和寓言等应该保留一份原文的源语言，同时一份对应翻译的目标语言；
- 文件目录名、文件名不要翻译，因为作为最终网页url的一部分，应始终保持其英文语言版本；


# 问题
- 本项目所选用的翻译模型能有效识别并保留源文件的格式（例如markdown，YAML等待）吗？
若翻译模型能识别大部分的文件格式标记，那么我们就没必要采用复杂的文件格式解析库，因为我们翻译后的文件依然保留原文件的格式标记，所以仅仅是翻译了有必要翻译的文本内容。

- 翻译模型能识别出哪些文本是待翻译的内容？哪些部分引用的文本应该保持原文不翻译呢？例如我们把英文圣经和经典句子翻译成中文，那么应该保留一份原文，同时翻译一份中文对照。

- c++也能做本项目开发，但相比较python而言，更复杂；

- 调用 Translation API 并选用高级模型，是否需要先设置endpoint，并在Google Cloud控制台中进行特殊配置？如何简单高效地调用API，提供配置和调用的最佳实践。

