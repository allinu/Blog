---
title: Nmap
description: 
cover: https://images.unsplash.com/photo-1625404523742-0b2c1e82c869?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwzNjM5Nzd8MHwxfHJhbmRvbXx8fHx8fHx8fDE2Nzg4ODU1MTU&ixlib=rb-4.0.3&q=80&w=1920&h=1080
mathjax: true
tags:
  - 笔记
  - Kali
  - 工具
categories:
  - Kali
abbrlink: 
swiper_index: 2
keywords: 
date: 2023-03-11 02:23
updated: 2023-03-15 21:05
---


## 介绍

Nmap 是较为知名的信息收集工具，主要用于端口扫描，在 kali 的工具集中使用的频率很高，zenmap 是 nmap 的 GUI 工具，功能与 nmap 本身无异，Nmap 程序代码开放在 Github 网站上，使用 C、Python 等编程语言编写，项目地址为：[nmap · GitHub](https://github.com/nmap/)，官网地址为：[Nmap: the Network Mapper - Free Security Scanner](https://nmap.org)

## 使用

### 扫描开放端口

```shell
sudo nmap -n -v -sS -p- -Pn --max-retries=0 -oN allports.txt 192.168.1.1
```

```
# Nmap 7.93 scan initiated Sat Mar 11 20:52:07 2023 as: nmap -n -v -sS -p- -Pn --max-retries=0 -oN allports.txt 192.168.1.1
Warning: 192.168.1.1 giving up on port because retransmission cap hit (0).
Nmap scan report for 192.168.1.1
Host is up (0.016s latency).
Not shown: 65523 closed tcp ports (reset)
PORT      STATE    SERVICE
21/tcp    open     ftp
23/tcp    filtered telnet
80/tcp    open     http
139/tcp   filtered netbios-ssn
443/tcp   filtered https
445/tcp   open     microsoft-ds
8080/tcp  open     http-proxy
17998/tcp open     unknown
17999/tcp open     unknown
32768/tcp open     filenet-tms
52869/tcp open     unknown
58000/tcp filtered unknown
MAC Address: 98:9A:B9:08:CE:10 (zte)

Read data files from: /usr/bin/../share/nmap
# Nmap done at Sat Mar 11 20:52:28 2023 -- 1 IP address (1 host up) scanned in 20.34 seconds
```

### 扫描端口的详细信息

```shell
sudo nmap -n -v -sC -sV -p $(cat allports.txt | grep ^[0-9] | cut -d / -f1 | tr '\n' ',' | sed s/,$//) 10.10.10.3 -oN nmap.txt -oX nmap.xml -Pn
```

```
# Nmap 7.93 scan initiated Sat Mar 11 20:53:57 2023 as: nmap -n -v -sC -sV -p 21,23,80,139,443,445,8080,17998,17999,32768,52869,58000 -oN nmap.txt -oX nmap.xml -Pn 192.168.1.1
Nmap scan report for 192.168.1.1
Host is up (0.0078s latency).

PORT      STATE    SERVICE      VERSION
21/tcp    open     ftp          vsftpd 2.0.8 or later
23/tcp    filtered telnet
80/tcp    open     http
| http-methods:
|_  Supported Methods: GET HEAD POST OPTIONS
| fingerprint-strings:
|   GetRequest, HTTPOptions:
|     HTTP/1.0 200 OK
|     Connection: close
|     ETag: "276-355-5fae3487"
|     Last-Modified: Fri, 13 Nov 2020 07:23:51 GMT
|     Date: Sat, 11 Mar 2023 12:54:04 GMT
|     X-Frame-Options: SAMEORIGIN
|     Content-Type: text/html
|     Content-Length: 853
|     <!DOCTYPE html>
|     <html>
|     <head>
|     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
|     <meta http-equiv="X-UA-Compatible" content="IE=Edge">
|     <meta HTTP-EQUIV="pragma" CONTENT="no-cache">
|     <meta HTTP-EQUIV="Cache-Control" CONTENT="no-store, must-revalidate">
|     <meta HTTP-EQUIV="expires" CONTENT="0">
|     <title>
|     </title>
|     </head>
|     <body>
|     <form id="argform" method="post" action="/cgi-bin/luci">
|     <input type="hidden" name="token" value="hgdetrsafdasfw3egfsgfd" />
|     <script>
|     ((location.host.indexOf(":") != -1) && (location.host[0] != "["))
|     hosturl = "[" + location.host + "]";
|     else
|     hosturl = location.host;
|_    document.ge
|_http-title: \xE4\xB8\xAD\xE5\x9B\xBD\xE7\x94\xB5\xE4\xBF\xA1\xE6\x99\xBA\xE8\x83\xBD\xE7\xBD\x91\xE5\x85\xB3
139/tcp   filtered netbios-ssn
443/tcp   filtered https
445/tcp   open     netbios-ssn  Samba smbd 3.X - 4.X (workgroup: WORKGROUP)
8080/tcp  open     http-proxy
|_http-server-header: <empty>
| fingerprint-strings:
|   GetRequest:
|     HTTP/1.0 200 OK
|     Server:
|     Accept-Ranges: bytes
|     Connection: close
|     Content-Type: text/html; charset=gb2312
|     Cache-Control: no-cache,no-store
|     Pragma: no-cache
|     Content-Length: 9055
|     X-Frame-Options: SAMEORIGIN
|     X-Content-Type-Options: nosniff
|     X-XSS-Protection: 1; mode=block
|     Content-Security-Policy: frame-ancestors 'self'
|     <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml">
|     <head>
|     <META HTTP-EQUIV="pragma" CONTENT="no-cache">
|     <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
|     <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
|     <title>ZXHN F610GV9</title>
|     <LINK REL="stylesheet" HREF="css/login.css" TYPE="text/css" />
|     <LINK REL="stylesheet" HREF="css/stylech.css" TYPE="text/css" />
|     <link rel="stylesheet" href="css/Utilisateur.css" />
|   HTTPOptions:
|     HTTP/1.1 400 Bad Request
|     Server:
|     Accept-Ranges: bytes
|     Connection: close
|     Content-Type: text/html; charset=gb2312
|     Cache-Control: no-cache,no-store
|     Pragma: no-cache
|     <HTML>
|     <HEAD><TITLE>400 Bad Request</TITLE></HEAD>
|     <BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#2020ff" VLINK="#4040cc">
|     <H2>400 Bad Request</H2>
|     Your request has bad syntax or is inherently impossible to satisfy.
|     <HR>
|     <ADDRESS><A HREF="http://www.zte.com.cn"></A></ADDRESS>
|     </BODY>
|_    </HTML>
| http-methods:
|_  Supported Methods: GET POST
|_http-title: Did not follow redirect to http://192.168.1.1
17998/tcp open     unknown
17999/tcp open     unknown
| fingerprint-strings:
|   Kerberos, SMBProgNeg:
|_    {"Result":-1,"ID":0}
32768/tcp open     filenet-tms?
52869/tcp open     upnp         Portable SDK for UPnP devices 1.6.18 (UPnP 1.0)
58000/tcp filtered unknown
3 services unrecognized despite returning data. If you know the service/version, please submit the following fingerprints at https://nmap.org/cgi-bin/submit.cgi?new-service :
==============NEXT SERVICE FINGERPRINT (SUBMIT INDIVIDUALLY)==============
SF-Port80-TCP:V=7.93%I=7%D=3/11%Time=640C79EC%P=aarch64-unknown-linux-gnu%
SF:r(GetRequest,433,"HTTP/1\.0\x20200\x20OK\r\nConnection:\x20close\r\nETa
SF:g:\x20\"276-355-5fae3487\"\r\nLast-Modified:\x20Fri,\x2013\x20Nov\x2020
SF:20\x2007:23:51\x20GMT\r\nDate:\x20Sat,\x2011\x20Mar\x202023\x2012:54:04
SF:\x20GMT\r\nX-Frame-Options:\x20SAMEORIGIN\r\nContent-Type:\x20text/html
SF:\r\nContent-Length:\x20853\r\n\r\n<!DOCTYPE\x20html>\n<html>\n<head>\n<
SF:meta\x20http-equiv=\"Content-Type\"\x20content=\"text/html;\x20charset=
SF:UTF-8\"\x20/>\n<meta\x20http-equiv=\"X-UA-Compatible\"\x20content=\"IE=
SF:Edge\">\n<meta\x20HTTP-EQUIV=\"pragma\"\x20CONTENT=\"no-cache\">\n<meta
SF:\x20HTTP-EQUIV=\"Cache-Control\"\x20CONTENT=\"no-store,\x20must-revalid
SF:ate\">\n<meta\x20HTTP-EQUIV=\"expires\"\x20CONTENT=\"0\">\x20\n<title>\
SF:xe4\xb8\xad\xe5\x9b\xbd\xe7\x94\xb5\xe4\xbf\xa1\xe6\x99\xba\xe8\x83\xbd
SF:\xe7\xbd\x91\xe5\x85\xb3</title>\n\n</head>\n<body>\n\t<form\x20id=\"ar
SF:gform\"\x20method=\"post\"\x20action=\"/cgi-bin/luci\">\n\t\t<input\x20
SF:type=\"hidden\"\x20name=\"token\"\x20value=\"hgdetrsafdasfw3egfsgfd\"\x
SF:20/>\n\t\t<script>\n\t\t\tif\x20\(\(location\.host\.indexOf\(\":\"\)\x2
SF:0!=\x20-1\)\x20&&\x20\(location\.host\[0\]\x20!=\x20\"\[\"\)\)\n\t\t\t\
SF:tvar\x20hosturl\x20=\x20\"\[\"\x20\+\x20location\.host\x20\+\x20\"\]\";
SF:\n\t\t\telse\n\t\t\t\tvar\x20hosturl\x20=\x20location\.host;\n\t\t\tdoc
SF:ument\.ge")%r(HTTPOptions,433,"HTTP/1\.0\x20200\x20OK\r\nConnection:\x2
SF:0close\r\nETag:\x20\"276-355-5fae3487\"\r\nLast-Modified:\x20Fri,\x2013
SF:\x20Nov\x202020\x2007:23:51\x20GMT\r\nDate:\x20Sat,\x2011\x20Mar\x20202
SF:3\x2012:54:04\x20GMT\r\nX-Frame-Options:\x20SAMEORIGIN\r\nContent-Type:
SF:\x20text/html\r\nContent-Length:\x20853\r\n\r\n<!DOCTYPE\x20html>\n<htm
SF:l>\n<head>\n<meta\x20http-equiv=\"Content-Type\"\x20content=\"text/html
SF:;\x20charset=UTF-8\"\x20/>\n<meta\x20http-equiv=\"X-UA-Compatible\"\x20
SF:content=\"IE=Edge\">\n<meta\x20HTTP-EQUIV=\"pragma\"\x20CONTENT=\"no-ca
SF:che\">\n<meta\x20HTTP-EQUIV=\"Cache-Control\"\x20CONTENT=\"no-store,\x2
SF:0must-revalidate\">\n<meta\x20HTTP-EQUIV=\"expires\"\x20CONTENT=\"0\">\
SF:x20\n<title>\xe4\xb8\xad\xe5\x9b\xbd\xe7\x94\xb5\xe4\xbf\xa1\xe6\x99\xb
SF:a\xe8\x83\xbd\xe7\xbd\x91\xe5\x85\xb3</title>\n\n</head>\n<body>\n\t<fo
SF:rm\x20id=\"argform\"\x20method=\"post\"\x20action=\"/cgi-bin/luci\">\n\
SF:t\t<input\x20type=\"hidden\"\x20name=\"token\"\x20value=\"hgdetrsafdasf
SF:w3egfsgfd\"\x20/>\n\t\t<script>\n\t\t\tif\x20\(\(location\.host\.indexO
SF:f\(\":\"\)\x20!=\x20-1\)\x20&&\x20\(location\.host\[0\]\x20!=\x20\"\[\"
SF:\)\)\n\t\t\t\tvar\x20hosturl\x20=\x20\"\[\"\x20\+\x20location\.host\x20
SF:\+\x20\"\]\";\n\t\t\telse\n\t\t\t\tvar\x20hosturl\x20=\x20location\.hos
SF:t;\n\t\t\tdocument\.ge");
==============NEXT SERVICE FINGERPRINT (SUBMIT INDIVIDUALLY)==============
SF-Port8080-TCP:V=7.93%I=7%D=3/11%Time=640C79ED%P=aarch64-unknown-linux-gn
SF:u%r(GetRequest,24A9,"HTTP/1\.0\x20200\x20OK\r\nServer:\x20\r\nAccept-Ra
SF:nges:\x20bytes\r\nConnection:\x20close\r\nContent-Type:\x20text/html;\x
SF:20charset=gb2312\r\nCache-Control:\x20no-cache,no-store\r\nPragma:\x20n
SF:o-cache\r\nContent-Length:\x209055\r\nX-Frame-Options:\x20SAMEORIGIN\r\
SF:nX-Content-Type-Options:\x20nosniff\r\nX-XSS-Protection:\x201;\x20mode=
SF:block\r\nContent-Security-Policy:\x20frame-ancestors\x20'self'\x20\r\n\
SF:r\n\n\n<!DOCTYPE\x20html\x20PUBLIC\x20\"-//W3C//DTD\x20XHTML\x201\.0\x2
SF:0Transitional//EN\"\"http://www\.w3\.org/TR/xhtml1/DTD/xhtml1-transitio
SF:nal\.dtd\"><html\x20xmlns=\"http://www\.w3\.org/1999/xhtml\">\n<head>\n
SF:<META\x20HTTP-EQUIV=\"pragma\"\x20CONTENT=\"no-cache\">\n<META\x20HTTP-
SF:EQUIV=\"Cache-Control\"\x20CONTENT=\"no-cache,\x20must-revalidate\">\n<
SF:meta\x20http-equiv=\"Content-Type\"\x20content=\"text/html;\x20charset=
SF:gb2312\"\x20/>\n<title>ZXHN\x20F610GV9</title>\n<LINK\x20REL=\"styleshe
SF:et\"\x20HREF=\"css/login\.css\"\x20TYPE=\"text/css\"\x20/>\n<LINK\x20RE
SF:L=\"stylesheet\"\x20HREF=\"css/stylech\.css\"\x20TYPE=\"text/css\"\x20/
SF:>\n<link\x20rel=\"stylesheet\"\x20href=\"css/Utilisateur\.css\"\x20/>\n
SF:<")%r(HTTPOptions,330,"HTTP/1\.1\x20400\x20Bad\x20Request\r\nServer:\x2
SF:0\r\nAccept-Ranges:\x20bytes\r\nConnection:\x20close\r\nContent-Type:\x
SF:20text/html;\x20charset=gb2312\r\nCache-Control:\x20no-cache,no-store\r
SF:\nPragma:\x20no-cache\r\n\r\n\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x
SF:20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\
SF:x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20
SF:<HTML>\n\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x2
SF:0\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x
SF:20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20<HEAD><TITLE>400\x20B
SF:ad\x20Request</TITLE></HEAD>\n\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\
SF:x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20
SF:\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x2
SF:0<BODY\x20BGCOLOR=\"#FFFFFF\"\x20TEXT=\"#000000\"\x20LINK=\"#2020ff\"\x
SF:20VLINK=\"#4040cc\">\n\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\
SF:x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20
SF:\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20<H2>400
SF:\x20Bad\x20Request</H2>\nYour\x20request\x20has\x20bad\x20syntax\x20or\
SF:x20is\x20inherently\x20impossible\x20to\x20satisfy\.\n\x20\x20\x20\x20\
SF:x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20
SF:\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x2
SF:0\x20\x20<HR>\n\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20
SF:\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x2
SF:0\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20<ADDRESS><A\x20HREF=\"http://w
SF:ww\.zte\.com\.cn\"></A></ADDRESS>\n\x20\x20\x20\x20\x20\x20\x20\x20\x20
SF:\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x2
SF:0\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20</BODY>\n\
SF:x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20
SF:\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x2
SF:0\x20\x20\x20\x20\x20\x20</HTML>\n");
==============NEXT SERVICE FINGERPRINT (SUBMIT INDIVIDUALLY)==============
SF-Port17999-TCP:V=7.93%I=7%D=3/11%Time=640C7A21%P=aarch64-unknown-linux-g
SF:nu%r(Kerberos,18,"\0\0\0\x14{\"Result\":-1,\"ID\":0}")%r(SMBProgNeg,18,
SF:"\0\0\0\x14{\"Result\":-1,\"ID\":0}");
MAC Address: 98:9A:B9:08:CE:10 (zte)
Service Info: Host: virtual; OS: Linux; CPE: cpe:/o:linux:linux_kernel

Host script results:
|_smb2-time: Protocol negotiation failed (SMB2)
|_clock-skew: -1s
| nbstat: NetBIOS name: SMBSHARE, NetBIOS user: <unknown>, NetBIOS MAC: 000000000000 (Xerox)
| Names:
|   SMBSHARE<00>         Flags: <unique><active>
|   SMBSHARE<03>         Flags: <unique><active>
|   SMBSHARE<20>         Flags: <unique><active>
|   \x01\x02__MSBROWSE__\x02<01>  Flags: <group><active>
|   WORKGROUP<1d>        Flags: <unique><active>
|   WORKGROUP<1e>        Flags: <group><active>
|_  WORKGROUP<00>        Flags: <group><active>
| smb-security-mode:
|   account_used: guest
|   authentication_level: user
|   challenge_response: supported
|_  message_signing: disabled (dangerous, but default)

Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Sat Mar 11 20:56:51 2023 -- 1 IP address (1 host up) scanned in 173.89 seconds
```

[[TODO]]

## 原理

nmap 使用 TCP/IP 相关协议，以及协议特点，对目标端口进行连接，对目标的端口连接请求的返回数据进行分析，来判断端口是否开启。常用的/常见的为 TCP SYN 半开放连接。

[[TODO]]

## 总结

## 参考

- [nmap | Kali Linux Tools](https://www.kali.org/tools/nmap/#ncat)
