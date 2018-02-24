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

#### tar 命令 [每天一个linux命令（28）：tar命令](http://www.cnblogs.com/peida/archive/2012/11/30/2795656.html)
``` bash
.gz
解压1：gunzip FileName.gz
解压2：gzip -d FileName.gz
压缩：gzip FileName
.tar.gz 和 .tgz
解压：tar zxvf FileName.tar.gz
压缩：tar zcvf FileName.tar.gz DirName
```

#### start-stop-daemon
* 用来启动和关闭系统级别的进程

#### attach [How to know where a program is stuck in linux?](http://unix.stackexchange.com/questions/166541/how-to-know-where-a-program-is-stuck-in-linux)
``` bash
My first step would be to run strace on the process, best

 strace -s 99 -ffp 12345
if your process ID is 12345. This will show you all syscalls the program is doing. How to strace a process tells you more.

If you insist on getting a stacktrace, google tells me the equivalent is pstack. But as I do not have it installed I use gdb:

 tweedleburg:~ # sleep 3600 &
 [2] 2621
 tweedleburg:~ # gdb
 (gdb) attach 2621
 (gdb) bt
 #0  0x00007feda374e6b0 in __nanosleep_nocancel () from /lib64/libc.so.6
 #1  0x0000000000403ee7 in ?? ()
 #2  0x0000000000403d70 in ?? ()
 #3  0x000000000040185d in ?? ()
 #4  0x00007feda36b8b05 in __libc_start_main () from /lib64/libc.so.6
 #5  0x0000000000401969 in ?? ()
 (gdb)
```

#### Web性能测试
* 安装
``` bash
sudo apt-get install apache2-utils
```

