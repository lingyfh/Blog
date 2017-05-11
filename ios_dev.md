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

#### 打开系统WiFi设置页
``` bash
NSURL *url = [NSURL URLWithString:@"prefs:root=WIFI"];
if ([[UIApplication sharedApplication] canOpenURL:url]) {
    [[UIApplication sharedApplication] openURL:url];
} else {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
}
```

#### 自定义cocoasPod安装
``` bash
$ mkdir -p $HOME/Software/ruby
$ export GEM_HOME=$HOME/Software/ruby
$ gem install cocoapods
[...]
1 gem installed
$ export PATH=$PATH:$HOME/Software/ruby/bin
$ pod --version
0.37.2
```

#### cocoasPod 默认source
source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/Artsy/Specs.git'

#### [sudo gem install cocoapods Operation not permitted - /usr/bin/xcodeproj](http://stackoverflow.com/a/30851030/1528524)解决办法
``` bash
# 错误信息
xxxx:newlight xxxx$ sudo gem install cocoapods
ERROR:  While executing gem ... (Errno::EPERM)
    Operation not permitted - /usr/bin/xcodeproj

# 使用以下命令安装
sudo gem install -n /usr/local/bin cocoapods  
```

#### 关闭
OS_ACTIVITY_MODE disable

#### Realm
Realm object has been deleted or invalidated
realm 对象delete之后不能再继续使用

#### isKindOf 使用
``` bash
[value isKindOfClass:[def classForCoder]]
此处classForCoder优于class
例：
NSArray *array_empty = @[] // [array_empty class] is __NSArray0
NSArray *array = @[@"123", @"123"] // [array class] is __NSArrayI
[array_empty classForCoder] is NSArray
[array classForCoder] is NSArray
```

#### 编码字符转换
``` bash
# gbk转utf-8
NSURLResponse * _Nullable response
response.textEncodingName(gbk)
NSData * _Nullable data
NSString *string = [[NSString alloc] initWithData:data encoding:CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000)];
```
