
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


alias别名：
>alias


## 帮助手册

man：
查看完整手册
>man 命令名

--help：
>命令 --help

help：
输出内置命令

apropos/whatis：
全局关键词搜索和精确查询：
>apropos 关键词
>whatis 关键词


## Linux常见关机重启

shtudown安全关机
>shutdown [选项] [时间] [警告信息]

-h 关机
-r 重启
-c 取消计划中的关机或重启
-k 警告但不关机(维护时好用)

时间参数：
now 现在
+m m分钟后
HH:MM 24小时具体时间


reboot立即重启系统

init切换运行级别
>init 0 //关机
>init 6 //重启


## 基础命令拓展

### mkdir/touch
Linux创建文件和文件夹的区分是命令不是后缀。


### ll的输出详细
第一列：类型和权限
第二列：文件的连接数
第三、四列：属主和属组
第五列：大小
第六列：创建/修改时间
第七列：文件名


### mv
同目录下mv就是改名，跨目录才是移动，并且移动目录不需要-p

不配置可选项时，目标路径如果有同名将覆盖（改名同理），有同名并且类型不一致将无法覆盖。

-i 覆盖前询问
-f 强制不询问
-v 显示过程
-n 已存在就不覆盖


### cp
目录不存在：创建同名副本
目录存在：复制
目录是文件：覆盖

-r 递归复制
-p(--preserve=all) 保留属性(权限、属主、时间戳)
-d 保留软连接本身
-a 归档复制，同-drp
-v显示过程
-u 只复制比目标更新的文件(增量备份常用)
\cp 覆盖前不询问

多个源进行复制最后的目标必须是目录


### rm
-i 逐个确认
rmdir 只删除空目录


### echo
-e 启用转义字符，后面的字符串用要引号包裹
{a..z} 连续输出a到z
ad{1..100} 连续从a1到a100
$(命令) 解析命令

>echo -e "当前目录的内容：\n$(ls)"


### cat
-n 输出行数


### alias和unalias
>alias //直接展示全部别名
>alias 别名 //查询别名对应的命令
>alias mkdir='mkdir -pv' //非持久化起别名
>unalias 别名 删除别名

可以修改配置文件~/.bashrc（仅用户）和/etc/profile（全局）将别名持久化



### ntpdate
时间同步，需要yum下载
>ntpdate ntp1.aliyun.com

查看当前时区
>timedatectl status


### vi和vim
gg 跳到首行
G 跳到尾行
i/o 进入编辑
yy 复制
p 粘贴
^ 行首
$ 行尾
nG 跳到第n行
dd 删除整行
ndd 向下删除n行（如 3dd）
d$ 或D删到行尾
d0 或d^删到行首
dG 删到文件末尾
dgg 删到文件开头
u 撤销

:noh 取消高亮
:set nu 展示行号
:set nonu 取消展示行号
:%s/old/new/g 将当前文件中所有匹配的old替换为new

















































































