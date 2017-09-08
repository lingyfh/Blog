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
