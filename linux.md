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
