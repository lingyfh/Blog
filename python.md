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
