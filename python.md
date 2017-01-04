#### linux install pip 
[pip.pypa.io](https://pip.pypa.io/en/stable/installing/)
* wget https://bootstrap.pypa.io/get-pip.py
* python get-pip.py
* done

#### install lxml 出错 fatal error: libxml/xmlversion.h: No such file or directory
* apt-get install libxml2-dev libxslt1-dev 安装缺失的库
* pip install lxml 


#### python 独立的运行环境（virtualenv虚拟工作目录）[virtualenv pypa](https://virtualenv.pypa.io/en/stable/)
* pip install virtualenv
* virtualenv your_dir(目录地址)
* cd your_dir/bin
* source activate

#### 使用douban的源安装python pkg
* pip install redis -i http://pypi.douban.com/simple --trusted-host pypi.douban.com

#### PIL 库 IOError: decoder jpeg not available [While upgrading python imaging library (PIL), it tells me “JPEG support not available”](http://stackoverflow.com/a/20753643/1528524)
* 安装 pip install Pillow 解决

#### import Image error
``` bash
try:
    import Image
except Exception, e:
    from PIL import Image
```
