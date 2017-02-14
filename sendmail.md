#### debain 安装sendmail
``` bash
apt-get install sendmail-bin sensible-mda
```

#### sendmail python 发送邮件代码
``` bash
import smtplib
s = smtplib.SMTP("localhost")
tolist = ["xxxx@xxxx.com", "xxxx@xx.com"]

msg = '''\
... From: xxxx@xxxx.com
... Subject: test
... This is a test '''
s.sendmail("xxxx@xxxx.com", tolist, msg)
```

#### [QQ无法收到邮件, 邮件确实已经发送](http://support.qq.com/cgi-bin/content_new?tid=14612210602702165&num=10&order=0&fid=350&dispn=1&start=0&pn=1&gb=0)
``` bash
在QQ邮箱中自助查询，查询是否被拦截，被拦截的邮件并不会进入垃圾箱
```
