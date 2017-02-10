### 环境准备
mongodb已安装完成
mongod.conf 配置完成

### 启动mongodb 

``` bash
> cfg = {_id:"yourid", members:[{_id:0, host:"yourhost:27017", priority:1, hidden:false, tags:{"dc": "xxx"}, votes:1}]}
> rs.initiate(cfg)
```

等待standalone变化PRIMARY

### 增加节点

rs.add({host:"yourslavehost:27017", priority:1, hidden:false, votes:1, tags:{"dc": "xxxx"}})

### 配置完成
查看mongo日志

PRIMARY 
2017-02-10T11:02:53.315+0800 I REPL     [ReplicationExecutor] transition to RECOVERING
2017-02-10T11:02:53.316+0800 I REPL     [ReplicationExecutor] transition to SECONDARY
2017-02-10T11:02:53.316+0800 I REPL     [ReplicationExecutor] transition to PRIMARY

SECONDARY
2017-02-10T11:06:12.909+0800 I REPL     [ReplicationExecutor] transition to RECOVERING
2017-02-10T11:06:12.909+0800 I REPL     [ReplicationExecutor] transition to SECONDARY
2017-02-10T11:06:13.692+0800 I REPL     [ReplicationExecutor] could not find member to sync from
