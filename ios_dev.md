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

#### Could not build module 'xxxx' (xxxx is name of framework)
you should delete DerivedData dir.
1. where?
``` bash
you can go to File > Workspace Settings.
you can see a dialog. click 'ringht arrow'. you'ill go into a dir.
```

2. delete all files in DerivedData.

#### 下载图片保存到相册，无日志crash
在info.plist中，增加权限说明
Privacy - Photo Library Usage Description

#### OC项目中使用swift
``` bash
1. 在OC项目是新建swift文件，会提示自动生成bridging头文件（projectname-Bridging-Header.h）
2. 在Targets Build Settings中，会生成Swift Compiler-General下， Objective-C Bridging Header配置
projectname/xxxxx/projectname-Bridging-Header.h
3. 在使用时，引入头文件。projectname-Swift.h
#import "xxxx-Swift.h"
编译成功即可正常使用
```

#### valueForKeyPath
``` bash
# 数组快速计算数组求和、平均数、最大值、最小值
NSArray *array = @[@1, @2, @3, @4, @10];
NSNumber *sum = [array valueForKeyPath:@"@sum.self"];
NSNumber *avg = [array valueForKeyPath:@"@avg.self"];
NSNumber *max = [array valueForKeyPath:@"@max.self"];
NSNumber *min = [array valueForKeyPath:@"@min.self"];

# 或者指定输出类型
NSNumber *sum = [array valueForKeyPath:@"@sum.floatValue"];
NSNumber *avg = [array valueForKeyPath:@"@avg.floatValue"];
NSNumber *max = [array valueForKeyPath:@"@max.floatValue"];
NSNumber *min = [array valueForKeyPath:@"@min.floatValue"];
```

#### iOS ping simple 
``` bash
https://developer.apple.com/library/content/samplecode/SimplePing/Introduction/Intro.html#//apple_ref/doc/uid/DTS10000716-Intro-DontLinkElementID_2
```

#### CollectionView reloadData调用过多会导致空白

#### 右滑返回

``` bash
self.navigationController.interactivePopGestureRecognizer.delegate = self;
<UIGestureRecognizerDelegate>
```

#### 升级cocoapods
``` bash
sudo gem install cocoapods
```
   
