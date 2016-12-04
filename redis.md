#### 常用命令

* KEYS * 

> 查看所有的key

* TYPE key

> 查看key的类型

* ZCOUNT key -10000 10000

> 查看ZSET中的内容数量

* LLEN key 

> 查看list长度

* LTRIM key 0 10

> 删除key下标不在0-10的元素

* 删除指定KEYS 

> redis-cli -n 14 KEYS "201610*" | xargs redis-cli -n 14 DEL
