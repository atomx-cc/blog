---
title: "Customize Hugo site with theme PaperMod"
date: 2023-02-05
description: 
categories:
  - IT
tags:
  - Math & CS
  - AI
  - Remote Jobs
---


[Build Hugo site with theme PaperMod](https://themes.gohugo.io/themes/hugo-papermod/)

# Special Functions and Extensions

## Math Typesetting

Mathematical notation in a Hugo project can be enabled by using third party JavaScript libraries - [KaTeX](https://katex.org)

1.  create the math partial file:
```bash
touch layouts/partials/math.html
```
add below content to math.html
```html
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.16.8/dist/katex.min.css">
<script defer src="https://cdn.jsdelivr.net/npm/katex@0.16.8/dist/katex.min.js"></script>
<script defer src="https://cdn.jsdelivr.net/npm/katex@0.16.8/dist/contrib/auto-render.min.js" onload="renderMathInElement(document.body);"></script>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        renderMathInElement(document.body, {
            delimiters: [
                {left: '$$', right: '$$', display: true},
                {left: '$', right: '$', display: false},
                {left: '\\(', right: '\\)', display: false},
                {left: '\\[', right: '\\]', display: true}
            ],
            throwOnError : false
        });
    });
</script>
```
2. Customize the extend_head.html:
```bash
cp themes/PaperMode/layouts/partials/extend_head.html layouts/partials/extend_head.html
```
insert below content to extend_head.html

```html
{{ if or .Params.math .Site.Params.math }}
{{ partial "math.html" . }}
{{ end }}
```
3. Enable math rendering by adding this to your config.yaml
```yaml
params:
  math: true  # Enable math globally
```


# Config.yaml change

## TOC
change the table of content on the right side colum of webpage, or in the middle top.

## Global config 

it's unnecessary to add too many repeated front matters.

such as "author, TOC " etc.

## Date format in front matter
When you build static webpage, there are error reports such as below. 

``` % hugo serve -D ```

ERROR the "date" front matter field is not a parsable date: see ./hugo-paper/content/zh/cases-business.md

because front matter, We ignore the date format, input example "2006-1-2, 2-1-2006" etc.

Hugo strictly requires YYYY-MM-DD format with leading zeros, such as "2006-01-02".

1. Fix dates using script:

please check up-date-format.sh in my repo.


2. Use VS Code search & replace:

Find: date: (\d{4})-(\d)-(\d)

Replace: date: $1-0$2-0$3



# Deploy webpages on Github Pages

## Option 1, from branch

We compelte all of the jobs locally, then.

Create branch gh-pages(or any other name), sync all documents from ./public/ to root directory ./
of gh-pages.

for convenience, prepare script `deploy.sh`, one click and complete all automatically in local terminal.

## Option 2, from Github Action

Workflow is better solution, execute the program automatically in remote repo.


# Finding Emoji Icons

## Sources for Emoji:
- Copy from Emojipedia: https://emojipedia.org/
- Unicode Emoji List
- System emoji picker

## Steps to Access on Mac:
- Press Command (⌘) + Control + Space
- Opens emoji picker
- Search and select emoji


## Check the structure of directory and files.

in terminal zsh, command line ``tree -L 2 --dirsfirst`` for 2 layers of directories.


## Example Emoji Usage:

` subtitle: "⚡️ Fast | 🚀 Performance | 🌙 Dark Mode | 📱 Responsive" `

## Common Tech Emojis:
⚡️ Lightning: speed/performance
🚀 Rocket: launch/deployment
💻 Laptop: development
🔧 Wrench: tools/config
📱 Mobile: responsive
