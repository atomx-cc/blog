# How to build Hugo site with theme PaperMod

# Config.yaml change

## TOC
change the table of content on the right side colum of webpage, or in the middle top.

## Global config 

it's unnecessary to add too many repeated front matters.

such as "author, TOC " etc.

ignore the date format, accept all formats popular globally, such as "2006-1-2, 2006-01-02, 2-1-2006" etc.


# Deploy webpages on Github Pages

## Option 1, from branch

We compelte all of the jobs locally, then.

Create branch gh-pages(or any other name), sync all documents from ./public/ to root directory ./
of gh-pages.

for convenience, prepare scripture `deploy.sh`, one click and compete all automatically in local terminal.

## Option 2, from Github Action

If you know how to write workflow, Please share your solution.


# Finding Emoji Icons
## Sources for Emoji:
- Copy from Emojipedia: https://emojipedia.org/
- Unicode Emoji List
- System emoji picker

## Steps to Access on Mac:
- Press Command (⌘) + Control + Space
- Opens emoji picker
- Search and select emoji

## Example Emoji Usage:

` subtitle: "⚡️ Fast | 🚀 Performance | 🌙 Dark Mode | 📱 Responsive" `

## Common Tech Emojis:
⚡️ Lightning: speed/performance
🚀 Rocket: launch/deployment
💻 Laptop: development
🔧 Wrench: tools/config
📱 Mobile: responsive
