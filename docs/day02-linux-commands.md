# Day02 · 基础命令 + 权限 + 第一次巡检

学得最多的一天，从看文件到写出巡检脚本。

## 1. 看文件三板斧

tail 看尾（日志最新的在最后），head 看头，less 分页看
less 里 /关键词 搜索，q 退出，G 跳到末尾，F 实时跟踪（等于 tail -f）
看日志用 less 别用 vim

## 2. 日志长什么样

每条日志四段：时间 主机名 谁说的 说了什么
chronyd[749]: Source xxx online 就是时间同步服务在对时
看日志先看是谁产生的，别只盯着关键词

## 3. grep + 管道

grep -i 忽略大小写，-n 行号，-c 计数
管道 | 就是前一个命令的输出给后一个当输入
例如：
grep "Failed password" /var/log/secure | wc -l

## 4. 权限

chmod：r=4 w=2 x=1
数字权限对应二进制
chown 改属主，-R 递归

## 5.收获：mv 之后文件还是 root 的

把 /root 下的目录 mv 到 /home/dzgsy，所属用户没跟着变
mv 只改位置不改主人(权限足够、硬件分区会改)，mv 完要 chown -R dzgsy:dzgsy 补一刀

## 6. 坑：cp 复制目录报"略过目录"

cp报错，自己试出加-r就行，目录里套目录，要递归复制

## 7. sudo

学习中PASSWD= ALL默认提权无需密码
实机不能不要密码！

## 8. 第一次巡检（AI指导）

df -h 看磁盘，free -m 看内存，grep数日志
两个容易看错的：
- /dev/sr0 显示 100% 不是磁盘满，那是光驱挂的安装 ISO，只读
- free 剩 67M 不是内存不够，看 available 列（879M），

最后把巡检命令存成了 health-check.sh，以后一条命令出报告。

## 今日成果

- 文件查看 / grep / 管道 / 权限全过
- 巡检报告 + 巡检脚本
