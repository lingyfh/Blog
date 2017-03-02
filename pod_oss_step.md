#### 创建项目
1. pod lib create 'projectname' 

> projectname 将会是pod中的名字

#### 发布项目
* 向cocopods 注册用户
``` bash
pod trunk register youremail 'your nickname' --description='device desc'
在邮件里确认设备登陆
pod trunk me （查看信息记录）
```
* pod lib lint xxx.podspec （检测是否存在错误）
>  xxx 为pod生成配置

* 验证通过后，在git上打相应的tag 
* pod trunk push xxx.podspec

[参考连接](http://www.pluto-y.com/cocoapods-contribute-for-open-source)
