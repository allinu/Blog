---
title: Docker
description: 
mathjax: true
cover: https://images.unsplash.com/photo-1651911840020-7d41535dcf88?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwzNjM5Nzd8MHwxfHJhbmRvbXx8fHx8fHx8fDE2NzgzODE3NzE&ixlib=rb-4.0.3&q=80&w=1920&h=1080
tags:
  - 运维
categories:
  - 运维
abbrlink: 
sticky: 2
swiper_index: 2
keywords: Docker
date: 2023-02-18 14:04
updated: 2023-03-02 09:32
---

#运维 #Docker

## Dokcer 权限不够【普通用户运行 Docker】

如果你想以非 root 用户身份运行 docker，那么你需要将其加入 docker 组。

1.  如果 docker 组不存在，则创建该组。

```bash
sudo groupadd docker
```

2.  将你的用户添加到 docker 组。

```bash
sudo usermod -aG docker $USER
```

3.  登录到新的 "docker "组（为了避免退出时再次登录；但如果不够，尝试重新启动）

```bash
newgrp docker
```

4.  检查 docker 是否可以在没有 root 权限的情况下运行

```bash
docker run hello-world
```

如果仍然有错误，请重新启动

```bash
reboot
```

**Warning**

> docker 组授予相当于 root 用户的权限。关于这对系统安全的影响的细节，见  [Docker Daemon Attack Surface.](https://docs.docker.com/engine/security/#docker-daemon-attack-surface).

摘自 docker 官方文档。 [manage-docker-as-a-non-root-user](https://docs.docker.com/install/linux/linux-postinstall/#manage-docker-as-a-non-root-user)
