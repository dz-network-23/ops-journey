# Day 01 · CentOS 7 yum 源修复 + 文件系统/权限/文本处理

## 问题 1：CentOS 7 EOL 导致 yum install 全部失败
- 现象：yum install 报 Could not resolve host: mirrorlist.centos.org
- 排查：发现 CentOS 7 已于 2024-06-30 停止维护，官方源下线
- 原因：源 URL 仍指向已关闭的官方仓库
- 解决：备份旧 repo → 替换为 mirrors.aliyun.com/centos-vault/7.9.2009/ → 关闭 fastestmirror → 重建缓存
- 验证：yum repolist 显示 base/extras/updates 三个仓库共 16,771 个包

## 问题 2：（你修源过程中实际遇到的问题，没有就空着）
- 现象：粘贴板不互通
- 排查：VMware tools工具
- 原因：不明
- 解决：重启虚拟机
- 验证：可以通过shift+ctrl+v粘贴进虚拟机

## 知识点：FHS（文件系统层级标准）
- 自己的文件：/root（root 用户）或 /home/用户名（普通用户）或 /tmp（临时）
- 系统配置：/etc（不要堆私货），日志：/var/log（只读）
- 不能碰：/usr、/bin、/lib、/boot
- 安装软件文件去向：程序→/usr/bin，库→/usr/lib64，配置→/etc，文档→/usr/share/doc
- 验证：rpm -ql tree 输出 5 个文件全部按 FHS 规矩放

## 今日成果
- [x] 修好 yum 源
- [x] 装好 7 个基础工具
- [x] 建好 ops-journey 目录骨架
- [x] rpm -ql 验证 FHS
