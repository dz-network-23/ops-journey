# Linux基础

## FinalShell
安装后分别用root用户和普通用户登录。

## Linux目录结构
/为根目录

### 可以随便放的文件夹
/root 为管理员目录
/home/用户名 为普通用户目录
/tmp 临时文件目录，重启自动清理

### 谨慎放的文件夹
/etc（配置）
/var/log（日志）

### 不能放的文件夹
/usr
/bin
/lib（系统程序）
/boot（开机引导）

## Linux基础命令

### 命令格式
命令其实就是Linux系统的可执行程序

命令的格式：
command [-options] [parameter]

command:命令关键字本身
-options:可选项
parameter:可选参数

例如：
>ls -l /home

### 1.ls
ls直接平铺工作目录下的文件和文件夹

>ls [-alhF] /Linux路径

-a(-all)显示全部文件
-l(-list)以列表展开并展示更多信息(权限、用户和组、大小、时间)
-h更换单位为易于阅读的格式
-F 给文件加后缀标识

### 2.cd(Change Directory)
>cd /Linux路径 绝对
>cd test/ 相对

特殊路径符：
>cd . 当前工作目录路径
>cd .. 回退
>cd ~ 回家(home下的用户里)
>cd 同上
>cd ../.. 退回上一级的上一级
>cd ../test 回退并进入test文件夹



### 3.pwd(Print Work Directory)
无选项无参数，打印当前工作目录

### 4.mkdir

>mkdir -p test/power/666

-p 一次性创建多个层级目录
(这里没有power文件夹，会自动创建)

>mkdir -p parent/child1 parent/child2 parent/child3

一个总文件夹里面三个小文件夹



### 5.touch、cat、more、less

#### touch命令无选项，参数必填，表示要创建的文件路径
>touch nextWall.txt

#### cat无选项，参数必填
查看完整文件
>cat nextWall.txt

#### more无选项，参数必填
分页查看文件
>more nextWall.txt

空格 下一页
回车 下一行
d 向下翻半屏
b 向上翻一屏
h help
q 立即退出

#### less分页查看器，新系统取代more

>less /var/log/messages

shift+f 实时跟踪，类似后面的tail -f，退出用ctrl+c
gg 跳到首行
G 跳到尾行
q 退出


### 6.cp、mv、rm

#### cp:复制文件或文件夹
>cp [-rf] test.txt /home/user/test2/

-r (递归),复制的是文件夹时必须加
-f(force)强制复制，覆盖时不提示

#### mv:移动文件或文件夹
>mv [-r] test.txt /home/user/test2/
>mv test.txt hello.txt
>mv /home/user/test.txt /home/user/hello.txt

同个路径下是重命名


#### rm:删除文件或文件夹
>rm -rf /home/user/test/




### 7.which、find

#### which:查找命令的可执行文件路径

>which ls
>which cd



#### find:在目录树中查找文件


>find 起始路径 选项 条件

按名称查找：
>find /home -name "*.txt"


按类型查找：
>find /home -type f 普通文件
>find /home -type d 目录

按大小查找：
>find /home -size +10M  （大于10MB）


### 8.grep

从文件内容中搜索匹配的行

>grep 关键字 文件路径

在文件中搜索关键字：
>grep "hello" test.txt

常用可选项：
-n 显示匹配行的行号
-i 忽略大小写
-v 反向搜索，显示不匹配的行
-c 统计匹配的行数
>grep -v '!!' /etc/shadow



### 9.wc

统计文件的行数、单词数、字节数

>wc test.txt

例：
12 45 256 test.txt
行数 单词数 字节数 文件名

常用可选项：
-l  只统计行数（比较重要）
-w  只统计单词数
-c  只统计字节数
-m  只统计字符数



### 10.管道符 |

将前一个命令的输出，作为后一个命令的输入

示例：
>ls /home/user | grep "lab"  （在结果中过滤）
>cat test.txt | wc -l  （统计行数）
>ls /home | wc -l  （统计文件数量，不能加-la）
>grep -v '!!' /etc/shadow | grep -v '\*'查看所有用户



### 11.echo

输出内容到终端，常配合重定向写入文件

>echo "Hello Linux"



### 12.tail

