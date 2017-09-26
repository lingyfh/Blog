### 解决Mac安装mysql无法进入问题

#### ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: NO)

#### 解决方法
1. cd /usr/local/mysql/bin
2. sudo su
3. ./mysqld_safe --skip-grant-tables &
4. ./mysql
5. update user set authentication_string='xx' where User='root';


### python 读取 mysql 中文乱码

#### 建立链接时设置编码方式
``` bash
conn = MySQLdb.connect(db='mysql', host='localhost', user='root', passwd='', port=3306, charset='utf8')
```
