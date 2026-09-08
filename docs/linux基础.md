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

>ls -alhF /Linux路径

-a(-all)显示全部文件
-l(-list)以列表展开并展示更多信息(权限、用户和组、大小、时间)
-h更换单位为易于阅读的格式

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
>cp -r test.txt /home/user/test2/

-r (递归),复制的是文件夹时必须加
-f(force)强制复制，覆盖时不提示

#### mv:移动文件或文件夹
>mv -r test.txt /home/user/test2/
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

常用选项：
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

常用选项：
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



## Linux基础命令2

### Linux的root用户

切换到root用户
不建议不带横杠，因为不加载环境变量。
>su -（等同su - root）

sudo
普通用户临时使用权限更高的命令

root用户下使用visudo命令，在文件最后添加
>[user] ALL=(ALL)   NOPASSWD: ALL

添加sudo权限，并且不需要密码（实机环境不能去掉密码！）


























