
#### terminal 命令行终端翻墙 [参考 如何上科学的网](http://www.d0u9.xyz/ru-he-shang-ke-xue-de-wang/)
* sshuttle 实行终端vps翻墙
    * 安装 brew install sshuttle
    * sshuttle -r username@sshserver:port 0.0.0.0/0 -vv
    * 防dns污染 sshuttle --dns -vvr username@sshserver:port 0/0
    * 本地端口12300被监听
* proxychains-ng命令代理 
    * 安装 brew install proxychains-ng
    * 测试 proxychains4 curl www.google.com
