#### 预编译头文件
1. projectname-Prefix.pch
2. Build Settings -> Prefix Header -> projectname/pchname
ex : testproject/testproject-Prefix.pch

#### CocoasPod 
* CocoasPod SDWebImage库使用webplib格式图片
* CocoasPod 使用0.39.0版本，当前1.0~1.0.1版，会报引入异常
* 安装0.39.0版本 
    * sudo gem install cocoapods -v 0.39.0
    * 如果之前已经安装过高版本的，卸载重新安装0.39.0
    * sudo gem uninstall cocoapods

#### 检查是否使用IDFA
* grep -r advertisingIdentifier . 
