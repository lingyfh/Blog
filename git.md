
### 本地强制覆盖线上代码（操作需要谨慎，本地先备份）
* git push --force origin master

### 多次commit合并为一次
``` bash
执行merge操作
git merge dev --squash
git status 可以看到合并的代码
git commit
```

### git 配置颜色
``` bash
git config --global color.status auto
git config --global color.diff auto
git config --global color.branch auto
git config --global color.interactive auto
```

### git 忽略已经提交的文件
``` bash
git rm --cached xxxx

update .gitignore
git commit 
```

### git 撤销mergeing
``` bash
git reset --hard HEAD
```

### git 撤销commit 保留更改
``` bash
git reset --soft commit_version
```