* ab [options] [http://]hostname[:port]/path
``` bash
 ab -n xxx(请求数) -c xxx(并发数) xxx(url 地址)
```

#### crontab 
* 查看日志
``` bash
tail -f /var/log/syslog | grep cron -i
```
* 命令需要username才能正常执行

#### dmesg 
``` bash
# 开机信息亦保存在/var/log/dmesg
# 通常会安装驱动程序（内核模块），会打印一些信息，就可以通过dmesg命令来查看

tail -f /var/log/dmesg

sudo dmesg
```

#### 切换debian apt-get镜像为阿里云
``` bash
# 备份/etc/apt/sources.list
# 修改/etc/apt/sources.list

deb http://mirrors.aliyun.com/debian wheezy main contrib non-free
deb-src http://mirrors.aliyun.com/debian wheezy main contrib non-free

deb http://mirrors.aliyun.com/debian wheezy-updates main contrib non-free
deb-src http://mirrors.aliyun.com/debian wheezy-updates main contrib non-free

deb http://mirrors.aliyun.com/debian-security wheezy/updates main contrib non-free
deb-src http://mirrors.aliyun.com/debian-security wheezy/updates main contrib non-free
```

#### wget 下载https文件
``` bash
wget --no-check-certificate https:
```

#### scp 限制速度 
``` bash
# 速度限制为100KB/s
scp -P prot -l 100 user@host:/home/user/file ./
```

#### 修文件文件夹的所有者用户组
``` bash
sudo chown xxxx(author):xxxx(group) xxxx(file)
```

#### lost+found 文件夹创建
``` bash
sudo mklost+found
```

#### iostat [iostat来对linux硬盘IO性能进行了解](http://www.php-oa.com/2009/02/03/iostat.html)
``` bash
iostat -x
Linux 3.2.0-4-amd64 (tinya) 	02/14/2017 	_x86_64_	(2 CPU)

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           1.88    0.00    1.78    0.16    0.00   96.18

Device:         rrqm/s   wrqm/s     r/s     w/s    rkB/s    wkB/s avgrq-sz avgqu-sz   await r_await w_await  svctm  %util
vda               0.00    41.51    0.36    3.53     6.57   377.48   197.75     0.17   45.02    1.78   49.40   1.11   0.43

rrqm/s:  	每秒进行 merge 的读操作数目.即 delta(rmerge)/s
wrqm/s:   每秒进行 merge 的写操作数目.即 delta(wmerge)/s
r/s:      每秒完成的读 I/O 设备次数.即 delta(rio)/s
w/s:      每秒完成的写 I/O 设备次数.即 delta(wio)/s
rsec/s:   每秒读扇区数.即 delta(rsect)/s
wsec/s: 	 每秒写扇区数.即 delta(wsect)/s
rkB/s:    每秒读K字节数.是 rsect/s 的一半,因为每扇区大小为512字节.(需要计算)
wkB/s:    每秒写K字节数.是 wsect/s 的一半.(需要计算)
avgrq-sz: 平均每次设备I/O操作的数据大小 (扇区).delta(rsect+wsect)/delta(rio+wio)
avgqu-sz: 平均I/O队列长度.即 delta(aveq)/s/1000 (因为aveq的单位为毫秒).
await:   	平均每次设备I/O操作的等待时间 (毫秒).即 delta(ruse+wuse)/delta(rio+wio)
svctm:  	 平均每次设备I/O操作的服务时间 (毫秒).即 delta(use)/delta(rio+wio)
%util:    一秒中有百分之多少的时间用于 I/O 操作,或者说一秒中有多少时间 I/O 队列是非空的.即 delta(use)/s/1000 (因为use的单位为毫秒)

```

#### kill other ssh login user
``` bash
pkill -9 -t pts/0 
```

#### top 查看进程占用CPU超过100%(这里显示的是总和)
``` bash
在top情况下，按1，能显显每一个cpu的占用情况 
Tasks: 347 total,   2 running, 345 sleeping,   0 stopped,   0 zombie
%Cpu0  : 27.9 us,  6.0 sy,  0.0 ni, 60.1 id,  0.0 wa,  0.0 hi,  6.0 si,  0.0 st
%Cpu1  : 25.2 us,  6.4 sy,  0.0 ni, 68.1 id,  0.0 wa,  0.0 hi,  0.3 si,  0.0 st
%Cpu2  : 18.1 us,  5.0 sy,  0.0 ni, 76.9 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu3  : 22.3 us,  2.4 sy,  0.0 ni, 75.3 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu4  : 21.1 us,  3.7 sy,  0.0 ni, 74.6 id,  0.3 wa,  0.0 hi,  0.3 si,  0.0 st
%Cpu5  : 15.1 us,  4.4 sy,  0.0 ni, 80.5 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu6  :  9.9 us,  4.8 sy,  0.0 ni, 84.6 id,  0.0 wa,  0.0 hi,  0.7 si,  0.0 st
%Cpu7  : 16.3 us,  3.7 sy,  0.0 ni, 79.7 id,  0.0 wa,  0.0 hi,  0.3 si,  0.0 st
KiB Mem:  33021532 total, 32550000 used,   471532 free,    75840 buffers
KiB Swap: 33554428 total,  1985672 used, 31568756 free,  3327992 cached
```

#### nohup 自定义日志输出
``` bash
nohup xxxxx(your command) > xxxx.log(your log file) 2>&1 &
ex:
nohup python test.py > python_test.log 2>&1 &
```

#### 修改root密码
``` bash
sudo passwd root
```

#### awk分割字符串，查看指定参数
``` bash
tail -f /var/log/nginx/xxxx.log | awk '{split($9, a, "skip"); split(a[2], b, "&");print b[1]}'
```

#### awk打印nginx skip超过指定数字的请求
``` bash
sudo tail -f /var/log/nginx/*.log | grep skip | awk '{split($9, a, "skip=");split(a[2], b, "&"); if(b[1]>2000){print b[1], $7, $8, $9}}'
```

#### /etc/cron.d/ crontab 按秒执行脚本(每十秒执行一次)
``` bash
* * * * * yourusername  /bin/date >>/home/yada/temp/date.txt
* * * * * yourusername sleep 10; /bin/date >>/home/yourusername/temp/date.txt
* * * * * yourusername sleep 20; /bin/date >>/home/yourusername/temp/date.txt
* * * * * yourusername sleep 30; /bin/date >>/home/yourusername/temp/date.txt
* * * * * yourusername sleep 40; /bin/date >>/home/yourusername/temp/date.txt
* * * * * yourusername sleep 50; /bin/date >>/home/yourusername/temp/date.txt
```


