---
title: "配置 gcloud 环境变量"
date: 2023-02-16
description:
categories:
  - IT
tags:
  - Math & CS
  - AI
  - Remote Jobs
---


本文件描述了几种配置python程序所需gcloud 环境变量的方法。

# 方案 2：在 Shell 启动文件中配置（推荐用于本地开发）

这种方法可以持久地为你的用户设置环境变量。每次打开新的终端时，这些变量都会被设置。

添加 export 命令: 在文件末尾，通常在其他 export 命令之后，添加你的环境变量配置:

**Bash (`.bashrc` 或 `.bash_profile`)：**

```bash
export GOOGLE_CLOUD_PROJECT="your-project-id"
export GOOGLE_CLOUD_REGION="your-region"  # 例如：europe-west3
export GOOGLE_APPLICATION_CREDENTIALS="/path/to/your/credentials.json"
```

编辑文件后，重新启动终端或使用 source 命令使更改生效：

` source ~/.bashrc  # 或 .bash_profile 或 .zshrc `


若项目运行于python .venv虚拟环境中，没有全局配置gcloud环境变量的需求，那么配置在虚拟环境中，通常在 venv/bin/activate。

请编辑激活activate脚本，增加以上bash中相同的export脚本。


# 方案 3：使用 gcloud 的 application-default 登录（便于使用默认的 gcloud 配置）

如果你已经使用 gcloud auth application-default login 配置了 gcloud ，其中包含你的项目和凭据，则你的脚本可以自动获取这些凭据。这很方便，尤其当你已经大量使用 gcloud CLI 时，因为它避免了显式设置环境变量。 然而，它不如方案 2 明确，并且需要确保你的默认项目设置正确。

```zsh
gcloud config set project your-project-id
gcloud auth application-default login
```

然后，在你的 Python 代码中，使用 google.auth.default() 获取凭据：

```python
import google.auth

credentials, project_id = google.auth.default()
aiplatform.init(project=project_id, location=LOCATION, credentials=credentials)

```


# 方案 4：Workload Identity Federation (WIF - 推荐用于生产环境，尤其是在 Kubernetes 中)

WIF 的主要优势在于它增强了安全性，因为它避免了下载和存储服务帐户密钥文件。这些密钥文件如果管理不当，可能会带来安全风险。 WIF 允许你的应用程序直接向 Google Cloud 服务进行身份验证，而无需下载和存储密钥文件。 此外，Google 会自动处理密钥轮换，进一步增强了安全性，无需担心密钥过期或手动轮换密钥。

WIF 特别适合在 Kubernetes 等容器化环境中使用。 在 Kubernetes 中，你可以将 Kubernetes 服务帐户链接到 Google Cloud IAM 角色。 这允许你的 Pod 在不使用服务帐户密钥的情况下访问 Google Cloud 服务。


# 总结: 选择哪种方法？

选择最适合你的需求和环境的方法。

- 方案 2 (Shell 启动文件):
推荐用于本地开发，使用 shell 启动文件通常足够了，它在便捷性和安全性之间提供了良好的平衡。每次打开新终端时，变量都会自动设置。对于快速测试，直接在 shell 中设置变量是最快的选择，


- 方案 3 ( gcloud application-default login ):
如果你已经大量使用 gcloud CLI，则此方法很方便，它避免了显式设置环境变量，是一种便捷的本地开发中间方案，但不如方案 2 明确。


- 方案 4 (WIF - Kubernetes )：
对于生产环境，尤其是在 Kubernetes 中，强烈建议使用 Workload Identity Federation (WIF)，因为它完全消除了管理服务帐户密钥文件的需求，提供了最佳的安全性、更便捷的密钥管理和更好的自动化。

重要提示：永远不要将你的凭据直接硬编码到脚本中，从而提高安全性。
