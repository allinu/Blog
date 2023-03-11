---
title: Snort
description: 
cover: https://telegraph-image-aog.pages.dev/file/026a2952f590b2903ec90.png
mathjax: true
tags:
  - 嗅探
categories:
  - 嗅探
abbrlink: 
sticky: 2
swiper_index: 2
keywords: 
date: 2023-03-11 21:25
updated: 2023-03-11 21:25
---

![](https://telegraph-image-aog.pages.dev/file/411311bd5db0283a3e6e5.png)

## 介绍

嗅探是使用工具，对网络中的通信进行监听、感知，对网络中的异常行为进行告警。

## 安装

安装 Snort 比较简单，使用下面的步骤即可安装。

### 安装准备

```shell
sudo apt-get install autoconf automake libtool libffi-dev check
```

### 安装 DAQ

```shell
git clone https://github.com/snort3/libdaq.git

cd libdaq

./bootstrap
./configure && make && sudo make install
```

### 安装 dnet

```shell
git clone https://github.com/ofalk/libdnet.git
cd libdnet
./configure --prefix=/usr/local
make
sudo make install
```

### 安装 Snort

```shell
git clone https://github.com/snort3/snort3.git

cd snort3
sudo ./configure_cmake.sh --prefix=/usr/local

sudo make -j 5
sudo make install

```

### 附加内容

上面的内容执行完毕之后，如果遇到 `libdnet.so.1` 找不到的问题，可以将执行下面的命令

```shell
sudo ln -s /usr/local/lib/libdnet.so.1 /usr/lib/libdnet.so.1
```

下载社区规则

```shell
wget https://www.snort.org/downloads/community/snort3-community-rules.tar.gz

sudo mkdir /var/log/snort
sudo mkdir /usr/local/etc/rules

sudo tar xzf snort3-community-rules.tar.gz -C /usr/local/etc/rules/

```

修改 Snort 的配置文件 `/usr/local/etc/snort/snort.lua`

```lua
ips.include = '/usr/local/etc/rules/snort3-community-rules/snort3-community.rules'
```

## 使用

### 普通用户使用（存在权限问题）

```
┌──(liona㉿kali)-[~]
└─$ snort -c /usr/local/etc/snort/snort.lua
--------------------------------------------------
o")~   Snort++ 3.1.56.0
--------------------------------------------------
Loading /usr/local/etc/snort/snort.lua:
Loading snort_defaults.lua:
Finished snort_defaults.lua:
	output
	active
	alerts
	daq
	decode
	host_cache
	host_tracker
	hosts
	network
	packets
	process
	search_engine
	stream_icmp
	stream_tcp
	stream_udp
	trace
	ips
	classifications
	references
	binder
	wizard
	appid
	js_norm
	file_policy
	file_id
	http2_inspect
	http_inspect
	ftp_data
	ftp_client
	ftp_server
	smtp
	gtp_inspect
	dce_http_proxy
	dce_tcp
	s7commplus
	mms
	dnp3
	cip
	sip
	stream_ip
	stream
	so_proxy
	stream_user
	stream_file
	arp_spoof
	back_orifice
	dns
	imap
	netflow
	normalizer
	pop
	rpc_decode
	ssh
	ssl
	telnet
	iec104
	modbus
	dce_smb
	dce_udp
	dce_http_server
	port_scan
Finished /usr/local/etc/snort/snort.lua:
Loading file_id.rules_file:
Loading file_magic.rules:
Finished file_magic.rules:
Finished file_id.rules_file:
Loading /usr/local/etc/rules/snort3-community-rules/snort3-community.rules:
Finished /usr/local/etc/rules/snort3-community-rules/snort3-community.rules:
--------------------------------------------------
ips policies rule stats
              id  loaded  shared enabled    file
               0    4239       0    4239    /usr/local/etc/snort/snort.lua
--------------------------------------------------
rule counts
       total rules loaded: 4239
               text rules: 4239
            option chains: 4239
            chain headers: 287
                 flowbits: 48
     flowbits not checked: 23
--------------------------------------------------
port rule counts
             tcp     udp    icmp      ip
     any     473      58     147      22
     src     177      17       0       0
     dst     787     154       0       0
    both       6      11       0       0
   total    1443     240     147      22
--------------------------------------------------
service rule counts          to-srv  to-cli
                   dcerpc:        7       4
                     dhcp:        2       2
                      dns:       28       7
                  file_id:      208     208
                      ftp:       90       4
                 ftp-data:        1      97
                     http:     2082     256
                    http2:     2082     256
                    http3:     2082     256
                     imap:       35     118
                      irc:        5       2
                 kerberos:        7       0
                     ldap:        0       1
                    mysql:        3       0
              netbios-dgm:        1       1
               netbios-ns:        4       3
              netbios-ssn:       73      17
                     nntp:        2       0
                     pop3:       23     118
                      rdp:        5       0
                      sip:        5       5
                     smtp:      130       2
                     snmp:       18       7
                     ssdp:        3       0
                      ssl:       20      42
                   sunrpc:       68       4
                   telnet:       12       6
                     tftp:        1       0
                     wins:        1       0
                    total:     6998    1416
--------------------------------------------------
fast pattern groups
                      src: 118
                      dst: 316
                      any: 8
                to_server: 71
                to_client: 48
--------------------------------------------------
search engine (ac_bnfa)
                instances: 340
                 patterns: 10724
            pattern chars: 174587
               num states: 122936
         num match states: 10484
             memory scale: MB
             total memory: 3.67728
           pattern memory: 0.575263
        match list memory: 1.3313
        transition memory: 1.72921
        fast pattern only: 7107
--------------------------------------------------
pcap DAQ configured to passive.

Snort successfully validated the configuration (with 0 warnings).

```

所以要使用 `sudo` 运行

### 自定义规则

创建文件 `/usr/local/etc/rules/local.rules`

内容如下

```
alert icmp any any -> $HOME_NET any (msg:"[警告]检测到 ICMP connection 请及时处理"; sid:1000001; rev:1;)
```

运行 Snort

```shell
sudo snort -c /usr/local/etc/snort/snort.lua -R /usr/local/etc/rules/local.rules -i eth0 -A alert_fast -s 65535 -k none
```

![image.png](https://telegraph-image-aog.pages.dev/file/1c8e66028152390fa3f2a.png)

## 原理

[[TODO]]


## 总结

[[TODO]]

## 参考

- [如何在 Kali 下安装 snort_kali 安装 snort\_不想掉头发啊！！的博客-CSDN 博客](https://blog.csdn.net/weixin_45150813/article/details/117719084)
- [autoreconf: not found\_天已青色等烟雨来的博客-CSDN 博客](https://blog.csdn.net/x356982611/article/details/70856470)
- [snort 安装--daq，dnet---ERROR! dnet header not found, go get it from...等错误解决方案 - lcamry - 博客园](https://www.cnblogs.com/lcamry/p/6339475.html)
- [snort3.0-kali 64 入侵检测安装与使用 - 知乎](https://zhuanlan.zhihu.com/p/580586588)
- [Snort 安装（Kali 上源码安装） - 简书](https://www.jianshu.com/p/d786fa0156f2)
- [认识 Snort3 （1）：编译、安装与简单使用 - ObjectNotFound 博客 | 主站](https://www.zhouweitong.site/post/010-snort-1-intro/)
- [./configure failed due missing lib "Check" · Issue #23 · bombadil/mod_proxy_msrpc · GitHub](https://github.com/bombadil/mod_proxy_msrpc/issues/23)
- [pkg_config_path 环境变量设置 教程 - LiuYanYGZ - 博客园](https://www.cnblogs.com/LiuYanYGZ/p/14198977.html)