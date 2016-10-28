#### 查看进程自执行路径
* sudo ls -l /proc/PID

#### 命令行安装android sdk [参考 打造一个全命令行的Android构建系统](http://www.jianshu.com/p/1694ea9a3f90)
* wget https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
* tar xvzf android-sdk_r24.4.1-linux.tgz
* 配置环境变量（/etc/profile）
* android list sdk --all
* android update sdk -u -a -t 1,2,3 (安装123选项)

#### 查看进程内存使用情况
* top命令查看进程资源消耗
* 在top命令下shift+m按照内存使用排序
* 在top命令下，输入F然后选择相应的排序方式

在top命令下，输入h查看帮忙信息，有更多的命令提示

#### htpasswd 增加用户 密码
* sudo htpasswd -b your_htpasswd_file username password

#### 查看文件夹占用磁盘大小，并且排序展示
* du -h -a | sort -h

#### 日志清理
* echo '' > file
* 

#### 新创建用户sudo无法使用
xxx is not in the sudoers file.This incident will be reported.
* 切换到root用户下
* 添加sudo文件的写权限
``` bash
chmod u+w /etc/sudoers
```

* 编辑sudoers文件
``` bash
vi /etc/sudoers
找到这行 root ALL=(ALL) ALL,在他下面添加xxx ALL=(ALL) ALL (这里的xxx是你的用户名)

ps:这里说下你可以sudoers添加下面四行中任意一条
youuser            ALL=(ALL)                ALL
%youuser           ALL=(ALL)                ALL
youuser            ALL=(ALL)                NOPASSWD: ALL
%youuser           ALL=(ALL)                NOPASSWD: ALL

第一行:允许用户youuser执行sudo命令(需要输入密码).
第二行:允许用户组youuser里面的用户执行sudo命令(需要输入密码).
第三行:允许用户youuser执行sudo命令,并且在执行的时候不输入密码.
第四行:允许用户组youuser里面的用户执行sudo命令,并且在执行的时候不输入密码.
```
* 撤销sudoers文件写权限,命令:
``` bash
chmod u-w /etc/sudoers
```

#### Linux 限制一个应用的速率

* 安装trickle

限制网络流量速率的一种方法是通过一个名为trickle的命令行工具。通过在程序运行时，预先加载一个速率限制 socket 库 的方法，trickle 命令允许你改变任意一个特定程序的流量。 trickle 命令有一个很好的特性是它仅在用户空间中运行，这意味着，你不必需要 root 权限就可以限制一个程序的带宽使用。要能使用 trickle 程序控制程序的带宽，这个程序就必须使用非静态链接库的套接字接口。当你想对一个不具有内置带宽控制功能的程序进行速率限制时，trickle 可以帮得上忙。
``` bash 
# Ubuntu，Debian 及其衍生发行版中安装 trickle 
sudo apt-get install trickle
# 在 Fdora 或 CentOS/RHEL 
sudo yum install trickle
```

* trickle 的基本使用方法如下。仅需简单地把 trickle 命令（及速率参数）放在你想运行的命令之前
``` bash
trickle -d <download-rate> -u <upload-rate>  <command> 

这就可以将 <command> 的下载和上传速率限定为特定值（单位 KBytes/s）。
例如，将你的 scp 会话的最大上传带宽设定为 100 KB/s：
trickle -u 100 scp backup.tgz alice@remote_host.com:

最后， trickle 也可以以守护进程模式运行，在该模式下，它将会限制所有通过 trickle 启动且正在运行的程序的总带宽之和。 启动 trickle 使其作为一个守护进程（例如， trickled）：

sudo trickled -d 1000

一旦 trickled 守护进程在后台运行，你便可以通过 trickle 命令来启动其他程序。假如你通过 trickle 启动一个程序，那么这个程序的最大下载速率将是 1000 KB/s， 假如你再通过 trickle 启动了另一个程序，则每个程序的(下载)速率极限将会被限制为 500 KB/s，等等。
```

#### 查看端口情况 端口占用情况 
* sudo lsof -i （sudo lsof -i:80）
* netstat -apn|grep 80

#### tar 压缩文件
* tar -zcvf xxxxx(输出文件名).tar.gz 被压缩文件

#### 打印服务器上所有运行的进程
``` bash 
 sudo netstat -nltp | grep 0.0.0.0 | awk '{print $7}' | awk -F'/'  '{print $1}' | xargs -i sudo ls -l /proc/{}/cwd | awk '{print $11 " " $3}' | sort | awk '{print $2 " " $1}'
```

#### 监控当前服务器带宽情况
* sudo nethogs 
安装
``` bash
sudo apt-get install nethogs
```

#### 指定DNS解析服务器IP，解析指定域名
* dig baidu.com @211.141.241.138

#### uptime 系统运行时间

#### load avergage[理解Linux系统负荷 阮一峰](http://www.ruanyifeng.com/blog/2011/07/linux_load_average_explained.html)
``` bash
load average: 0.1, 0.1, 0.1
1分钟、5分钟、15分钟内系统的平均负荷
2个CPU表明系统负荷可以达到2.0
在系统负荷方面，多核CPU与多CPU效果类似，所以考虑系统负荷的时候，必须考虑这台电脑有几个CPU、每个CPU有几个核心。然后，把系统负荷除以总的核心数，只要每个核心的负荷不超过1.0，就表明电脑正常运行。
最后一个问题，"load average"一共返回三个平均值----1分钟系统负荷、5分钟系统负荷，15分钟系统负荷，----应该参考哪个值？
如果只有1分钟的系统负荷大于1.0，其他两个时间段都小于1.0，这表明只是暂时现象，问题不大。
如果15分钟内，平均系统负荷大于1.0（调整CPU核心数之后），表明问题持续存在，不是暂时现象。所以，你应该主要观察"15分钟系统负荷"，将它作为电脑正常运行的指标。
```
