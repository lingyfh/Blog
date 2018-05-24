#### Mac环境

1. 开启Apache
> sudo apachectl start

2. 查看Apache版本
> httpd -v

3. 浏览器地址栏输入localhost，看到it works.表明Apache正常工作

4. 重启Apache
> sudo apachectl restart

5. 关闭Apache
> sudo apachectl stop

6. Apache中开启对php的支持
``` bash
sudo vim /etc/apache2/httpd.conf
查找php
放开对LoadModule php对应版本的支持
```

7. 查看Php版本
> php -v

8. 重启Apache
> sudo apachectl restart

9. 打开Apache WebServer文件夹，创建hello.php
``` bash
hello.php
<?php phpinfo(); ?>
```

10. 打开浏览器，输入localhost/hello，能看到相应的php信息则表明正确

11. Mac apache配置文件路径
``` bash
/etc/apache2/httpd.conf
```

12. 配置apache文件夹路径
``` bash
# DocumentRoot "/Library/WebServer/Documents"
# <Directory "/Library/WebServer/Documents">
DocumentRoot "/Users/yourusername/webserver"
<Directory "/Users/yourusername/webserver">
```
