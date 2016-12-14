
#### 查看当前的表
``` bash
list
list 'nice*'
```

#### 命令帮助
``` bash
help 'list'
```

#### disable 多个Table
``` bash
Ex: table name

nice.good.20161101
nice.good.20161102
nice.good.20161201

disable_all 'nice.good.201611.*'
will disable 2 tables
````



#### drop 多个Table
``` bash
Ex: table name

nice.good.20161101
nice.good.20161102
nice.good.20161201

drop_all 'nice.good.201611.*'
will drop 2 tables
````


