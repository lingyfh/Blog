
#### terminal 命令行终端翻墙 [参考 如何上科学的网](http://www.d0u9.xyz/ru-he-shang-ke-xue-de-wang/)
* sshuttle 实行终端vps翻墙
    * 安装 brew install sshuttle
    * sshuttle -r username@sshserver:port 0.0.0.0/0 -vv
    * 防dns污染 sshuttle --dns -vvr username@sshserver:port 0/0
    * 本地端口12300被监听
* proxychains-ng命令代理 
    * 安装 brew install proxychains-ng
    * 测试 proxychains4 curl www.google.com
   
* git配置socks5代理，命令行输入以下命令
``` bash
git config --global http.proxy socks5://127.0.0.1:1080
```
* curl 配置socks5代理
在用户根目录下，创建文件.curlrc写入
``` bash
socks5 = "127.0.0.1:1080"
```


