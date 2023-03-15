---
title: Github 配置 GPG 签名
description: 
cover: https://images.unsplash.com/photo-1518976224508-8119c10fabad?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwzNjM5Nzd8MHwxfHJhbmRvbXx8fHx8fHx8fDE2Nzg4ODU0ODg&ixlib=rb-4.0.3&q=80&w=1920&h=1080
mathjax: true
tags:
  - 笔记
  - 运维
categories:
  - 运维
abbrlink: 
swiper_index: 2
keywords: 
date: 2023-03-11 15:38
updated: 2023-03-15 21:04
---



设置完GPG签名就可以达到下面的显示效果了，就是会显示 **Verified**

![Untitled.png](https://telegraph-image-aog.pages.dev/file/e008f1824aad37857ed2c.png)


# Mac

## 安装 GPG 软件

```bash
brew install gpg
brew install pinentry-mac
```

## 设定图像化认证

```bash
# 先查看程序路径
which pinentry-mac
# 这里我的是 /opt/homebrew/bin/pinentry-mac 所以下面的内容要根据你的情况设置
echo "pinentry-program /opt/homebrew/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf
# 关闭并重启 签名服务
killall gpg-agent
```

## 生成签名密钥

```bash
gpg --full-generate-key

# 然后一步一步执行 填写你的信息
```

## 查看密钥列表

```bash
gpg --list-secret-keys --keyid-format LONG

# 输出中着重注意 第二行 全部大写的那部分 那部分就是 密钥 ID
```

## 导出公钥

```bash
gpg --armor --export #[你的密钥ID]
```

## 设置 Git 签名提交

```bash
git config --global user.signingkey #[密钥ID]
git config --global commit.gpgsign true

# 之后提交使用 git commit -S 进行签名
# 我第一次是这样的，会提示保存到钥匙链 然后第二次就可以自动签名了
```

## 配置Github

将上面导出的公钥填写到GitHub，点击下面的链接然后填写到 `GPG keys` 的位置

[https://github.com/settings/keys](https://github.com/settings/keys)

## 完毕

然后就可以找个小项目测试一下了

# 参考链接

- [Managing commit signature verification - GitHub Docs](https://docs.github.com/cn/authentication/managing-commit-signature-verification)
- [在Mac上使用GPG签名提交Git · 空](https://blog.shiyunjin.com/2019/10/17/git-gpg-mac/)