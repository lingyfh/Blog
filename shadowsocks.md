
#### 启动shadowsocks服务
``` bash
sudo ssserver -c /etc/shadowsocks/shadowsocks.json -d start
```

#### shadowsocks config file 
shadowsocks.json
``` bash
{
    "server":"x.x.x.x",
    "local_address":"127.0.0.1",
    "local_port":1080,
    "port_password":{
         "your want port":"passwordx",
         "your want port":"passwordx",
         "your want port":"passwordx",
         "your want port":"passwordx",
         "your want port":"passwordx",
         "your want port":"passwordx",
         "your want port":"passwordx"
    },
    "timeout":300,
    "method":"aes-256-cfb",
    "fast_open": false
}
```
