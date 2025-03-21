---
title: "Cloud Translation API 模型配置和调试"
date: 2025-03-19
description:
categories:
  - IT
tags:
  - 互联网
  - 数学&计算机
  - AI
---

我们想调用 Cloud Translation API ，使用预训练的Translation LLM 模型，可以直接用于翻译，如何配置参数 MODEL_NAME 和 LOCATION等？

# 模型名称和地点？

```py
from google.cloud import translate_v3 as translate
from google.oauth2 import service_account

# --- Configuration ---
PROJECT_ID = os.environ.get("GOOGLE_CLOUD_PROJECT")
LOCATION = "global"
CREDENTIALS_PATH = os.environ.get("GOOGLE_APPLICATION_CREDENTIALS")
MODEL_NAME = " ?? "
```

找遍了Cloud Translation API 的相关说明文档，其中确实有LLM模型，但没有看到LLM模型在程序中的名称定义，也不清楚其服务地点，这有些诡异；

在 [Generative AI - 翻译文字](https://cloud.google.com/vertex-ai/generative-ai/docs/translate/translate-text?#translation_llm)中，确实能找到一个定义是`general/translation-llm`，使用 Vertex AI Endpoint调用，这就复杂了，而且endpoint 价格挺贵的。

然后进入 [Vertex ai studio - translation - translation LLM](https://console.cloud.google.com/vertex-ai/studio/translation)，找到模型的`Get code`，发现`adaptive_mt_translate()`，它是关于自适应机器翻译，如何使用 Google Cloud Translation API 的 Adaptive Machine Translation (Adaptive MT) 功能，这确实涉及到使用自定义数据集训练模型，这又变复杂了，所以这条路径也是错的。

# ListModels

然后我们写了一个小程序`output-api-model.py`，用来检测一下到底可以用什么，实现以下功能：

- 尝试在多个区域（global, us-central1, europe-west4, asia-northeast1）检查 Translation API 的可用性
- 列出每个区域支持的语言数量
- 列出每个区域可用的自定义翻译模型
- 测试默认翻译模型的可用性
- 特别测试 LLM 翻译模型 (general/translation-llm) 的可用性
- 测试基础翻译模型 (general/base) 的可用性
- 如果 Translation API 不可用，尝试检查 Vertex AI 的翻译能力
- 提供一个汇总，列出所有可用的翻译模型和 API

使用Translation API的ListModels方法，根据当前的google cloud 环境变量中，列出我们实际可用的模型和 API，程序会尝试实际调用这些 API 和模型，以确认它们是否真正可用。

然后输出结果如下：

```bash
% python output-api-model.py
Available Translation API locations and models:

Location: global
Supported languages count: 194
  - Error listing models in global: 400 Invalid custom model name. Unsupported location 'global'. Must be 'us-central1'.

Location: us-central1
Supported languages count: 194
No custom models found in us-central1
  - Default translation model is available in us-central1
  - Error accessing location europe-west4: 400 Invalid 'parent'.; Invalid location name. Unsupported location 'europe-west4'. Must be 'us-central1' or 'global'.
  - Error accessing location asia-northeast1: 400 Invalid 'parent'.; Invalid location name. Unsupported location 'asia-northeast1'. Must be 'us-central1' or 'global'.

LLM translation model is available: general/translation-llm in us-central1

Base translation model is available: general/base in us-central1

Base translation model is available: general/base in global

==========================================================================
SUMMARY:
Available Translation Models: us-central1:default, us-central1:general/translation-llm, us-central1:general/base, global:general/base
==========================================================================
```

这表明 general/translation-llm 模型仅在 us-central1 位置可用，难怪了，此前配置europe-west，或global都行不通，我以为global能自动给我找到距离最近的服务器，或者直接下单到我的位置europe-west，这都是因为环保人士总想着能源效率。

但是实际结果表明，Google这貌似新出的产品，也没有全球布局，还留在老家呢。

# Google Cloud Translation API 模型说明

## general/base 模型

**功能与定位**:
- general/base 是 Google Cloud Translation API 提供的主要翻译模型
- 它提供全面的通用翻译能力，适用于多种文本类型
- 作为 Translation API 的标准模型，它平衡了性能和可用性

**技术特点**:
- 该模型基于 Google 的神经机器翻译(NMT)技术
- 虽然被称为"基础"模型，但它已经整合了先进的机器学习技术
- 随着 Google 技术的迭代，该模型也在不断更新和改进

**可用性**:
- general/base 模型在多个 Google Cloud 区域可用，包括 "global" 和 "us-central1" 等位置
- 这使其成为大多数标准翻译需求的便捷选择
- 在不同区域的可用性可能会随时间变化，建议参考最新文档

## general/translation-llm 模型

**功能与定位**:
- general/translation-llm 是 Google 基于大型语言模型技术的翻译模型
- 它专为需要更高上下文理解和自然流畅输出的场景设计
- 作为更专业的选项，它针对复杂翻译任务进行了优化

**技术特点**:
- 该模型充分利用了大型语言模型(LLM)的能力
- 相比 general/base，它可能在处理复杂句式、专业术语和文化细微差别方面表现更佳
- 它代表了 Google 翻译技术的更高级实现

**可用性**:
- general/translation-llm 通常仅在特定区域可用，如 "us-central1"
- 使用此模型可能需要特定的权限或额外配置
- 它可能不像 general/base 那样广泛可用于所有项目或区域

## 模型选择考虑因素

在选择使用哪个模型时，应考虑以下因素:

1. **翻译需求复杂度**: 对于简单直接的翻译，general/base 可能已经足够；对于需要更好理解上下文的复杂内容，general/translation-llm 可能更合适

2. **区域可用性**: 根据您的项目区域和需求选择适当的模型

3. **性能与成本平衡**: 高级模型可能提供更好的结果，但也可能有不同的定价或使用限制

4. **特定语言对**: 某些模型在特定语言对上可能表现更好

最准确的信息应参考 Google Cloud 的官方文档，因为这些服务和模型会不断更新和改进。


# debug

还有一堆问题，主要是关于原文件格式保存。

该翻译工具由Gemini 2.0 Flash 初步打造，但是无法解决原文件格式丢失、跳过不必要翻译的目标语言文件、以及误判文件和字符的语言类型诸多问题。经过5个回合而无法完成debug，始终处于一种死循环中，解决一个问题，又陷入另外一个缺陷的境地。

此外，还尝试用NMT模型，它将文件的格式全部丢失，翻译后的全部字符缩成一团。。。

然后将该程序递交给[SourceGraph](https://sourcegraph.com) CODY，内置免费的编程辅助引擎[Anthropic](https://anthropic.com/)[Claude](https://claude.ai/)，只经过2个回合，一次修改，搞定了Gemini 遗留的难题。

经过1个月的实测经验，截止2025年3月中旬，Google尚未上线超越CODY的编程辅助模型，Google做得很大，可能细分市场方面还未介入，也或许早已有非常好的相关产品，但是我们若陷入Google的庞大产品迷魂阵和复杂的使用方法中。


## bug 案例

在frontmatter中的 categories: 和 tags: 下方的中横线 - 缺少一个tab的缩进，frontmatter 和首个大标题中间缺少一个空行。

```md
---
title: "Translation Solution"
date: 2025-02-16
description: Cultivate good habits and improve the quality of life!
categories:
- IT

tags:
- Internet
- Mathematics & Computers
- AI
---
# How to understand the chaos of human society?

Processing file

```



