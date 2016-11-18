
#### terminal 中文乱码问题
1. 在用户目录下.bash_profile中增加 export LANG=zh_CN.UTF-8
2. soruce .bash_profile
3. 重新开一个terminal后中文显示正常

#### 修改Hostname
1. sudo scutil --set HostName name-you-want

#### mac 清除dns缓存
``` bash
sudo killall -HUP mDNSResponder
```

#### 使用dnsmasq搭建dns服务器[参考用Mac打造自己的DNS服务器](http://www.jianshu.com/p/3dd22d7d86b2)
* install dnsmasq
``` bash
brew install dnsmasq
```
* 配置
``` bash
cp /usr/local/opt/dnsmasq/dnsmasq.conf.example /usr/local/etc/dnsmasq.conf
```

将以下配置写入dnsmasq.conf中
``` bash
resolv-file=/etc/resolv.conf
strict-order
listen-address=127.0.0.1
cache-size=32768
# 固定将域名指定ip
address=/test.lignyfh.com/192.168.0.39
```
* 将dnsmasq设置为开机启动
``` bash
sudo cp -fv /usr/local/opt/dnsmasq/*.plist /Library/LaunchDaemons
sudo lauchctl load /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
```

如果修改了dnsmasq.conf,文件，那么需要重启dns服务
``` bash
sudo launchctl stop homebrew.mxcl.dnsmasq
sudo launchctl start homebrew.mxcl.dnsmasq
```


