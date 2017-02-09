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

* python redis 
``` bash
# 查看key过期时间
r = redis.Redis()
r.ttl(key)
# 设置key过期时间
r.expire(key, time) 单位秒
datetime = datetime.datetime(2016, 12, 6, 11, 28, 10)
r.expireat(key, datetime) key会在2016年12月6日11点28分10秒过期
```

* redis 查看key ttl(过期时间)
``` bash
TTL xxx(key)
```
