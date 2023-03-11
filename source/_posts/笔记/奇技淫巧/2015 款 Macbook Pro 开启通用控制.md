---
title: 2015 款Macbook Pro开启通用控制
description: 
cover: https://images.unsplash.com/photo-1651911840020-7d41535dcf88?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwzNjM5Nzd8MHwxfHJhbmRvbXx8fHx8fHx8fDE2NzgzODE3NzE&ixlib=rb-4.0.3&q=80&w=1920&h=1080
mathjax: true
tags:
  - 奇技淫巧
categories:
  - 奇技淫巧
abbrlink: 
sticky: 2
swiper_index: 2
keywords: 
  - Mac
  - 通用控制
date: 2023-02-26 20:24
updated: 2023-03-02 09:40
---

Mac OS 下载：[如何下载 macOS - 官方 Apple 支持 (中国)](https://support.apple.com/zh-cn/HT211683)
Mac OS 制作引导启动工具：[创建可引导的 macOS 安装器 - 官方 Apple 支持 (中国)](https://support.apple.com/zh-cn/HT201372)

<font color="#e36c09">**其他型号的电脑，根据实际情况可以参考进行**</font>

![image.png](https://bafybeidehkscdifczb75fd5iqel4jli2jeotp76nxefce5i3lz5verjl4q.ipfs.nftstorage.link)

1. 下载并安装 [dortania](https://github.com/dortania)/**[OpenCore-Legacy-Patcher](https://github.com/dortania/OpenCore-Legacy-Patcher)**
2. 点击设置

   ![image.png](https://bafkreie2mtf57lgyo7ymtbifojxtkz2jeznydvrb7wikm5wqxindnmz67y.ipfs.nftstorage.link)

3. 点击 `SMBIOS settings`

   ![image.png](https://bafkreig55why72bfq43gkl6eo53jqcrvhk2p2zd7gdiiyaqugyxnujpbzy.ipfs.nftstorage.link)

4. 按照下图依次设置，下面的`Allow Native Spoofs` 要记得勾选

   ![image.png](https://bafkreifdfu6nsufcyugkzyc73i5boms442o5yjfwgww2kzgc57l3n4w4oe.ipfs.nftstorage.link)

5. 回到上级按照下图配置，配置完后，点击 `Return to Main Menu`反回上级

   ![image.png](https://bafkreicvxsx67iggvssv66srnq6tgkxrbned7jtjebbxitbcss4nglfhk4.ipfs.nftstorage.link)

6. 点击`Build amd Install OpenCore`

   ![image.png](https://bafkreidlzdszng6hyooy7qdwes2uh3lx5eduhgewfhpytzz36ytccb3fvu.ipfs.nftstorage.link)

7. 然后出现下面的页面，按照提示，`Install to disk`

   ![image.png](https://bafybeibh6r3mxrfbfxb5rv6vt6acb5ys465brk6x43gfnqpopevpefynfi.ipfs.nftstorage.link)

8. 选择目标硬盘

   ![image.png](https://bafkreie4gcccq3otbetiywvtzh7lgbmvo5zck6tdmhgkuke4yqfh73rp4m.ipfs.nftstorage.link)

9. 选择目标分区

   ![image.png](https://bafkreihscwgre2rxwrfs4cgvpcy6rw5eelsc4licplt3aoj3c3lgejlkzy.ipfs.nftstorage.link)

10. 输入本地用户密码允许操作即可

    ![image.png](https://bafybeigkvqne2flphccmv53czdw44inhccfnpf5uyl2unqk4tloadxvqfm.ipfs.nftstorage.link)

11. 然后根据提示重启电脑，重启完毕后，进入设置的 icloud 账户会提示输入密码，重新输入**apple ID 的密码**，而后在设置中的

    ![未命名.png](https://bafybeihkuiv3cxhet6ly4vjuiywvebacmc3cs2xvgb5w5je75gvcla74mm.ipfs.nftstorage.link)

12. 然后输入完密码后重启电脑，电脑重启后再打开设置 -> 通用，确保`接力`是开启的状态，然后点击显示器，即可看到`通用控制`，确保三个选项都是打开状态

    ![未命名3.png](https://bafybeigjbamr3ovlo5nuiod3rzywdttvpane6prp2vulai2m3k2nugeuoa.ipfs.nftstorage.link)
    ![iShot_2023-02-27_21.12.08.jpg](https://bafkreif34am4lenbdozyblrta5n4a3pqjbvqyztl6kkhgjrjpo5dnketbm.ipfs.nftstorage.link)
    ![未命名1.png](https://bafybeigddd2iyt4nlcjkrka2t6at55oljeqakmiqe64c7lcl2s7o7jyclq.ipfs.nftstorage.link)
    ![iShot_2023-02-27_21.13.05.jpg](https://bafkreicwgbc52bf4mhrvyahebpbi6gqdze6vjjny7vnwqhpeoxgumacv5q.ipfs.nftstorage.link)

### 参考内容

- https://github.com/dortania/OpenCore-Legacy-Patcher/issues/948
- ![image.png](https://bafybeihn6ktjelkdd72rxwnv3cyh3pucee6dhuno7qiy6i5vigjpwg33de.ipfs.nftstorage.link)
- [如何下载 macOS - 官方 Apple 支持 (中国)](https://support.apple.com/zh-cn/HT211683)
- [创建可引导的 macOS 安装器 - 官方 Apple 支持 (中国)](https://support.apple.com/zh-cn/HT201372)