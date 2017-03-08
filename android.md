
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
  
