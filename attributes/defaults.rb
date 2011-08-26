default[:passenger][:version] = "3.0.8"
default[:nginx][:source][:url] = "http://nginx.org/download/nginx-"
default[:nginx][:source][:version] = "1.0.5"
default[:nginx][:source][:checksum] = "b8c6df4e55a41425b57ba0de5ed8a84722dceb0eb7fbb4123f7f8f314763c8df"
default[:nginx][:prefix_dir] = "/usr"
default[:nginx][:base_dir] = "/var/lib/nginx"

default[:nginx][:compile_options]['conf-path'] = '/etc/nginx/nginx.conf'
default[:nginx][:compile_options]['error-log-path'] = '/var/log/nginx/error.log'
default[:nginx][:compile_options]['pid-path'] = '/var/run/nginx.pid'
default[:nginx][:compile_options]['lock-path'] = '/var/lock/nginx.lock'
default[:nginx][:compile_options]['http-log-path'] = '/var/log/nginx/access.log'
default[:nginx][:compile_options]['http-client-body-temp-path'] = '/var/lib/nginx/body'
default[:nginx][:compile_options]['http-proxy-temp-path'] = '/var/lib/nginx/proxy'
default[:nginx][:compile_options]['http-fastcgi-temp-path'] = '/var/lib/nginx/fastcgi'
default[:nginx][:compile_options]['with-http_stub_status_module'] = true
default[:nginx][:compile_options]['with-http_ssl_module'] = true
default[:nginx][:compile_options]['with-http_gzip_static_module'] = true
default[:nginx][:compile_options]['with-file-aio'] = true

default[:nginx][:conf][:worker_processes] = 1
