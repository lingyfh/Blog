#### 创建项目
1. pod lib create 'projectname' 

> projectname 将会是pod中的名字

#### 发布项目
1. pod lib lint xxx.podspec （检测是否存在错误）
>  xxx 为pod生成配置

2. 验证通过后，在git上打相应的tag 
3. pod trunk push xxx.podspec

[参考连接](http://www.pluto-y.com/cocoapods-contribute-for-open-source)
