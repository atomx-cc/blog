---
title: "Google 翻译模型选择和使用建议"
date: 2025-03-11
description:
categories:
  - IT
tags:
  - 互联网
  - 数学&计算机
  - AI
---

针对批量网页文章翻译，参考说明文档[Translation AI](https://cloud.google.com/translate)

[Cloud Translation API](https://console.cloud.google.com/marketplace/product/google/translate.googleapis.com) 使用 Google 的神经机器翻译技术， Google 预训练的自定义模型或翻译专用大型语言模型 (LLM) 通过 API 动态翻译文本。

它有基础版和高级版，两者都提供快速和动态翻译，但高级版提供自定义功能，例如特定领域的翻译、格式化文档翻译和批量翻译。

每月发送到 API，使用NMT模型处理的前 500,000 个字符（基础版和高级版合计）是免费的（不适用于 LLM）。

# 2种翻译模型

1.  **NMT (神经机器翻译) 模型:**

    *   **`translate_v2`:**  早期版本的 NMT v2模型，**现已弃用，不建议使用**。
    *   **`translate_v3`:** 目前推荐使用的 NMT v3模型，提供比v2更高的翻译质量、更多语言支持和更丰富的功能。可以直接通过 Cloud Translation API 调用。

2.  **Translation LLM (大型语言模型):**

    这是 Google 基于大型语言模型技术的翻译模型，能够更好地理解上下文和生成更流畅自然的译文。尤其适合处理博客文章等复杂文本。

    *   **更高的翻译质量：** Translation LLM 在处理博客文章等复杂文本时表现更出色，因为它在理解上下文和生成流畅译文方面更胜一筹。
    *   **更好的格式保留：** 结合 `mime_type: text/html` 设置，Translation LLM 和 `translate_v3` 都能够更好地保留 Markdown 格式。
    *   **更强大的功能：** Translation LLM 和 `translate_v3` 都支持词汇表等功能，可以帮助您更好地控制翻译结果。


可以通过以下两种方式调用：

## 通过Vertex AI SDK 调用 Translation LLM

1.  **安装 Vertex AI SDK:**  `pip install google-cloud-aiplatform`

2.  **参考官方文档:**  使用 `aiplatform.TranslationModel` 接口调用 Translation LLM 模型进行翻译。更简洁，更易于与其他 Vertex AI 服务集成。

文档地址：[Generative AI - Translate text](https://cloud.google.com/vertex-ai/generative-ai/docs/translate/translate-text) 

3.  **设置 `mime_type: text/html`:** 在 API 请求中将 `mime_type` 设置为 `text/html`，以告诉 API 将 Markdown 视为 HTML，从而更好地保留格式。

4.  **使用词汇表 (可选):** 如果需要控制特定术语或短语的翻译，可以使用 Translation API 的词汇表功能创建自定义词汇表。

## 直接使用 Cloud Translation API 的 `translate_v3`

如果您希望避免使用 Vertex AI SDK，可以直接使用`translate_v3` 调用 Translation LLM 或 NMT 模型。更灵活，可控性更强，提供更多（细粒度）的参数控制。

请参考 Cloud Translation API 的文档：[Translating text (Advanced)- v3](https://cloud.google.com/translate/docs/advanced/translating-text-v3)


**总结:**

Translation LLM 模型是批量博客文章翻译的最佳选择。使用 Vertex AI SDK 调用 Translation LLM，并设置 `mime_type: text/html`，可以帮助您获得高质量的翻译结果，并保留 Markdown 格式。 

`translate_v3`  也支持 Translation LLM 和 NMT 模型，免费并提供更多控制选项。


# 其他模型

**1. Adaptive MT Translation（自适应机器翻译）**

* 自适应机器翻译允许您在不训练新模型的情况下，动态地定制 NMT 翻译。
* 通过提供实时反馈，您可以影响翻译结果，使其更符合您的特定需求和风格。
* 这对于需要特定术语或风格的翻译场景非常有用。
* **使用场景**：
    * 需要使用特定术语或风格的翻译
    * 需要实时调整翻译结果
* **官方文档：**
    * [使用自适应机器翻译](https://cloud.google.com/translate/docs/advanced/adaptive-translation)

**2. AutoML Translation Model（AutoML 翻译模型）**

* AutoML Translation 允许您训练自定义翻译模型，以满足您的特定领域或行业需求。
* 您可以上传自己的翻译数据集，并使用 AutoML Translation 训练针对您的特定内容优化的模型。
* 这对于需要高度专业化或特定领域翻译的场景非常有用。
* **使用场景**：
    * 需要高度专业化或特定领域翻译
    * 需要针对特定内容优化翻译结果
* **官方文档：**
    * [创建自定义翻译模型](https://cloud.google.com/translate/docs/advanced/automl-quickstart)
    * [AutoML Translation Model](https://console.cloud.google.com/translation?hl=zh-cn)
    * [Cloud Translate API- Advanced (v3)- AutoML Model](https://cloud.google.com/translate/docs/advanced/translate-text-advance)


**总结：**

* Adaptive MT Translation 允许您动态定制 NMT 翻译，而无需训练新模型。
* AutoML Translation Model 允许您训练自定义翻译模型，以满足您的特定领域需求。
