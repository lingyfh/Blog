#### install convert
``` bash
sudo apt-get install ImageMagick
```

#### gif 压缩 [参考地址](https://segmentfault.com/a/1190000000436384)
``` bash
convert source.gif -layers Optimize dest.gif
convert test.gif -fuzz 15% -layers Optimize result.gif
```
