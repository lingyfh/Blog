
### 本地强制覆盖线上代码（操作需要谨慎，本地先备份）
* git push --force origin master

### 多次commit合并为一次
``` bash
执行merge操作
git merge dev --squash
git status 可以看到合并的代码
git commit
```
