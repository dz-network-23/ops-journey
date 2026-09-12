
# Linux的目录结构

## 文件最可能位置例如：
配置文件：etc
日志文件：var

所有内容放在/目录下

## 查看分区情况：
lsblk

## 硬盘情况：
sda、sdb、sdc...

## 分区情况：
sda1、sda2、sda3...


## 比较重要的目录：

/bin(/usr/bin)、/usr/local/bin:程序的命令
/sbin(/usr/sbin)、/usr/local/sbin：root能使用的命令

/home：普通用户的家目录
/root：超级管理员的家目录

lib/lib64：基本共享库

/lost+found：失物招领

/etc：系统范围配置文件

/boot：引导加载程序

/proc：进程和内核信息

/srv：服务数据(能被systemctl管理的就是服务)

/sys：系统设备和内核参数

/tmp：临时文件

/dev：设备（硬件）文件

/media：可移动媒体挂载点（CentOS6以下）

/mnt：手动临时挂载点

/opt：可选应用程序软件包

/var：可变数据（日志、缓存、脱机文件）

## 命令格式

1. 一个命令必须要有命令或别名，除了./运行当前工作目录的shell脚本
2. options分为短选项和长选项。短选项可合并，一般情况下顺序无关紧要，带参数的放合并的最后。长选项不可合并。
--help能展开
3. 参数通常是：文件名、目录名、用户名、进程ID、搜索字符串、URL等。

单双引号：包住整体、合成一部分
>touch "a aa aaa.txt"

转义符\，将有特殊作用的符号变成最原始的含义(文本)
例如：
>touch a\ aa\ aaa.txt

**长选项和等号**：一些长选项支持赋值，通常用等号连接（有时空格也可以）。
例如：
>--output=result.txt
>--output result.txt

双连字符，单独的双联字符--表示选项结束
例如：
>rm -- -f //表示删除文件名为-f的文件




















































































































