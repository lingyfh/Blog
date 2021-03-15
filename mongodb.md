#### 整理mongodb磁盘空间
* use your_db
* db.runCommand({compact: 'your_collection_name'})
* 注意数据库备份
* [MongoDB如何释放空闲空间](https://zhuanlan.zhihu.com/p/38979077)
> How do I reclaim disk space in WiredTiger?
The WiredTiger storage engine maintains lists of empty records in data files as it deletes documents. This space can be reused by WiredTiger, but will not be returned to the operating system unless under very specific circumstances.
> The amount of empty space available for reuse by WiredTiger is reflected in the output of db.collection.stats() under the heading wiredTiger.block-manager.file bytes available for reuse.
> To allow the WiredTiger storage engine to release this empty space to the operating system, you can de-fragment your data file. This can be achieved using the compact command. For more information on its behavior and other considerations, see compact.

* [compact](https://docs.mongodb.com/manual/reference/command/compact/#dbcmd.compact)


#### 停止mongodb服务
* 进入mongo 
* use admin (or mongo admin)
* db.shutdownServer()
* db.shutdownServer({timeoutSecs: 60})

#### 强制修改mongodb配置
``` bash
cfg = rs.conf()
cfg.members[0].priority = 0.5
cfg.members[1].priority = 0.5
cfg.members[2].priority = 1
rs.reconfig(cfg)
# 强制修改（当没有master存在时执行）
rs.reconfig(cf, {"force": true})
```

#### mongodb db 运行
``` bash
numactl --interleave=all mongod --config xxxxxxxx(configpath) --fork
```

#### mongodb 增加仲裁节点
``` bash
mongod --port 30000 --dbpath /data/arbiter --replSet rs

rs.addArb("host:30000")
```

#### mongodb 切换master
``` bash
修改rs.config()中members中的priority即可
rs.stepDown() 方法将当前master，下线，并且在一定时间不当选为master
注意集群中的votes
App适配情况
```


#### group
db.xxxx.aggregate([{$group: {_id: "$uid", count:{$sum:1}}}, {$sort:{count: -1}}]).pretty()

#### pymongo
``` bash
pymongo 2.5 与 2.7.1 兼容
```

#### mongodump & mongorestore
[mongorestore](https://docs.mongodb.com/v3.0/reference/program/mongorestore/)

[mongodump](https://docs.mongodb.com/v3.0/reference/program/mongodump/)
``` bash
mongodump  --db test --collection collection
mongorestore --collection people --db accounts dump/accounts/people.bson
```

#### create index
```bash
db.collection_name.createIndex({key: 1}, {background: true})
```
