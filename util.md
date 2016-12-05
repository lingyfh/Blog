
#### install htpasswd
* sudo apt-get install apache2-utils

#### htpasswd常用命令
``` bash 
-c：创建一个加密文件； 
-n：不更新加密文件，只将加密后的用户名密码显示在屏幕上； 
-m：默认采用MD5算法对密码进行加密； 
-d：采用CRYPT算法对密码进行加密； 
-p：不对密码进行进行加密，即明文密码； 
-s：采用SHA算法对密码进行加密； 
-b：在命令行中一并输入用户名和密码而不是根据提示输入密码； 
-D：删除指定的用户。
```

* htpasswd -b xxxx(加密文件，ex:.htpasswd) username password 创建新用户
* htpasswd -D xxxx(加密文件) username 删除用户
* htpasswd -bc xxxx username password (创建加密文件，并增加用户)

#### chrome clear dns cache
* chrome://net-internals/#dns
