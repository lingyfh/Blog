## jar和aar类型文件压缩处理
> jar cvf fix.g.e.aar（目标aar） -C unzio_aar(要压缩文件夹) .
## 解压aar
> unzip xxx.aar -d xxxxx_unzip_dir/

## apktool 反编译报错：No resource identifier found for attribute 'compileSdkVersion' in package 'android'
> 新建任意空文件夹 mkdir framework <br/>
> apktool b apkDir -p framework -o apkDir_build.apk
