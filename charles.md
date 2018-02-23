#### mac android https抓包
1. charles menu -> proxy -> SSL Proxying setting -> ssl proxying 
> enable ssl proxying 

> add *:443

2. charles menu -> help -> ssl proxying -> install Charles root certificate, and keychain trust it.

3. charles menu -> help -> ssl proxying -> save charles root certificate.
> adb push this certificate in sdcard

4. mobile install charles root certificate.
> xiaomi 

> setting -> more setting -> system security -> install certificate from disk.
