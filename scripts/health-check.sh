> #!/bin/bash
> echo "===== 服务器巡检报告 ====="
> echo "生成时间: $(date '+%F %T')"
> echo "主机名:   $(hostname)"
> echo ""
> echo "----- 磁盘使用 -----"
> df -h
> echo ""
> echo "----- 内存 (MB) -----"
> free -m
> echo ""
> echo "----- 系统日志 error 条数 -----"
> sudo grep -ci "error" /var/log/messages
> echo ""
> echo "----- SSH 暴力破解尝试 -----"
> sudo grep -c "sshd.*Failed password" /var/log/secure
> EOF