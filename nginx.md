#### nginx: worker process is shutting down
* nginx -s reload,进入平滑启动模式，维护已有连接的nginx会进入，nginx: worker process is shutting down状态

#### nginx 配置auth
``` bash
location / {
        auth_basic "Need login";
        auth_basic_user_file xxxxxxxx(passwd file path);

        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host;
        proxy_set_header X-NginX-Proxy true;
        proxy_redirect off;
        proxy_pass http://xxxxxx;
        
    }
```

#### nginx default配置
``` bash
# default.conf
server {

  listen 80 default_server;

  access_log /var/log/nginx/default_server.log main;
  error_log /var/log/nginx/default_server.err;

  location / {
    return 403;
  }
}
```

#### proxy_cache_bypass
``` bash
         #set $no_cache false;
         if ($http_session_id != "") {set $no_cache true;}

         proxy_cache_bypass $no_cache;
```

#### cache
``` bash
proxy_cache_path /dev/shm/video_wallpaper/cache levels=1:2 keys_zone=cache_key_xxx:50m inactive=60m max_size=128m;

         proxy_cache cache_key_xxxx;
         proxy_cache_methods GET;
         proxy_cache_key "$scheme$proxy_host$request_uri";
         proxy_cache_valid 10m;
         add_header X-Cached $upstream_cache_status;
         
```
#### Lua写入Redis

``` bash
    location =/save_redis {
        content_by_lua_block {
            local redis = require "resty.redis"
            local red = redis:new()
            red:connect("127.0.0.1", 6379)
            local replaced_str = string.gsub(ngx.var.request_uri, "xxxxx", "")
            replaced_str = string.gsub(replaced_str, "xxxx", "")
            local index_params = string.find(replaced_str, "?")
            local redis_key = "your_key_prefix"..'-'..os.date("%Y-%m-%d", os.time())
            local save_word = string.gsub(string.sub(replaced_str, 0, index_params), "?", "")
            red:zincrby(redis_key, 1, save_word)
            red:expire(redis_key, 86400)
            red:set_keepalive(10000, 100)
        }
     }
     location ~ '^/v1/resource' {
        if ($http_user_agent ~* "wget") {return 403;}

        srcache_store PUT /save_redis key=$request_uri&exptime=600;

        proxy_pass_header Server;
        proxy_set_header Host $http_host;
        proxy_redirect off;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Scheme $scheme;
        proxy_pass http://app_servers;
    }
```

#### nginx ssl
``` bash
certbot
```

#### 统计文件行数
``` bash
wc -l xxxx.log
-c 字节数
-w 字数
-l 行数
```

#### 按行分割文件
``` bash
sed -n '1000, 2000p' xxxxx.log > xxxx.temp.log
start 1000
end   2000
```

#### nginx调优
``` bash
sudo vi /etc/sysctl.conf
sudo sysctl -p

#optimize
net.ipv4.netfilter.ip_conntrack_max = 393216
net.ipv4.netfilter.ip_conntrack_tcp_timeout_established = 30
net.ipv4.netfilter.ip_conntrack_tcp_timeout_time_wait = 120
net.ipv4.netfilter.ip_conntrack_tcp_timeout_close_wait = 60
net.ipv4.netfilter.ip_conntrack_tcp_timeout_fin_wait = 120

```

#### nginx单位时间内流量
``` bash
grep 12/Mar/2018:19:53 xxxx.log | awk '{SUM +=$16} END {print SUM}'
```




