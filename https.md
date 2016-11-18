
### 自签名 [引用 自建证书配置HTTPS服务器](http://www.liuchungui.com/blog/2015/09/25/zi-jian-zheng-shu-pei-zhi-httpsfu-wu-qi/)

#### user-server https配置
* 自签名https证书
* 首先，生成私钥，创建请求证书，使用私钥对证书进行签名
``` bash
# -des3代表加上了加密，后面的2048是代表生成的密钥的位数，1024已经不是很安全
openssl genrsa -des3 -out private.key 2048
```

* 生成证书请求
``` bash
# 这一步需要填写一些信息，其中Common Name (e.g. server FQDN or YOUR name) []这个需要填写你的域名或服务器地址。
openssl req -new -key private.key -out server.csr
``` 

* 生成服务器的私钥，去除密钥口令
``` bash
openssl rsa -in private.key -out server.key
```

* 使用私钥为证书请求签名，生成给服务器签署的证书，格式是x509的PEM格式
``` bash
openssl x509 -req -in server.csr -out server.crt -outform pem -signkey server.key -days 3650
```
-outform pem指定证书生成的格式，默认是pem，所以这个命令也可以写作成
``` bash
sudo openssl x509 -req -in server.csr -out server.crt -signkey server.key -days 3650
```

* 在nginx中配置key,与crt证书路径
``` bash
ssl_certificate xxxxx.crt;
ssl_certificate_key xxxxx.key;
```

