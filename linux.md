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

