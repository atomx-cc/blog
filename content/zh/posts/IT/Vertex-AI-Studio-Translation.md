---
title: "Google AI 翻译模型 - Vertex AI Studio - Translation"
date: 2025-03-10
description:
categories:
  - IT
tags:
  - 互联网
  - 数学&计算机
  - AI
---

**博客网站的文章翻译，选择哪个模型比较好？**

我们测试一下Google Cloud [Vertex AI Studio - Translation](https://cloud.google.com/vertex-ai)，其专业的翻译模型的种类多样，例如：
- NMT (modal used for translation modality)
- Translation LLM (modal used for translation modality)
- gemini-2.0-flash-001 (next generation gemini flash, super speed, multimodal generation, 1M token context window)

当我们写了一个程序调用以上模型，可能看到类似如下的报错。

```bash
% python translation-llm.py 
2025-03-17 17:48:30,421 - ERROR - Translation API error: 400 Cloud AutoML API has not been used in project 1***0 before or it is disabled. Enable it by visiting https://console.developers.google.com/apis/api/automl.googleapis.com/overview?project=1***0 then retry. If you enabled this API recently, wait a few minutes for the action to propagate to our systems and retry.; The model projects/1***0/locations/us-central1/models/TRL*** is not found or is deleted.; codes = [SERVICE_NOT_ACTIVATED (3), NOT_FOUND (5)]. 
2025-03-17 17:48:30,421 - ERROR - Translation failed for ~/sandbox/de/about.md after attempts.  
```
翻译失败，为何它要调用的 Cloud AutoML API ？这才发现 Vertex AI 是一个机器学习 (ML) 平台，用于训练和部署 ML 模型和 AI 应用程序。

关于 Vertex AI Studio - Translation 和 AutoML API

- AutoML API 允许开发者使用自己的数据训练自定义机器学习模型，包括翻译模型。
- Vertex AI Studio - Translation 是一个图形化界面，可以更方便地使用 AutoML API 训练和部署翻译模型。

我们想直接用一个翻译api，方便快捷，而不必要自己训练一个定制的模型。找错了方向，但是我们可以通过它做一些翻译测试看看。

试过后发现，它不是很稳定，像喝醉酒的人，有时候干得很好，有时候很糟糕，为什么呢？

Vertex AI Studio 中有Google的全部模型，我试过包括做数学题和编程，大多数时候表现都很糟糕，不如 Claud 3.5 sonnet，这可是免费的哦，而Vertex AI Studio 中的任服务都是收费的。

Gemini在业界也是享有盛名的，为何在这些测试中表现很差呢？是否因为Vertex AI Studio 是一个测试平台？

因此我们找到另外一个方案[Translation AI](https://cloud.google.com/translate)，详情请搜索相关文章“Cloud Translation API”。

