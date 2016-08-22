#### 查看进程自执行路径
* sudo ls -l /proc/PID

#### 命令行安装android sdk [参考 打造一个全命令行的Android构建系统](http://www.jianshu.com/p/1694ea9a3f90)
* wget https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
* tar xvzf android-sdk_r24.4.1-linux.tgz
* 配置环境变量（/etc/profile）
* android list sdk --all
* android update sdk -u -a -t 1,2,3 (安装123选项)
