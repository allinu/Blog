---
title: Kali 安装 Parallels Tools
description: 
mathjax: true
cover: https://images.unsplash.com/photo-1651911840020-7d41535dcf88?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwzNjM5Nzd8MHwxfHJhbmRvbXx8fHx8fHx8fDE2NzgzODE3NzE&ixlib=rb-4.0.3&q=80&w=1920&h=1080
tags:
  - Kali
categories:
  - Kali
abbrlink: 
sticky: 2
swiper_index: 2
keywords: 
date: 2023-03-01 15:09
updated: 2023-03-02 00:37
---

    系统版本：Linux kali 6.0.0-kali3-arm64 #1 SMP Debian 6.0.7-1kali1 (2022-11-07) aarch64 GNU/Linux
    撰写时间：2023年03月01日 15:31
    更新时间：2023年03月01日 15:31
    PD 版本：18.2.0

## 挂载 Parallels Tools

通过菜单栏的标签对`Parallels Tools`镜像进行挂载

![image.png](https://telegraph-image-aog.pages.dev/file/cb86dc72b9d1622059992.png)

会有弹窗 点击挂载并打开

![image.png](https://telegraph-image-aog.pages.dev/file/327b8467200da696f7f0a.png)

## 尝试安装

在打开的窗口全选文件和目录，拷贝到`~/Downloads/`目录下（这里随意，拷贝到 kali 目录）
在终端打开拷贝后文件所在目录

![image.png](https://telegraph-image-aog.pages.dev/file/1bb9d682dece9f820cc2a.png)

使用`sudo ./install`命令尝试运行安装程序【需要输入密码】

![image.png](https://telegraph-image-aog.pages.dev/file/9331408ef6074d8f851e8.png)

敲击回车

![image.png](https://telegraph-image-aog.pages.dev/file/4e0466cd46878f2b957ff.png)

敲击回车

![image.png](https://telegraph-image-aog.pages.dev/file/d0f3fb56c522509e2b3fc.png)

敲击回车

![image.png](https://telegraph-image-aog.pages.dev/file/d24ddbeeb36ad6ff56dcb.png)

![image.png](https://telegraph-image-aog.pages.dev/file/736c7d13b608e2152b658.png)

安装成功。

---

旧版本安装最新的 Kali Linux 存在问题，有些模块安装不上

- linux-headers-6.0.0-kali3-arm64
- dkms
- libelf-dev
- printer-driver-postscript-hp

在晚上尝试了各种办法，由于我的电脑是 M1 的芯片，总是有些错误。所以我尝试了更新 PD 软件本身，最终问题解决了，如果安装不上，可以参考下面的文章。

- [kali 安装 pd tools_pd 安装 kali_12306Br0 的博客-CSDN 博客](https://blog.csdn.net/qq_36334464/article/details/126236837)
- [Unable to reinstall parallels tools on Debian Bullseye | Parallels Forums](https://forum.parallels.com/threads/unable-to-reinstall-parallels-tools-on-debian-bullseye.349865/#post-866677)