查看文件末尾的内容，默认显示最后10行

>tail test.txt

常用可选项：
-n  指定行数
>tail -n 20 test.txt

-f 实时追踪文件变化（常用于看日志）
>tail -f /var/log/syslog


配合管道符使用：
>ls /home/user | tail -5  （显示最后5个文件）



### 13.重定向符

将命令的输出结果写入文件，而非显示在终端

```linux
> 覆盖写入（覆盖原内容）
>> 追加写入（在末尾追加）
```

echo写入：
>echo "Hello" > test.txt
>echo "World" >> test.txt

ls结果写入：
>ls -al /home > list.txt

cat结果写入：
>cat test.txt > copy.txt

grep结果写入：
>grep "error" /var/log/syslog > errors.txt

组合使用（合并文件）：
>cat a.txt b.txt > merge.txt



### 14.vim编辑器


编辑模式
↑
命令模式（中转，且每次进入都是这个模式）
↓
底线命令模式

命令模式→编辑模式：
i 在光标处编辑文件
o 在光标处下一行编辑文件
esc 退出到命令模式

命令模式：
上下左右 控制光标
pgup、pgdn 上下翻页
/ 搜索模式
n 下一匹配
N上一匹配
dd 删除光标行所在行
[n]dd 删除当前行和下面n行
yy 复制当前行
[n]yy 复制当前行和下面n行
p 粘贴复制内容
u 撤销修改
ctrl+r 反向撤销
gg 跳到首行
G 跳到尾行


底线命令模式(按:键)：
:wq 保存并退出
:w 仅保存
:q 仅退出
:q! 强制退出
:noh 取消搜索高亮




## 权限相关概念



### 用户和用户组

Linux可以支持多用户，多用户组，用户可以加入多个组

Linux权限管控单元是用户级别和用户组级别

### 权限信息

ls -l后查看的第一列就是类型和权限控制信息
rwx分别是读、写、执行
rwx------三块的顺序是用户、用户组、other

第三列和第四列是文件的所属用户和所属用户组

当文件被对应的操作发起时，会先看权限是否满足(按顺序)用户、用户组、other

各种操作举例：
文件：cat(读)、vim(写)、mv/rm(操作)
文件夹：ls(读)、mkdir(写)、cd进来(操作)


## Linux基础命令2

### 1.Linux的root用户

切换到root用户
不建议不带横杠，因为不加载环境变量。
>su -（等同su - root）

sudo
普通用户临时使用权限更高的命令

root用户下使用visudo命令，在文件最后添加
>用户名 ALL=(ALL)   NOPASSWD: ALL

添加sudo权限，并且不需要密码（实机环境不能去掉密码！）



### 2.用户、用户组管理

用户组管理

>groupadd 用户组名

>groupdel 用户组名

用户管理

>useradd [-g -d] 用户名

-g 指定用户组，不指定将会创建用户同名
-d 指定用户home路径，不指定将在home/下创建默认

>userdel [-r] 用户名

-r 删除用户的home目录

查看用户所属组：
>id 用户名
>uid= gid= groups=

↑其中groups=主组+附加组
权限判定顺序:
1. uid匹配
2. gid匹配(groups里所有的)
3. other匹配

**创建文件时，gid(所属组)一般情况下由创建者的主组决定**(因为有强制继承父目录的gid情况)

**不跨分区修改文件时，gid不变（因为物理数据没有动，只是更改文件参数）**，跨分区修改时gid重新决定（因为文件物理上发生了移动）

更改用户组：
>usermod -aG 用户组 用户名






### 3.getent

列出当前用户
>getent passwd
结果：
用户名:密码:用户ID:组ID:描述:home目录:执行终端

列出当前用户组
>getent group
结果：
组名:组认证:组ID


### 4.权限控制

chmod

**当这个文件的所属是自己时，可以使用chmod命令**

>chmod [-R] u=rwx,g=r,o=r test
>chmod 711 test.txt

-R 递归全部文件 


chown

绝大多数情况下，只有root能使用本命令

>chown [-R] 用户:用户组 文件/文件夹


chgrp

**当这个文件的所属是自己，并且本人在将要修改的组里才能用**

>chgrp [-R] 用户组 文件/目录




