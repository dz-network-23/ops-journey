
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


# Linux命令格式

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


# 基础命令拓展

## mkdir/touch
Linux创建文件和文件夹的区分是命令不是后缀。


## ll的输出详细
第一列：类型和权限
第二列：文件的连接数
第三、四列：属主和属组
第五列：大小
第六列：创建/修改时间
第七列：文件名


## mv
同目录下mv就是改名，跨目录才是移动，并且移动目录不需要-p

不配置可选项时，目标路径如果有同名将覆盖（改名同理），有同名并且类型不一致将无法覆盖。

-i 覆盖前询问
-f 强制不询问
-v 显示过程
-n 已存在就不覆盖


## cp
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


## rm
-i 逐个确认
rmdir 只删除空目录


## echo
-e 启用转义字符，后面的字符串用要引号包裹
{a..z} 连续输出a到z
ad{1..100} 连续从a1到a100
$(命令) 解析命令

>echo -e "当前目录的内容：\n$(ls)"


## cat
-n 输出行数


## alias和unalias
>alias //直接展示全部别名
>alias 别名 //查询别名对应的命令
>alias mkdir='mkdir -pv' //非持久化起别名
>unalias 别名 删除别名

可以修改配置文件~/.bashrc（仅用户）和/etc/profile（全局）将别名持久化



## ntpdate
时间同步，需要yum下载
>ntpdate ntp1.aliyun.com

查看当前时区
>timedatectl status


## vi和vim
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


## head/tail
>head -n 20

>tail -fn 30 //持续跟随

-f后tail变成前台进程


## less/more
less前台进程查看
q 退出
/ 搜索
空格或f 下一页
b 上一页
g 跳到第一行
G 跳到最后一行
数字g 跳到数字行


more命令行查看
q 退出
回车 下一行
空格 下一页
b 上一页
= 查看当前行号（屏幕的第一行）
:f 输出文件名和行号


## wc/which/whereis
>wc 文件名

直接输出行数，词数，字节数，文件名

-l 统计行数
-w 统计单词数
-c 统计字节数

which 命令
查询命令所在路径

whereis 命令
查询命令以及相关文件位置


## diff/vimdiff
diff查看两个文件的差异
>diff aaa.txt bbb.txt
[aaa.txt行][操作][bbb.txt行]

a:add 增加
d:delete 删除
c:change 修改

```bash
<第一个文件的内容
>第二个文件的内容
```


vimdiff在前台展示，更直观
ctrl+ww 切换窗口
do 覆盖当前窗口


## sort
针对文本文件内容的行进行排序
自然排序:从小到大
>sort 文件

默认按照字母自然排序，第一位相同按第二位排，以此类推。

>sort -n 文件
-n 按照数字大小自然排序
-k 3 按照第三列排序（默认以空格分割列）
-t % 将分割符号替换为%
-r 反转
-k2 -k3 按k2、k3列排序


### sort**重要规则** 
一、短选项带参数不能合并
带参数的短选项（如 -t、-k、-n）不能放在同一个 -xxx 组里

二、短选项参数加不加空格等价
但长选项不行，必须用 =

三、-k3 与 -k3,3 的区别（核心）
-k3	字段3 到行尾（字段3 + 字段4 + ...）	后面所有内容混入，干扰排序
-k3,3	仅字段3	精确控制，只比这一段

四、-r 是全局标志
-r 写在 -k 外面，影响所有 key；写在 key 内部，只影响那一个 key（-k1,1r）

五、-t ' ' 和 ls -l 不兼容
ls -l 用不等量空格对齐列，-t ' ' 把每个空格都当分隔符，导致空字段产生，字段编号错位

六、分隔符是不定量重复字符时
sort 没有"多个分隔符合并"的选项，需要先预处理


## uniq
以行为单位去冗余
>uniq 文件

-c 重复次数


## find
>find /root

-type [f文件 d目录 l软连接]
>find /etc -type f

-name 文件名
>find /etc -name '*.txt'

-size [+-]size[cwbkMG]
>find /etc -size +10k -size -20k //查找大于10k且小于20k的文件

-mtime 按修改时间查找，支持+或-表示指定天数前或后
>find /etc -mtime -7 //查询/etc下7天内修改的文件

-user 用户名
>find /etc -user root


