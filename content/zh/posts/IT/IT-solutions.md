---
title: "IT 小工具"
date: 2019-01-13
description: 
categories:
  - IT
tags:
  - 互联网
  - 远程工作
  - AI
---

经过很多不同用户试用后的测评推荐

# 翻译方案

## 谷歌翻译插件

参考 [弗拉基米尔·梅格雷](https://vmegre.com/)，由于缺乏对这个技术的研究，以下是我目前我的初步判断。

可能网页原文只有一种俄语版，在网页的语言列表上，通过调用谷歌的某个翻译插件，直接将网页翻译成对应的目标语言。要求联网才能调用谷歌翻译，有几个缺陷：因为是免费的谷歌服务，翻译质量并不高，而且搜索引擎不会抓取其他语言版本的网页，所以除了原文的俄语或英语，其他语言版本的内容在网络上搜不到。

## 调用API翻译

也就是调用例如谷歌Google Vertex AI studio 中的 api，将源语言文件翻译成多种目标语言的文件，然后通过web app的网页发布，符合markdown或xml等格式的规范，对搜索引擎很友好，这是最佳方案，但是稍微更费时费力。



# 图形处理

个人图片转换成卡通风格头像

## 传统ai

可以看到生成的头像与真人偏差太大，以至于无法识别

[ailab.wondershare](https://ailab.wondershare.com/app/general/features/image)

[imagetocartoon](https://imagetocartoon.com/)

## 最新ai

[midjourney](https://docs.midjourney.com/)

[nick-yee-avatar-midjourney](https://nwn.blogs.com/nwn/2022/11/nick-yee-avatar-midjourney.html)

找机器人干活的口令格式，例如

/imagine <image link> fantasy-hunter-warrior

/imagine <image link> futuristic-cyberpunk-hacker

/imagine <image link> captain-america



# 其他

## 批量删除yt的播放列表watch later

[https://www.alphr.com/delete-all-watch-later-videos-youtube/](https://www.alphr.com/delete-all-watch-later-videos-youtube/)

yt限制了批量操作，需要一个小脚本在开发者模式下代替人手自动执行。注意：
先在url后加上&disable_polymer=true，进入旧版yt，然后使用脚本有效。

## Chrome内核浏览器直接获取网页视频地址下载的方法

[http://www.softs8.com/jiaocheng/48.html](http://www.softs8.com/jiaocheng/48.html)

当一切浏览器插件都不管用，在线视频下载也无效的时候，对于流媒体，搜下面这个插件

