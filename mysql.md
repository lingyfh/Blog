### 解决Mac安装mysql无法进入问题

#### ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: NO)

#### 解决方法
1. cd /usr/local/mysql/bin
2. sudo su
3. ./mysqld_safe --skip-grant-tables &
4. ./mysql
5. update user set authentication_string='xx' where User='root';
