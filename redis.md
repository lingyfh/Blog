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

* redis slowlog [redis 性能分析](http://www.zmonster.me/2015/12/16/redis-performance-analysis.html)
``` bash
# 按时间排序，最新在最前面
127.0.0.1:6379> slowlog get 2 （默认10）
 1) 1) (integer) 194158 (日志序号)
    2) (integer) 1487304004 （时间 date -d @1487304004 转换为年月日）
    3) (integer) 15934 （消耗时间us）
    4) 1) "ZREMRANGEBYRANK" (redis操作)
       2) "flow_homeimage"
       3) "20000"
       4) "30000"
 2) 1) (integer) 194157
    2) (integer) 1487303764
    3) (integer) 13251
    4) 1) "ZREMRANGEBYRANK"
       2) "flow_homeimage"
       3) "20000"
       4) "30000"
```

* redis-cli --latency 查看redis 操作延迟

* [redis runtime 修改配置](https://redis.io/commands/config-set)
``` hash 
127.0.0.1:6379>CONFIG SET SAVE "900 1 300 10"
OK
```

* redis 统计
``` bash
# 查看内存占用大的key
redis-cli --bigkeys
```

