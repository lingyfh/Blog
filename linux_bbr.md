来源链接[https://qiaodahai.com](https://qiaodahai.com/the-bbr-congestion-control-algorithm-for-debian-ubuntu.html)

BBR目的是要尽量跑满带宽，并且尽量不要有排队的情况，效果并不比锐速差。

Linux kernel 4.9.x开始支持tcp_bbr，下面简单讲述如何在Debian/Ubuntu 64bit系统中升级kernel开启TCP BBR拥塞控制算法。

查看当前系统内核：
``` bash
uname -a
```

下载最新内核：Debian Kernel Ubuntu Kernel
``` bash
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.10.1/linux-image-4.10.1-041001-generic_4.10.1-041001.201702260735_amd64.deb
```

安装内核
``` bash
dpkg -i linux-image-4.10.1*.deb
```

删除其余内核或调整内核启动顺序
``` bash
dpkg -l|grep linux-image 
apt-get purge 旧内核
```

也可以不调整内核启动顺序，ubuntu 跟debian 都会默认4.10.x启动的。

更新 grub 系统引导文件并重启
``` bash
update-grub
reboot
```

查看当前系统内核
``` bash
uname -a
```

开启BBR
``` bash
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
```

保存生效
``` bash
sysctl -p
```

执行下面的命令，如果结果中有bbr, 则证明你的内核已开启BBR。
``` bash
sysctl net.ipv4.tcp_available_congestion_control
```

执行下面的命令，看到有 tcp_bbr 模块即说明BBR已启动。
``` bash
lsmod | grep bbr
```