### 5.快捷按键

ctrl+c 终止程序
ctrl+d 退出账户和某些特定程序
history 查看历史命令
！+命令前缀 自动从新到旧匹配首字母相符的命令
ctrl+r 输入内容匹配历史命令，回车执行，左右提取(不执行)
ctrl+a 跳到该行开头
ctrl+e 跳到该行结尾


### 6.软件安装

>yun [-y] [install | remove | search] 软件名称

-y 自动确认



查看最近安装：
>grep "Installed:" /var/log/yum.log

查看yum日志
>cat /var/log/yum.log



### 7.systemctl

能被systemctl管理的软件一般称为服务
>systemctl [] 服务名

start 启动
stop 关闭
status 查看状态
enable 开启开机自启
disable 关闭开机自启

例如：
>systemctl status firewalld


### 8.软链接

类似于windows的快捷方式
>ln -s 参数1 参数2

参数1是被链接的文件/文件夹
参数2是要链接的目的地
例如：
>ln -ls /etc/yun.conf ~/yum.conf

### 9.配置ip地址

用vim编辑/etc/sysconfig/network-scripts/ifcfg-ens33

dhcp改为static

IPADDR="192.168.45.128"
NETMASK="255.255.255.0"
GATEWAY="192.168.45.2"
DNS1="192.168.45.2"


### 10.ping

可选参数：
-c 指定发包次数
-i 设置发包间隔(秒)
-s 指定数据包大小(字节)
-M do 禁止分片
-W 设置超时时间(秒)
-t 设置ttl
-f 疯狂ping(需root)
-I 指定网卡/接口
-4
-6
-n 不解析域名
-b 目的ip为广播地址



### 11.wget
可以从网络下载文件到工作目录
>wget [-b] url

-b 后台下载


### 12.curl

curl可以发起网络请求，下载文件，获取信息
>curl [-O] url

-O 下载文件的时候用



例如：
curl cip.cc   //能获取自己当前的公网ip



### 13.查看端口占用情况

查看ip地址端口
>nmap ip地址

查看端口被哪个占
>netstat -anp | grep 端口号(进程号也行)


### 14.进程管理

>ps [-ef]

-e 展示全部进程
-f 展示进程详细信息


>kill [-9] (PID)进程号

-9 强制kill


### 15.主机运行状态


进入类似win任务管理器
>top 

-p 只显示某个进程的信息
-c 显示进程完成命令
-d 设置刷新时间
-b 非交互运行，可以配合重定向
-i 不显示闲置和僵尸进程

磁盘监控

>df [-h]

-h 能够人性化的单位显示



磁盘信息监控

>iostat [-x] 刷新间隔 刷新次数

-x 显示更多信息



网络监控

>sar -n DEV 刷新间隔 刷新次数

此命令过于复杂，-n DEV为固定写法，会就行


### 16.环境变量

取值符号：$

临时生效的环境变量:
>export 变量名=变量值

永久生效的环境变量:

针对当前用户:
>~/bashrc:
>export MYNAME=user

针对全部用户:
>/etc/profile:
>export MYNAME=user

立即生效:
>source 文件名

增加PATH方法(**$一定要慎重再慎重**):
>export PATH=$PATH:增加的变量

文件上传与下载

下载程序:
>yum -y install lrzsz

下载
>sz 文件名

上传
>rz




### 17.解压和压缩

#### tar

**压缩包有.tar和.tar.gz两个格式，配合可选项选择合适的**

>tar [] 参数1 参数2 参数3 ... 参数N

-c 压缩
-x 解压
-v 显示压缩、解压过程
-f 要创建的文件(**放在可选项的最后避免混淆**)
-z gzip模式(真压缩)
-C 解压目的地(**约定放在命令末尾**)

例如:
>tar -(z)cvf 创建的压缩包 输入1...输入N
>tar -(z)xvf 压缩包 -C 解压目的地



#### zip

>zip [-r] 参数1 参数2 参数3 ... 参数N

-r 递归

>unzip 参数1 参数2 参数3 ... 参数N [-d] 解压目的地

例如:
>zip -r 创建的压缩包 输入1...输入N
>unzip 压缩包 -d 解压目的地















