### find和其他命令联用
1. 加$或` 
```bash
ll -h $(find /atguigu/find/ -name '*.txt')
ll -h `find /atguigu/find/ -name '*.txt'`
```

2. 借助 xargs：
```bash
find /atguigu/find/ -name '*.txt' | xargs ls -lh
```
xargs后不能用别名

3. find 命令自带的参数-exec：
```bash
find /atguigu/find/ -name '*.txt' -exec ls -lh {} \;
```
**把查询到的结果放入{}中执行，后面\;或+是结束符，+是累加发送\;是递推发送**


## du
查看文件或目录的磁盘占用大小

-h 以人类可读显示文件大小
-s 仅显示指定目录或文件的大小，不包括其子目录的大小
>du -sh /home/dzgsy


# 目录、inode和block
文件存储在硬盘上，硬盘最小存储单位是“扇区”，每个扇区存储512字节
一个文件一个inode，至少一个block

三者的关系
1. **目录**里存的不是文件，而是"**文件名 → inode 号**"的映射表
2. **inode** 存文件的**元数据**：权限、属主属组、大小、三个时间戳、硬链接数、**block 的位置指针**
    - **inode 里唯独不存文件名**
3. **block** 存文件的**真实内容**，是磁盘读写的最小单位，默认 4KB(八个扇区)



>ls -i  //看文件的 inode 号
>stat 文件名  //看完整的 inode 元数据
>df -i  //看 inode 使用情况（不是磁盘空间）
- inode 里存的不是 block 内容，而是指向 block 的**指针**


# 软链接和硬链接

## 软链接
软链接是一个独立的文件，具有自己的inode编号，内容是源文件的目录名
软链接依赖于目标文件的路径
创建命令:
>ln -s source.txt softlink

查看内容:
>cat hardlink //类似重定向


## 硬链接
硬链接是指多个文件名指向同一个inode
创建命令:
>ln source.txt softlink

当创建的软连接指向文件夹时，调用的最后要有/
不加/时是软链接的文件，加/时是软链接指向的目录
>ll softlink/ →软链接对应的目录
>rm softlink  →软链接文件本身

查看内容:
>cat softlink  //类似访问源文件


# 用户、管理、权限

## 用户相关文件

/etc/passwd，存储用户信息
用户名:密码占位符:UID:GID:用户全名/描述:家目录:登录shell

/etc/group，组信息
组名:组密码占位符:组成员列表

/etc/shadow，用户密码信息
用户名:密码:密码的过期时间（默认不过期）

## useradd
>useradd -u -s -M -g 用户名

-u 指定uid
-s 指定登陆后shell
-M 不创建家目录
-g 指定组


## groupadd
>groupadd -g 组名

-g 设置新建的组的GID


## passwd
>passwd --stdin 用户名

--stdin 非交互式设置密码


## su
加-表示加载环境变量和家目录


## userdel
>userdel -r 用户名

-r 删除家目录及所有相关文件


## id
检测用户是否存在，输出用户uid，gid，用户组信息
>id 用户名


## whoami/who am i
我是谁
>whoami

我到底是谁
>who am i


## w
展示用户信息


## last
查看历史用户登录情况


## lastlog
查看历史用户最近一次登录情况


## 拓展属性
展示拓展属性
>lsattr 文件

更改拓展属性
>chattr +a/+i 文件

a 仅追加
i 不可变


## sudo
更改配置文件
>visudo


# 软件包管理命令

## rpm
>rpm 可选项 软件包

-ivh i安装 v显示过程 h显示进度条
-qa q查询 a所有
-ql q查询 l显示软件的文件列表
-qf q查询 f查询拥有指定文件的软件
-Uvh U升级
-e 删除软件


## yum
/etc/yum.conf 配置yum下载安装包是否缓存以及缓存目录
/etc/yum.repos.d/*.repo 配置yum源


安装软件包
>yum install -y xxx

-y 全程yes


精确查询仓库元数据，确定文件所属软件包
>yum provides xxx


模糊查找软件包
>yum search xxx


展示安装包
>yum list available/install/all
available 可用的(yum源中所有可用)
install 已安装
all 所有


查看yum源的信息
>yum repolist


删除软件包(以及相关依赖)
>yum remove xxx

-e 不删除依赖


清除所有缓存
>yum clean all


指定更新某一个软件包，不指定则更新所有
>yum update


# 程序和进程（process）管理

## ps(process status)

看pid和ppid
>ps -ef


看其他信息（主要是进程状态）
>ps -aux

STAT进程状态码
| 状态码 | 含义 | 说明 |
|:---:|:---|:---|
| R | 运行中 (Running) | 正在执行或等待 CPU 调度 |
| S | 可中断睡眠 (Sleeping) | 等待事件完成（如 I/O 操作），**可被信号唤醒** |
| D | 不可中断睡眠 | 通常等待磁盘 I/O，**不能被信号中断**（高负载磁盘操作常见） |
| T | 暂停状态 (Stopped) | 通过 `Ctrl+Z` 或 `SIGSTOP` 暂停 |
| Z | 僵尸进程 (Zombie) | 进程已终止，但父进程未回收资源 |
| < | 高优先级 | 优先级为负值（`nice -n -5`） |
| N | 低优先级 | 优先级为正值（`nice -n 5`） |
| s | 会话领导者 | 进程是终端会话的主控进程 |
| l | 多线程进程 | 进程包含线程（如 Java/Python 多线程程序） |
| + | 前台进程组 | 与终端关联的前台进程（可通过 `bg` 切后台） |


## pstree
以树形查看进程信息
>pstree -p

-p 显示进程号


## top

-d num 指定刷新间隔
-p pid 仅显示指定进程
-n num 指定执行次数
-b 以批处理模式运行（方便追加和写入文件）

### 交互命令:

排序类：
P 按CPU使用率排序（默认）
M 按内存占用排序
T 按运行时间排序
N 按pid排序

进程操作：
k 终止进程
r 调整进程优先级

视图控制：
1 展开/折叠多核CPU详情
u 按用户过滤进程
f 自定义显示的列
h 打开帮助菜单

刷新设置：
空格 立即刷新
s 修改刷新间隔
d 修改刷新间隔（兼容旧版本）

颜色设置：
z 进入颜色模式
x 标记以哪列进行排序
shift+>或shift+<向左或右选择（有高亮提示）


## 杀手三剑客

根据pid结束相对应的进程
>kill pid

-9 强制kill


通过进程名模糊查找并结束进程（最好别用）
>pkill 进程名


通过进程名精确查找并结束进程
>killall 进程名


## 异常进程

僵尸进程
进程已经终止但未被父进程完全清理
僵尸进程并非真实运行的进程，而是内核保留的进程描述符（pid、退出状态、资源使用统计）



































































