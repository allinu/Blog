---
title: Kali 更换国内源
description: 
cover: https://images.unsplash.com/photo-1587395163541-4b1e914b9d14?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwzNjM5Nzd8MHwxfHJhbmRvbXx8fHx8fHx8fDE2Nzg4ODU1NTI&ixlib=rb-4.0.3&q=80&w=1920&h=1080
mathjax: true
tags:
  - 笔记
  - Kali
categories:
  - Kali
abbrlink: 
swiper_index: 2
keywords: 
date: 2023-03-01 15:44
updated: 2023-03-15 21:05
---

## 清华

````shell
sudo sed -i "s@http://http.kali.org@https://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list
````

## 中科大

```shell
deb https://mirrors.ustc.edu.cn/kali kali-rolling main non-free contrib
deb-src https://mirrors.ustc.edu.cn/kali kali-rolling main non-free contrib
```