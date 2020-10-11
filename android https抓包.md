
## 先决条件 手机Root

* 导出Charles抓包Https证书
> charles-proxy-ssl-proxying-certificate.pem

* 获取证收Hash
> openssl x509 -subject_hash_old -in ~/Downloads/charles-proxy-ssl-proxying-certificate.pem<br>
> 在输出的顶部有hash 如下<br>
> 11c1a416<br>
> -----BEGIN CERTIFICATE-----

* 将charles-proxy-ssl-proxying-certificate.pem重命名为11c1a416.0（取到的hash值，以.0为后缀），如果存在相同hash的文件，可以给.1为后缀

* 将重命名之后的文件，放到手机上
> adb push 11c1a416.0 /sdcard/

* 执行以下adb命令
> adb root<br>
> adb remount<br>
> adb shell<br>
> cp /sdcard/11c1a416.0 /etc/security/cacerts/<br>
> chmod 644 /etc/security/cacerts/11c1a416.0<br>

* 重要，一定要修改对应文件的权限，修改为644
* 重启手机后生效
