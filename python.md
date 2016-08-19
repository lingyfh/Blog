#### linux install pip 
[pip.pypa.io](https://pip.pypa.io/en/stable/installing/)
* wget https://bootstrap.pypa.io/get-pip.py
* python get-pip.py
* done

#### install lxml 出错 fatal error: libxml/xmlversion.h: No such file or directory
* apt-get install libxml2-dev libxslt1-dev 安装缺失的库
* pip install lxml 
