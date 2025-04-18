---
title: "AI辅助编程 - Deepseek"
date: 2025-02-18
description:
categories:
  - IT
tags:
  - 互联网
  - 数学&计算机
  - AI
---

截止目前，据网络评论认为 Deepseek-R1、DeepSeek V3 是最好的开源AI辅助编程模型，开源不限于个人和商业使用场景。

[DeepSeek各版本说明与优缺点分析_deepseek各版本区别](https://deepseek.csdn.net/67ab1ec879aaf67875cb9c2d.html#devmenu1)

[DeepSeek剖析：与国际知名 AI 模型的全方位对比](https://deepseek.csdn.net/67ab1c5f79aaf67875cb96ac.html)

[AI辅助编程：Cursor与DeepSeek Coder的巅峰对决](https://www.51cto.com/article/805393.html)

但是最近Deepseek放出一条消息：Due to current server resource constraints, we have temporarily suspended API service recharges to prevent any potential impact on your operations. Existing balances can still be used for calls. We appreciate your understanding!

可能它最近太火爆了，结果流量太大，没有接住，服务器资源不够，于是被限制使用，业务多到接不过来。

# 安装使用方案

## 在线使用

依赖网络实时连接

[VSCode+Cline+DeepSeek-V3](https://www.cnblogs.com/GeekerJun/p/18706922)

[Cursor+DeepSeek](https://zhuanlan.zhihu.com/p/20937708204)

[DeepSeek Coder](https://deepseekcoder.github.io/)

## 最简单使用方法

- IDE [trae](https://www.trae.ai)海外版，其中内置了满血版 DeepSeek R1、V3、claude等目前业内最好的数学和编程模型，关键是免费，财大气粗的字节跳动开发的，截止2025年3月，只有英文和日文版，得到好评。

[中文版](https://www.trae.com.cn/ )发布迟于海外版，面向中国大陆用户，奇怪的是被网友吐槽很多。

- IDE [Vscode](https://code.visualstudio.com/)+ [Cody](https://sourcegraph.com/cody) + [Claude](https://claude.ai/)
截止2025年3月，个人用户月费9欧元，大多数时候都蛮好用，偶尔抽筋宕机，通常也是资源不够用的缘故，可能是小团队小成本制作。

## 离线使用

本地部署，搭建本地私有知识库

[llama+Deepseek](https://deepseek.csdn.net/67ab1f1379aaf67875cb9cd8.html)

满血版的硬件配置要求太高，选择蒸馏版虽然能在个人电脑上跑，但是性能弱鸡，参考：
[盘点本地部署满血deepseek-r1的各种硬件配置方案](https://zhuanlan.zhihu.com/p/23820116677)

所以，最好的方案还是付费寻找就近的云计算资源，例如通过Megaease部署满血版deepseek到最近的裸机上，关键问题是，我一个人用不完，如何将一台机器的资源分享给其他人，也就是多余的计算资源卖掉。
