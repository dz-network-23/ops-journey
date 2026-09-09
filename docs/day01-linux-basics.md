# Day01 · 环境搭建 + 修 yum 源

第一天把环境搞起来，踩了几个坑。

## 1. VMware 装 CentOS 7

装的桌面版，用户 dzgsy。切 root 用 su -。

## 2. yum 装不了软件（最大的坑）

yum install 直接报错。查了下是 CentOS 7 已经 EOL（2024-06 官方停止维护），
官方源 mirrorlist.centos.org 关了，域名都解析不了。

解决：
1. 先备份旧配置
   mv /etc/yum.repos.d/*.repo /root/repo-backup/
2. 写新的阿里云 vault 源，指向 centos-vault/7.9.2009
3. 关掉 fastestmirror 插件
4. yum clean all && yum makecache

验证：yum repolist 出来 16771 个包。

## 3. 装基础工具

yum install -y tree vim-enhanced lsof wget curl net-tools bash-completion

顺手用 rpm -ql tree 看了软件装哪了：程序在 /usr/bin，文档在 /usr/share/doc，
全按 FHS 标准来的。自己的东西放 /root 或 /home，系统目录别乱动。

## 4. 剪贴板不互通

Windows 复制的东西粘不进虚拟机，排查发现是 VMware Tools 的问题，
装好重启后 shift+ctrl+v 能粘了。

## 5. git push 连不上 GitHub

报 ECONNREFUSED 127.0.0.1:443。
原因是没走代理。
git config --global http.proxy 后解决。
以后 push 失败先想代理。

## 今日成果

- yum 修好，工具装齐
- ops-journey 目录建好
- GitHub 仓库通了
