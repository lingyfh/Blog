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
