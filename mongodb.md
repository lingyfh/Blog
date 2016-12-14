#### 停止mongodb服务
* 进入mongo 
* use admin (or mongo admin)
* db.shutdownServer()

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
