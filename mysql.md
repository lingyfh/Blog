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

#### python 操作mysql 
``` bash
import MySQLdb

if __name__ == '__main__':
    conn = MySQLdb.connect(db='mysql', host='localhost', user='root', passwd='', port=3306, charset='utf8')
    cursor = conn.cursor()
    cursor.execute("SELECT id, user_id FROM tencent WHERE user_id = " + 'xxxxx')
    user_info = cursor.fetchone()
    print user_info
```

#### brew install mysql  配置密码
``` bash
mysql.server start 启动
mysql_secure_installation 配置
```
