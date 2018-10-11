
#### 命令行生成签名文件
1. keytool -genkey -alias myalias(别名) -keyalg RSA(加密方式) -validity 20000(有效时间，单位天) -keystore myaaa.keystore(文件名)


    输入密钥库口令:  
    再次输入新口令:  
    您的名字与姓氏是什么?  
     [Unknown]:  king  
    您的组织单位名称是什么?  
     [Unknown]:  kingxxx.com  
    您的组织名称是什么?  
     [Unknown]:  kingxxx.com  
    您所在的城市或区域名称是什么?  
     [Unknown]:  Beijing  
    您所在的省/市/自治区名称是什么?  
     [Unknown]:  Beijing  
    该单位的双字母国家/地区代码是什么?  
     [Unknown]:  86  
    CN=king, OU=kingxxx.com, O=kingxxx.com, L=Beijing, ST=Beijing, C=86是否正确?  
     [否]:  y  

2. 查看生成keystore


    keytool -list -keystore "myaaa.keystore"


3. 命令行签名apk 


    jarsigner -verbose -keystore myaaa.keystore -signedjar singggg.apk(签名输出apk) unsign.apk(被签名apk) myalias(别名)  
    报错：jarsigner: 无法对 jar 进行签名: java.util.zip.ZipException: invalid entry compressed size (expected 18246 but got 18572 bytes)
    说明该apk并不是未签名的apk  
    删除apk下原有签名  
      **zip -d xxxx.apk META-INF/***  
    JDK 1.7下如果签名完成后不能安装，请增加-digestalg SHA1 -sigalg MD5withRSA参数  
    jarsigner -verbose **-digestalg SHA1 -sigalg MD5withRSA** -keystore myaaa.keystore -signedjar singggg.apk(签名输出apk) xxxxxx.apk(被签名apk) myalias  
    
4. 查看keystore md5 sha1等信息
    


    keytool -list -v -keystore xxx.keystore 

  
#### ClassyShark打开apk  
``` bash
java -jar ClassyShark.jar -open xxxx.apk
```

#### 判断一个服务是否在运行[stackoverflow](https://stackoverflow.com/a/5921190/1528524)
``` bash
Ex: isMyServiceRunning(MyService.class)
private boolean isMyServiceRunning(Class<?> serviceClass) {
    ActivityManager manager = (ActivityManager) getSystemService(Context.ACTIVITY_SERVICE);
    for (RunningServiceInfo service : manager.getRunningServices(Integer.MAX_VALUE)) {
        if (serviceClass.getName().equals(service.service.getClassName())) {
            return true;
        }
    }
    return false;
}
```

#### MediaPlayer
``` bash
mediaplay.setDataSource
call mediaplay.reset()
```

#### fragment中使用FragmentPagerAdapter，并存在多个viewpager时，注意FragmentManager的使用
``` bash
getChildFragmentManager()
```

#### android tools name space
``` bash
xmlns:tools="http://schemas.android.com/tools"
```

#### litepal 
修改DB文件到sdcard
``` bash
修改litepal.xml
<storage value="external" />
存储路径，/sdcard/Android/data/package_name/files/databases
```

#### 精确alarm manager
``` bash
int repeatTime = 60 * 1000;
AlarmManager am = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);
am.setExact(AlarmManager.RTC, System.currentTimeMillis() + repeatTime, pi);
```

#### 更新widget
``` bash
RemoteViews views = new RemoteViews(context.getPackageName(), R.layout.layout_id_xxxx);
views.setTextViewText(R.id.view_id_xxxxx, "" + System.currentTimeMillis());

AppWidgetManager manager = AppWidgetManager.getInstance(context.getApplicationContext());
ComponentName componentName = new ComponentName(context.getApplicationContext(), MarketAppWidget.class);
manager.updateAppWidget(componentName, views);
```

#### 查看app布局情况
``` bash
Android Device Monitor
```

#### gradle 插件版本 google [官方说明](https://developer.android.com/studio/releases/gradle-plugin.html)
``` bash
classpath 'com.android.tools.build:gradle:2.2.2'
```
gradle 4.6版与插件版本2.2.2不兼容。升级插件版本到2.3.3兼容
``` bash
classpath 'com.android.tools.build:gradle:2.3.3'
```

Plugin version | Required Gradle version
---------------|------------------------
1.0.0 - 1.1.3	|2.2.1 - 2.3
1.2.0 - 1.3.1	|2.2.1 - 2.9
1.5.0	        |2.2.1 - 2.13
2.0.0 - 2.1.2	|2.10 - 2.13
2.1.3 - 2.2.3	|2.14.1+
2.3.0+	        |3.3+
3.0.0+	        |4.1+
3.1.0+	        |4.4+

#### 获取anr日志
``` bash
adb pull /data/anr/traces.txt ~/Desktop/
```

#### adb wifi debug
1. 通过数据线连接电脑
``` bash
adb tcpip 5555
```
2. 连接手机
``` bash 
adb connect your_phone_ip
```

#### adb 多个设备操作
``` bash
adb -s deviceid adb_cmd
```

#### gradle 自定义 BuildConfig
``` bash
android {
    buildTypes {
        debug {
            buildConfigField "boolean", "yourconfig", "true"
        }
    }
}

// BuildConfig
BuildConfig.yourconfig will true
```

#### google play下架app
定价和分发范围 -> 取消发布 -> 保存更新


#### gradle 查看库相关依赖
``` bash
gradle project_name:dependencies
```
 

#### apk signer [签署您的应用](https://developer.android.com/studio/publish/app-signing)
``` bash
keytool -genkey -v -keystore my-release-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias my-alias
apksigner sign --ks my-release-key.jks --out my-app-release.apk my-app-unsigned-aligned.apk
```

#### adb push file to Read-only file system
``` bash
adb root

adb remount
```

adb push xxx system/bin

#### mac install adb
``` bash
brew cask install android-platform-tools
```
