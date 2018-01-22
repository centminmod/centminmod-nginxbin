Benchmarks 22/01/18
===

Benchmarks using forked version of `wrk` [https://github.com/centminmod/wrk/tree/centminmod](https://github.com/centminmod/wrk/tree/centminmod).

Compiled on CentOS 7.4 64bit system at using Intel Core i7 4790K.

* `nginx-gcc8-cfzlib` - GCC 8 snapshot built Centmin Mod Nginx 1.13.8 web server + [Cloudflare zlib performance patch](https://github.com/cloudflare/zlib)
* `nginx-gcc721-cfzlib` -  GCC 7.2.1 built Centmin Mod Nginx 1.13.8 web server + [Cloudflare zlib performance patch](https://github.com/cloudflare/zlib)
* `nginx-gcc631-cfzlib` - GCC 6.3.1 built Centmin Mod Nginx 1.13.8 web server + [Cloudflare zlib performance patch](https://github.com/cloudflare/zlib)
* `nginx-gcc531-cfzlib` - GCC 5.3.1 built Centmin Mod Nginx 1.13.8 web server + [Cloudflare zlib performance patch](https://github.com/cloudflare/zlib)
* `nginx-gcc485-cfzlib` - GCC 4.8.5 built Centmin Mod Nginx 1.13.8 web server + [Cloudflare zlib performance patch](https://github.com/cloudflare/zlib)
* `nginx-clang6-cfzlib` - Clang 6.0.0 snapshot built Centmin Mod Nginx 1.13.8 web server + [Cloudflare zlib performance patch](https://github.com/cloudflare/zlib)
* `nginx-clang501-cfzlib` - Clang 5.0.1 snapshot built Centmin Mod Nginx 1.13.8 web server + [Cloudflare zlib performance patch](https://github.com/cloudflare/zlib)
* `nginx-clang401-cfzlib` - Clang 4.0.1 built Centmin Mod Nginx 1.13.8 web server + [Cloudflare zlib performance patch](https://github.com/cloudflare/zlib)
* `nginx-clang342-cfzlib` - unable to compile due to errors with Cloudflare Zlib patch and Clang 3.4.2. Centmin Mod will fallback to Clang 4.0.1 if `CLANG='y'` set or fallback to GCC if `CLANG='n'` set
* `nginx-gcc8` - GCC 8 snapshot built Centmin Mod Nginx 1.13.8 web server
* `nginx-gcc721` - GCC 7.2.1 built Centmin Mod Nginx 1.13.8 web server
* `nginx-gcc631` - GCC 6.3.1 built Centmin Mod Nginx 1.13.8 web server
* `nginx-gcc531` - GCC 5.3.1 built Centmin Mod Nginx 1.13.8 web server
* `nginx-gcc485` - GCC 4.8.5 built Centmin Mod Nginx 1.13.8 web server
* `nginx-clang6` - Clang 6.0.0 snapshot built Centmin Mod Nginx 1.13.8 web server
* `nginx-clang501` - Clang 5.0.1 snapshot built Centmin Mod Nginx 1.13.8 web server
* `nginx-clang401` - Clang 4.0.1 built Centmin Mod Nginx 1.13.8 web server
* `nginx-clang342` - Clang 3.4.2 built Centmin Mod Nginx 1.13.8 web server

Test Parameters
===

* t3 = 3 threads
* c600 = 600 users
* d60s = 60 second test duration
* breakout = show CONNECT, TTFB, TTLB thread stats
* Accept-Encoding: gzip = request gzip compressed resource (tests Nginx's zlib performance standard vs Cloudflare zlib performance patch)
* scripts/setup.lua = report per thread request and response total stats

```
/usr/local/bin/wrk-cmm -t3 -c600 -d60s --breakout -H 'Accept-Encoding: gzip' -s scripts/setup.lua http://localhost/
```

wrk Results
===

![](/benchmarks/nginx-compiler-benchmarks-220118/chart1.png)

| Nginx Config | Req/s |  Thread 1 Req | Thread 1 Resp |  Thread 2 Req | Thread 2 Resp |  Thread 3 Req | Thread 3 Resp |  Total Threads Req | Total Threads Resp |  Avg Latency (ms) | Max Latency (ms)
| --- | --- |  --- | --- |  --- | --- |  --- | --- |  --- | --- |  --- | ---
| nginx-clang342 | 47134.08 |  934853 | 934659 |  931701 | 931503 |  966044 | 965846 |  Total Threads Req | Total Threads Resp |  11.59| 96.81
| nginx-clang401 | 48922.71 |  994152 | 993951 |  967786 | 967588 |  976353 | 976154 |  Total Threads Req | Total Threads Resp |  11.35 | 109.00
| nginx-clang501 | 48301.24 |  956973 | 956773 |  964148 | 963984 |  980679 | 980553 |  Total Threads Req | Total Threads Resp |  11.25 | 98.96
| nginx-clang6 | 49120.42 |  1020099 | 1019911 |  952318 | 952120 |  979781 | 979649 |  Total Threads Req | Total Threads Resp |  11.40 | 110.03
| nginx-gcc485 | 48710.11 |  964719 | 964639 |  962278 | 962100 |  997852 | 997706 |  Total Threads Req | Total Threads Resp |  11.25 | 151.88
| nginx-gcc531 | 49305.56 |  986784 | 986586 |  983572 | 983376 |  990742 | 990544 |  Total Threads Req | Total Threads Resp |  11.25 | 115.18
| nginx-gcc631 | 48934.98 |  1014397 | 1014197 |  954473 | 954273 |  972022 | 971836 |  Total Threads Req | Total Threads Resp |  11.29 | 107.48
| nginx-gcc721 | 49194.71 |  952032 | 951864 |  1021887 | 1021688 |   982547 | 982404 |  Total Threads Req | Total Threads Resp |  11.06 | 124.10
| nginx-gcc8 | 49052.53 |  1032737 | 1032552 |  958271 | 958115 |  957353 | 957154 |  Total Threads Req | Total Threads Resp |  11.25 | 106.98
| nginx-clang401-cfzlib | 60080.29 |  1202435 | 1202374 |  1218398 | 1218272 |  1184578 | 1184558 |  Total Threads Req | Total Threads Resp |  9.48 | 83.55
| nginx-clang501-cfzlib | 59858.31 |  1187757 | 1187558 |  1214914 | 1214724 |  1194567 | 1194368 |  Total Threads Req | Total Threads Resp |  9.76 | 99.05
| nginx-clang6-cfzlib | 60935.30 |  1229099 | 1228914 |  1216305 | 1216107 |  1216964 | 1216893 |  Total Threads Req | Total Threads Resp |  9.37 | 75.23
| nginx-gcc485-cfzlib | 59469.71 |  1180397 | 1180309 |  1188177 | 1188078 |  1204639 | 1204442 |  Total Threads Req | Total Threads Resp |  9.62 | 112.14
| nginx-gcc531-cfzlib | 60258.10 |  1143884 | 1143683 |  1268216 | 1268054 |  1208024 | 1207924 |  Total Threads Req | Total Threads Resp |  9.56 | 108.15
| nginx-gcc631-cfzlib | 60234.86 |  1178666 | 1178466 |  1249928 | 1249787 |  1191667 | 1191630 |  Total Threads Req | Total Threads Resp |  9.65 | 116.94
| nginx-gcc721-cfzlib | 60408.18 |  1226444 | 1226244 |  1181644 | 1181446 |  1222316 | 1222131 |  Total Threads Req | Total Threads Resp |  9.64 | 118.25
| nginx-gcc8-cfzlib | 60155.73 |  1198502 | 1198308 |  1211573 | 1211374 |  1205257 | 1205059 |  Total Threads Req | Total Threads Resp |  9.57 | 114.88

```
./bench.sh 


-----------------------------------------------------------------------------------
./nginx-clang342 -V
nginx version: nginx/1.13.8 built by clang 3.4.2 built with OpenSSL 1.1.0g TLS SNI support enabled
configure arguments: --with-ld-opt='-L/usr/local/lib -ljemalloc -Wl,-z,relro -Wl,-rpath,/usr/local/lib' --with-cc-opt='-I/usr/local/include -m64 -mtune=native -DTCP_FASTOPEN=23 -g -O3 -fstack-protector -fuse-ld=gold --param=ssp-buffer-size=4 -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wno-sign-compare -Wno-string-plus-int -Wno-deprecated-declarations -Wno-unused-parameter -Wno-unused-const-variable -Wno-conditional-uninitialized -Wno-mismatched-tags -Wno-sometimes-uninitialized -Wno-parentheses-equality -Wno-tautological-compare -Wno-self-assign -Wno-deprecated-register -Wno-deprecated -Wno-invalid-source-encoding -Wno-pointer-sign -Wno-parentheses -Wno-enum-conversion -Wno-c++11-compat-deprecated-writable-strings -Wno-write-strings -gsplit-dwarf' --sbin-path=/usr/local/sbin/nginx --conf-path=/usr/local/nginx/conf/nginx.conf --with-compat --with-http_stub_status_module --with-http_secure_link_module --add-dynamic-module=../nginx-module-vts --with-libatomic --with-http_gzip_static_module --add-dynamic-module=../ngx_brotli --with-http_sub_module --with-http_addition_module --with-http_image_filter_module=dynamic --with-http_geoip_module --with-stream_geoip_module --with-stream_realip_module --with-stream_ssl_preread_module --with-threads --with-stream=dynamic --with-stream_ssl_module --with-http_realip_module --add-dynamic-module=../ngx-fancyindex-0.4.2 --add-module=../ngx_cache_purge-2.4.2 --add-module=../ngx_devel_kit-0.3.0 --add-dynamic-module=../set-misc-nginx-module-0.31 --add-dynamic-module=../echo-nginx-module-0.61 --add-module=../redis2-nginx-module-0.14 --add-module=../ngx_http_redis-0.3.7 --add-module=../memc-nginx-module-0.18 --add-module=../srcache-nginx-module-0.31 --add-dynamic-module=../headers-more-nginx-module-0.33 --with-pcre=../pcre-8.41 --with-pcre-jit --with-zlib=../zlib-1.2.11 --with-http_ssl_module --with-http_v2_module --with-openssl=../openssl-1.1.0g --with-openssl-opt='enable-ec_nistp_64_gcc_128'

start binaries/nginx-1.13.8/nginx-clang342

HTTP/1.1 200 OK
Date: Mon, 22 Jan 2018 11:34:37 GMT
Content-Type: text/html; charset=utf-8
Content-Length: 3801
Last-Modified: Tue, 04 Apr 2017 07:34:43 GMT
Connection: keep-alive
Vary: Accept-Encoding
ETag: "58e34c93-ed9"
Server: nginx centminmod
X-Powered-By: centminmod
Accept-Ranges: bytes


/usr/local/bin/wrk-cmm -t3 -c600 -d60s --breakout -H 'Accept-Encoding: gzip' -s scripts/setup.lua http://localhost/
thread 1 created
thread 2 created
thread 3 created
Running 1m test @ http://localhost/
  3 threads and 600 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    11.59ms    8.14ms  96.81ms   71.10%
    Connect     2.93ms    5.82ms  80.66ms   89.96%
    TTFB       11.57ms    8.13ms  96.80ms   71.10%
    TTLB        4.22us   66.44us  14.61ms   99.54%
    Req/Sec    15.87k     4.79k   36.58k    69.28%
  2832008 requests in 1.00m, 5.04GB read
Requests/sec:  47134.08
Transfer/sec:     85.81MB
thread 1 made 934853 requests and got 934659 responses
thread 2 made 931701 requests and got 931503 responses
thread 3 made 966044 requests and got 965846 responses


-----------------------------------------------------------------------------------
./nginx-clang401 -V
nginx version: nginx/1.13.8 built by clang 4.0.1 built with OpenSSL 1.1.0g TLS SNI support enabled
configure arguments: --with-ld-opt='-L/usr/local/lib -ljemalloc -Wl,-z,relro -Wl,-rpath,/usr/local/lib' --with-cc-opt='-I/usr/local/include -m64 -march=native -DTCP_FASTOPEN=23 -g -O3 -fstack-protector --param=ssp-buffer-size=4 -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wno-sign-compare -Wno-string-plus-int -Wno-deprecated-declarations -Wno-unused-parameter -Wno-unused-const-variable -Wno-conditional-uninitialized -Wno-mismatched-tags -Wno-sometimes-uninitialized -Wno-parentheses-equality -Wno-tautological-compare -Wno-self-assign -Wno-deprecated-register -Wno-deprecated -Wno-invalid-source-encoding -Wno-pointer-sign -Wno-parentheses -Wno-enum-conversion -Wno-c++11-compat-deprecated-writable-strings -Wno-write-strings -gsplit-dwarf' --sbin-path=/usr/local/sbin/nginx --conf-path=/usr/local/nginx/conf/nginx.conf --with-compat --with-http_stub_status_module --with-http_secure_link_module --add-dynamic-module=../nginx-module-vts --with-libatomic --with-http_gzip_static_module --add-dynamic-module=../ngx_brotli --with-http_sub_module --with-http_addition_module --with-http_image_filter_module=dynamic --with-http_geoip_module --with-stream_geoip_module --with-stream_realip_module --with-stream_ssl_preread_module --with-threads --with-stream=dynamic --with-stream_ssl_module --with-http_realip_module --add-dynamic-module=../ngx-fancyindex-0.4.2 --add-module=../ngx_cache_purge-2.4.2 --add-module=../ngx_devel_kit-0.3.0 --add-dynamic-module=../set-misc-nginx-module-0.31 --add-dynamic-module=../echo-nginx-module-0.61 --add-module=../redis2-nginx-module-0.14 --add-module=../ngx_http_redis-0.3.7 --add-module=../memc-nginx-module-0.18 --add-module=../srcache-nginx-module-0.31 --add-dynamic-module=../headers-more-nginx-module-0.33 --with-pcre=../pcre-8.41 --with-pcre-jit --with-zlib=../zlib-1.2.11 --with-http_ssl_module --with-http_v2_module --with-openssl=../openssl-1.1.0g --with-openssl-opt='enable-ec_nistp_64_gcc_128'

start binaries/nginx-1.13.8/nginx-clang401

HTTP/1.1 200 OK
Date: Mon, 22 Jan 2018 11:35:43 GMT
Content-Type: text/html; charset=utf-8
Content-Length: 3801
Last-Modified: Tue, 04 Apr 2017 07:34:43 GMT
Connection: keep-alive
Vary: Accept-Encoding
ETag: "58e34c93-ed9"
Server: nginx centminmod
X-Powered-By: centminmod
Accept-Ranges: bytes


/usr/local/bin/wrk-cmm -t3 -c600 -d60s --breakout -H 'Accept-Encoding: gzip' -s scripts/setup.lua http://localhost/
thread 1 created
thread 2 created
thread 3 created
Running 1m test @ http://localhost/
  3 threads and 600 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    11.35ms    7.85ms 109.00ms   70.25%
    Connect     2.46ms    5.33ms  82.08ms   91.79%
    TTFB       11.33ms    7.85ms 108.99ms   70.26%
    TTLB        4.35us   60.95us  10.37ms   99.50%
    Req/Sec    16.46k     4.60k   34.08k    68.24%
  2937693 requests in 1.00m, 5.22GB read
Requests/sec:  48922.71
Transfer/sec:     89.07MB
thread 1 made 994152 requests and got 993951 responses
thread 2 made 967786 requests and got 967588 responses
thread 3 made 976353 requests and got 976154 responses


-----------------------------------------------------------------------------------
./nginx-clang501 -V
nginx version: nginx/1.13.8 built by clang 5.0.1 built with OpenSSL 1.1.0g TLS SNI support enabled
configure arguments: --with-ld-opt='-L/usr/local/lib -ljemalloc -Wl,-z,relro -Wl,-rpath,/usr/local/lib' --with-cc-opt='-I/usr/local/include -m64 -march=native -DTCP_FASTOPEN=23 -g -O3 -fstack-protector --param=ssp-buffer-size=4 -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wno-sign-compare -Wno-string-plus-int -Wno-deprecated-declarations -Wno-unused-parameter -Wno-unused-const-variable -Wno-conditional-uninitialized -Wno-mismatched-tags -Wno-sometimes-uninitialized -Wno-parentheses-equality -Wno-tautological-compare -Wno-self-assign -Wno-deprecated-register -Wno-deprecated -Wno-invalid-source-encoding -Wno-pointer-sign -Wno-parentheses -Wno-enum-conversion -Wno-c++11-compat-deprecated-writable-strings -Wno-write-strings -gsplit-dwarf' --sbin-path=/usr/local/sbin/nginx --conf-path=/usr/local/nginx/conf/nginx.conf --with-compat --with-http_stub_status_module --with-http_secure_link_module --add-dynamic-module=../nginx-module-vts --with-libatomic --with-http_gzip_static_module --add-dynamic-module=../ngx_brotli --with-http_sub_module --with-http_addition_module --with-http_image_filter_module=dynamic --with-http_geoip_module --with-stream_geoip_module --with-stream_realip_module --with-stream_ssl_preread_module --with-threads --with-stream=dynamic --with-stream_ssl_module --with-http_realip_module --add-dynamic-module=../ngx-fancyindex-0.4.2 --add-module=../ngx_cache_purge-2.4.2 --add-module=../ngx_devel_kit-0.3.0 --add-dynamic-module=../set-misc-nginx-module-0.31 --add-dynamic-module=../echo-nginx-module-0.61 --add-module=../redis2-nginx-module-0.14 --add-module=../ngx_http_redis-0.3.7 --add-module=../memc-nginx-module-0.18 --add-module=../srcache-nginx-module-0.31 --add-dynamic-module=../headers-more-nginx-module-0.33 --with-pcre=../pcre-8.41 --with-pcre-jit --with-zlib=../zlib-1.2.11 --with-http_ssl_module --with-http_v2_module --with-openssl=../openssl-1.1.0g --with-openssl-opt='enable-ec_nistp_64_gcc_128'

start binaries/nginx-1.13.8/nginx-clang501

HTTP/1.1 200 OK
Date: Mon, 22 Jan 2018 11:36:49 GMT
Content-Type: text/html; charset=utf-8
Content-Length: 3801
Last-Modified: Tue, 04 Apr 2017 07:34:43 GMT
Connection: keep-alive
Vary: Accept-Encoding
ETag: "58e34c93-ed9"
Server: nginx centminmod
X-Powered-By: centminmod
Accept-Ranges: bytes


/usr/local/bin/wrk-cmm -t3 -c600 -d60s --breakout -H 'Accept-Encoding: gzip' -s scripts/setup.lua http://localhost/
thread 1 created
thread 2 created
thread 3 created
Running 1m test @ http://localhost/
  3 threads and 600 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    11.25ms    7.65ms  98.96ms   70.07%
    Connect     2.95ms    5.53ms  42.53ms   90.06%
    TTFB       11.24ms    7.65ms  98.95ms   70.09%
    TTLB        4.54us   66.78us  14.65ms   99.50%
    Req/Sec    16.25k     4.93k   40.05k    69.94%
  2901310 requests in 1.00m, 5.16GB read
Requests/sec:  48301.24
Transfer/sec:     87.94MB
thread 1 made 956973 requests and got 956773 responses
thread 2 made 964148 requests and got 963984 responses
thread 3 made 980679 requests and got 980553 responses


-----------------------------------------------------------------------------------
./nginx-clang6 -V
nginx version: nginx/1.13.8 built by clang 6.0.0 built with OpenSSL 1.1.0g TLS SNI support enabled
configure arguments: --with-ld-opt='-L/usr/local/lib -ljemalloc -Wl,-z,relro -Wl,-rpath,/usr/local/lib' --with-cc-opt='-I/usr/local/include -m64 -march=native -DTCP_FASTOPEN=23 -g -O3 -fstack-protector --param=ssp-buffer-size=4 -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wno-sign-compare -Wno-string-plus-int -Wno-deprecated-declarations -Wno-unused-parameter -Wno-unused-const-variable -Wno-conditional-uninitialized -Wno-mismatched-tags -Wno-sometimes-uninitialized -Wno-parentheses-equality -Wno-tautological-compare -Wno-self-assign -Wno-deprecated-register -Wno-deprecated -Wno-invalid-source-encoding -Wno-pointer-sign -Wno-parentheses -Wno-enum-conversion -Wno-c++11-compat-deprecated-writable-strings -Wno-write-strings -gsplit-dwarf' --sbin-path=/usr/local/sbin/nginx --conf-path=/usr/local/nginx/conf/nginx.conf --with-compat --with-http_stub_status_module --with-http_secure_link_module --add-dynamic-module=../nginx-module-vts --with-libatomic --with-http_gzip_static_module --add-dynamic-module=../ngx_brotli --with-http_sub_module --with-http_addition_module --with-http_image_filter_module=dynamic --with-http_geoip_module --with-stream_geoip_module --with-stream_realip_module --with-stream_ssl_preread_module --with-threads --with-stream=dynamic --with-stream_ssl_module --with-http_realip_module --add-dynamic-module=../ngx-fancyindex-0.4.2 --add-module=../ngx_cache_purge-2.4.2 --add-module=../ngx_devel_kit-0.3.0 --add-dynamic-module=../set-misc-nginx-module-0.31 --add-dynamic-module=../echo-nginx-module-0.61 --add-module=../redis2-nginx-module-0.14 --add-module=../ngx_http_redis-0.3.7 --add-module=../memc-nginx-module-0.18 --add-module=../srcache-nginx-module-0.31 --add-dynamic-module=../headers-more-nginx-module-0.33 --with-pcre=../pcre-8.41 --with-pcre-jit --with-zlib=../zlib-1.2.11 --with-http_ssl_module --with-http_v2_module --with-openssl=../openssl-1.1.0g --with-openssl-opt='enable-ec_nistp_64_gcc_128'

start binaries/nginx-1.13.8/nginx-clang6

HTTP/1.1 200 OK
Date: Mon, 22 Jan 2018 11:37:55 GMT
Content-Type: text/html; charset=utf-8
Content-Length: 3801
Last-Modified: Tue, 04 Apr 2017 07:34:43 GMT
Connection: keep-alive
Vary: Accept-Encoding
ETag: "58e34c93-ed9"
Server: nginx centminmod
X-Powered-By: centminmod
Accept-Ranges: bytes


/usr/local/bin/wrk-cmm -t3 -c600 -d60s --breakout -H 'Accept-Encoding: gzip' -s scripts/setup.lua http://localhost/
thread 1 created
thread 2 created
thread 3 created
Running 1m test @ http://localhost/
  3 threads and 600 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    11.40ms    8.06ms 110.03ms   71.96%
    Connect     2.46ms    6.03ms 102.55ms   92.72%
    TTFB       11.39ms    8.05ms 110.02ms   71.97%
    TTLB        4.34us   61.16us  16.06ms   99.50%
    Req/Sec    16.56k     5.20k   38.65k    69.80%
  2951680 requests in 1.00m, 5.25GB read
Requests/sec:  49120.42
Transfer/sec:     89.43MB
thread 1 made 1020099 requests and got 1019911 responses
thread 2 made 952318 requests and got 952120 responses
thread 3 made 979781 requests and got 979649 responses


-----------------------------------------------------------------------------------
./nginx-gcc485 -V
nginx version: nginx/1.13.8 built by gcc 4.8.5 built with OpenSSL 1.1.0g TLS SNI support enabled
configure arguments: --with-ld-opt='-L/usr/local/lib -ljemalloc -Wl,-z,relro -Wl,-rpath,/usr/local/lib' --with-cc-opt='-I/usr/local/include -m64 -march=native -DTCP_FASTOPEN=23 -g -O3 -fstack-protector-strong -flto -fuse-ld=gold --param=ssp-buffer-size=4 -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wno-deprecated-declarations -gsplit-dwarf' --sbin-path=/usr/local/sbin/nginx --conf-path=/usr/local/nginx/conf/nginx.conf --with-compat --with-http_stub_status_module --with-http_secure_link_module --add-dynamic-module=../nginx-module-vts --with-libatomic --with-http_gzip_static_module --add-dynamic-module=../ngx_brotli --with-http_sub_module --with-http_addition_module --with-http_image_filter_module=dynamic --with-http_geoip_module --with-stream_geoip_module --with-stream_realip_module --with-stream_ssl_preread_module --with-threads --with-stream=dynamic --with-stream_ssl_module --with-http_realip_module --add-dynamic-module=../ngx-fancyindex-0.4.2 --add-module=../ngx_cache_purge-2.4.2 --add-module=../ngx_devel_kit-0.3.0 --add-dynamic-module=../set-misc-nginx-module-0.31 --add-dynamic-module=../echo-nginx-module-0.61 --add-module=../redis2-nginx-module-0.14 --add-module=../ngx_http_redis-0.3.7 --add-module=../memc-nginx-module-0.18 --add-module=../srcache-nginx-module-0.31 --add-dynamic-module=../headers-more-nginx-module-0.33 --with-pcre=../pcre-8.41 --with-pcre-jit --with-zlib=../zlib-1.2.11 --with-http_ssl_module --with-http_v2_module --with-openssl=../openssl-1.1.0g --with-openssl-opt='enable-ec_nistp_64_gcc_128'

start binaries/nginx-1.13.8/nginx-gcc485

HTTP/1.1 200 OK
Date: Mon, 22 Jan 2018 11:39:01 GMT
Content-Type: text/html; charset=utf-8
Content-Length: 3801
Last-Modified: Tue, 04 Apr 2017 07:34:43 GMT
Connection: keep-alive
Vary: Accept-Encoding
ETag: "58e34c93-ed9"
Server: nginx centminmod
X-Powered-By: centminmod
Accept-Ranges: bytes


/usr/local/bin/wrk-cmm -t3 -c600 -d60s --breakout -H 'Accept-Encoding: gzip' -s scripts/setup.lua http://localhost/
thread 1 created
thread 2 created
thread 3 created
Running 1m test @ http://localhost/
  3 threads and 600 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    11.25ms    8.27ms 151.88ms   71.19%
    Connect     2.61ms    4.97ms  43.83ms   90.80%
    TTFB       11.24ms    8.26ms 151.87ms   71.20%
    TTLB        4.29us   61.05us   9.69ms   99.52%
    Req/Sec    16.41k     5.28k   38.48k    69.00%
  2924445 requests in 1.00m, 5.20GB read
Requests/sec:  48710.11
Transfer/sec:     88.68MB
thread 1 made 964719 requests and got 964639 responses
thread 2 made 962278 requests and got 962100 responses
thread 3 made 997852 requests and got 997706 responses


-----------------------------------------------------------------------------------
./nginx-gcc531 -V
nginx version: nginx/1.13.8 built by gcc 5.3.1 built with OpenSSL 1.1.0g TLS SNI support enabled
configure arguments: --with-ld-opt='-L/usr/local/lib -ljemalloc -Wl,-z,relro -Wl,-rpath,/usr/local/lib' --with-cc-opt='-I/usr/local/include -m64 -march=native -DTCP_FASTOPEN=23 -g -O3 -fstack-protector-strong -flto -fuse-ld=gold --param=ssp-buffer-size=4 -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wno-deprecated-declarations -gsplit-dwarf' --sbin-path=/usr/local/sbin/nginx --conf-path=/usr/local/nginx/conf/nginx.conf --with-compat --with-http_stub_status_module --with-http_secure_link_module --add-dynamic-module=../nginx-module-vts --with-libatomic --with-http_gzip_static_module --add-dynamic-module=../ngx_brotli --with-http_sub_module --with-http_addition_module --with-http_image_filter_module=dynamic --with-http_geoip_module --with-stream_geoip_module --with-stream_realip_module --with-stream_ssl_preread_module --with-threads --with-stream=dynamic --with-stream_ssl_module --with-http_realip_module --add-dynamic-module=../ngx-fancyindex-0.4.2 --add-module=../ngx_cache_purge-2.4.2 --add-module=../ngx_devel_kit-0.3.0 --add-dynamic-module=../set-misc-nginx-module-0.31 --add-dynamic-module=../echo-nginx-module-0.61 --add-module=../redis2-nginx-module-0.14 --add-module=../ngx_http_redis-0.3.7 --add-module=../memc-nginx-module-0.18 --add-module=../srcache-nginx-module-0.31 --add-dynamic-module=../headers-more-nginx-module-0.33 --with-pcre=../pcre-8.41 --with-pcre-jit --with-zlib=../zlib-1.2.11 --with-http_ssl_module --with-http_v2_module --with-openssl=../openssl-1.1.0g --with-openssl-opt='enable-ec_nistp_64_gcc_128'

start binaries/nginx-1.13.8/nginx-gcc531

HTTP/1.1 200 OK
Date: Mon, 22 Jan 2018 11:40:07 GMT
Content-Type: text/html; charset=utf-8
Content-Length: 3801
Last-Modified: Tue, 04 Apr 2017 07:34:43 GMT
Connection: keep-alive
Vary: Accept-Encoding
ETag: "58e34c93-ed9"
Server: nginx centminmod
X-Powered-By: centminmod
Accept-Ranges: bytes


/usr/local/bin/wrk-cmm -t3 -c600 -d60s --breakout -H 'Accept-Encoding: gzip' -s scripts/setup.lua http://localhost/
thread 1 created
thread 2 created
thread 3 created
Running 1m test @ http://localhost/
  3 threads and 600 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    11.25ms    8.11ms 115.18ms   70.67%
    Connect     2.35ms    4.87ms  53.67ms   91.62%
    TTFB       11.23ms    8.11ms 115.17ms   70.67%
    TTLB        4.30us   65.35us  23.88ms   99.50%
    Req/Sec    16.60k     4.90k   36.97k    70.18%
  2960506 requests in 1.00m, 5.26GB read
Requests/sec:  49305.56
Transfer/sec:     89.76MB
thread 1 made 986784 requests and got 986586 responses
thread 2 made 983572 requests and got 983376 responses
thread 3 made 990742 requests and got 990544 responses


-----------------------------------------------------------------------------------
./nginx-gcc631 -V
nginx version: nginx/1.13.8 built by gcc 6.3.1 built with OpenSSL 1.1.0g TLS SNI support enabled
configure arguments: --with-ld-opt='-L/usr/local/lib -ljemalloc -Wl,-z,relro -Wl,-rpath,/usr/local/lib' --with-cc-opt='-I/usr/local/include -m64 -march=native -DTCP_FASTOPEN=23 -g -O3 -fstack-protector-strong -flto -fuse-ld=gold --param=ssp-buffer-size=4 -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wno-deprecated-declarations -gsplit-dwarf' --sbin-path=/usr/local/sbin/nginx --conf-path=/usr/local/nginx/conf/nginx.conf --with-compat --with-http_stub_status_module --with-http_secure_link_module --add-dynamic-module=../nginx-module-vts --with-libatomic --with-http_gzip_static_module --add-dynamic-module=../ngx_brotli --with-http_sub_module --with-http_addition_module --with-http_image_filter_module=dynamic --with-http_geoip_module --with-stream_geoip_module --with-stream_realip_module --with-stream_ssl_preread_module --with-threads --with-stream=dynamic --with-stream_ssl_module --with-http_realip_module --add-dynamic-module=../ngx-fancyindex-0.4.2 --add-module=../ngx_cache_purge-2.4.2 --add-module=../ngx_devel_kit-0.3.0 --add-dynamic-module=../set-misc-nginx-module-0.31 --add-dynamic-module=../echo-nginx-module-0.61 --add-module=../redis2-nginx-module-0.14 --add-module=../ngx_http_redis-0.3.7 --add-module=../memc-nginx-module-0.18 --add-module=../srcache-nginx-module-0.31 --add-dynamic-module=../headers-more-nginx-module-0.33 --with-pcre=../pcre-8.41 --with-pcre-jit --with-zlib=../zlib-1.2.11 --with-http_ssl_module --with-http_v2_module --with-openssl=../openssl-1.1.0g --with-openssl-opt='enable-ec_nistp_64_gcc_128'

start binaries/nginx-1.13.8/nginx-gcc631

HTTP/1.1 200 OK
Date: Mon, 22 Jan 2018 11:41:13 GMT
Content-Type: text/html; charset=utf-8
Content-Length: 3801
Last-Modified: Tue, 04 Apr 2017 07:34:43 GMT
Connection: keep-alive
Vary: Accept-Encoding
ETag: "58e34c93-ed9"
Server: nginx centminmod
X-Powered-By: centminmod
Accept-Ranges: bytes


/usr/local/bin/wrk-cmm -t3 -c600 -d60s --breakout -H 'Accept-Encoding: gzip' -s scripts/setup.lua http://localhost/
thread 1 created
thread 2 created
thread 3 created
Running 1m test @ http://localhost/
  3 threads and 600 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    11.29ms    8.27ms 107.48ms   72.64%
    Connect     2.74ms    5.11ms  53.89ms   90.69%
    TTFB       11.27ms    8.26ms 107.47ms   72.64%
    TTLB        4.26us   68.64us  28.13ms   99.51%
    Req/Sec    16.48k     5.14k   37.65k    68.70%
  2940306 requests in 1.00m, 5.23GB read
Requests/sec:  48934.98
Transfer/sec:     89.09MB
thread 1 made 1014397 requests and got 1014197 responses
thread 2 made 954473 requests and got 954273 responses
thread 3 made 972022 requests and got 971836 responses


-----------------------------------------------------------------------------------
./nginx-gcc721 -V
nginx version: nginx/1.13.8 built by gcc 7.2.1 built with OpenSSL 1.1.0g TLS SNI support enabled
configure arguments: --with-ld-opt='-L/usr/local/lib -ljemalloc -Wl,-z,relro -Wl,-rpath,/usr/local/lib' --with-cc-opt='-I/usr/local/include -m64 -march=native -DTCP_FASTOPEN=23 -g -O3 -fstack-protector-strong -flto -fuse-ld=gold --param=ssp-buffer-size=4 -Wformat -Werror=format-security -Wimplicit-fallthrough=0 -fcode-hoisting -Wp,-D_FORTIFY_SOURCE=2 -Wno-deprecated-declarations -gsplit-dwarf' --sbin-path=/usr/local/sbin/nginx --conf-path=/usr/local/nginx/conf/nginx.conf --with-compat --with-http_stub_status_module --with-http_secure_link_module --add-dynamic-module=../nginx-module-vts --with-libatomic --with-http_gzip_static_module --add-dynamic-module=../ngx_brotli --with-http_sub_module --with-http_addition_module --with-http_image_filter_module=dynamic --with-http_geoip_module --with-stream_geoip_module --with-stream_realip_module --with-stream_ssl_preread_module --with-threads --with-stream=dynamic --with-stream_ssl_module --with-http_realip_module --add-dynamic-module=../ngx-fancyindex-0.4.2 --add-module=../ngx_cache_purge-2.4.2 --add-module=../ngx_devel_kit-0.3.0 --add-dynamic-module=../set-misc-nginx-module-0.31 --add-dynamic-module=../echo-nginx-module-0.61 --add-module=../redis2-nginx-module-0.14 --add-module=../ngx_http_redis-0.3.7 --add-module=../memc-nginx-module-0.18 --add-module=../srcache-nginx-module-0.31 --add-dynamic-module=../headers-more-nginx-module-0.33 --with-pcre=../pcre-8.41 --with-pcre-jit --with-zlib=../zlib-1.2.11 --with-http_ssl_module --with-http_v2_module --with-openssl=../openssl-1.1.0g --with-openssl-opt='enable-ec_nistp_64_gcc_128'

start binaries/nginx-1.13.8/nginx-gcc721

HTTP/1.1 200 OK
Date: Mon, 22 Jan 2018 11:42:19 GMT
Content-Type: text/html; charset=utf-8
Content-Length: 3801
Last-Modified: Tue, 04 Apr 2017 07:34:43 GMT
Connection: keep-alive
Vary: Accept-Encoding
ETag: "58e34c93-ed9"
Server: nginx centminmod
X-Powered-By: centminmod
Accept-Ranges: bytes


/usr/local/bin/wrk-cmm -t3 -c600 -d60s --breakout -H 'Accept-Encoding: gzip' -s scripts/setup.lua http://localhost/
thread 1 created
thread 2 created
thread 3 created
Running 1m test @ http://localhost/
  3 threads and 600 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    11.06ms    8.30ms 124.10ms   73.15%
    Connect     3.15ms    6.14ms  73.83ms   89.65%
    TTFB       11.05ms    8.29ms 124.10ms   73.16%
    TTLB        4.26us   63.89us  11.09ms   99.52%
    Req/Sec    16.58k     5.36k   36.58k    67.67%
  2955956 requests in 1.00m, 5.26GB read
Requests/sec:  49194.71
Transfer/sec:     89.56MB
thread 1 made 952032 requests and got 951864 responses
thread 2 made 1021887 requests and got 1021688 responses
thread 3 made 982547 requests and got 982404 responses


-----------------------------------------------------------------------------------
./nginx-gcc8 -V
nginx version: nginx/1.13.8 built by gcc 8.0.0 built with OpenSSL 1.1.0g TLS SNI support enabled
configure arguments: --with-ld-opt='-L/usr/local/lib -ljemalloc -Wl,-z,relro -Wl,-rpath,/usr/local/lib' --with-cc-opt='-I/usr/local/include -m64 -march=native -DTCP_FASTOPEN=23 -g -O3 -fstack-protector-strong -flto -fuse-ld=gold --param=ssp-buffer-size=4 -Wformat -Werror=format-security -Wimplicit-fallthrough=0 -fcode-hoisting -Wno-cast-function-type -Wp,-D_FORTIFY_SOURCE=2 -Wno-deprecated-declarations' --sbin-path=/usr/local/sbin/nginx --conf-path=/usr/local/nginx/conf/nginx.conf --with-compat --with-http_stub_status_module --with-http_secure_link_module --add-dynamic-module=../nginx-module-vts --with-libatomic --with-http_gzip_static_module --add-dynamic-module=../ngx_brotli --with-http_sub_module --with-http_addition_module --with-http_image_filter_module=dynamic --with-http_geoip_module --with-stream_geoip_module --with-stream_realip_module --with-stream_ssl_preread_module --with-threads --with-stream=dynamic --with-stream_ssl_module --with-http_realip_module --add-dynamic-module=../ngx-fancyindex-0.4.2 --add-module=../ngx_cache_purge-2.4.2 --add-module=../ngx_devel_kit-0.3.0 --add-dynamic-module=../set-misc-nginx-module-0.31 --add-dynamic-module=../echo-nginx-module-0.61 --add-module=../redis2-nginx-module-0.14 --add-module=../ngx_http_redis-0.3.7 --add-module=../memc-nginx-module-0.18 --add-module=../srcache-nginx-module-0.31 --add-dynamic-module=../headers-more-nginx-module-0.33 --with-pcre=../pcre-8.41 --with-pcre-jit --with-zlib=../zlib-1.2.11 --with-http_ssl_module --with-http_v2_module --with-openssl=../openssl-1.1.0g --with-openssl-opt='enable-ec_nistp_64_gcc_128'

start binaries/nginx-1.13.8/nginx-gcc8

HTTP/1.1 200 OK
Date: Mon, 22 Jan 2018 11:43:26 GMT
Content-Type: text/html; charset=utf-8
Content-Length: 3801
Last-Modified: Tue, 04 Apr 2017 07:34:43 GMT
Connection: keep-alive
Vary: Accept-Encoding
ETag: "58e34c93-ed9"
Server: nginx centminmod
X-Powered-By: centminmod
Accept-Ranges: bytes


/usr/local/bin/wrk-cmm -t3 -c600 -d60s --breakout -H 'Accept-Encoding: gzip' -s scripts/setup.lua http://localhost/
thread 1 created
thread 2 created
thread 3 created
Running 1m test @ http://localhost/
  3 threads and 600 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    11.25ms    7.75ms 106.98ms   71.04%
    Connect     2.56ms    5.20ms  70.01ms   90.89%
    TTFB       11.23ms    7.74ms 106.98ms   71.05%
    TTLB        4.25us   61.07us  12.21ms   99.50%
    Req/Sec    16.52k     5.06k   37.21k    69.30%
  2947821 requests in 1.00m, 5.24GB read
Requests/sec:  49052.53
Transfer/sec:     89.30MB
thread 1 made 1032737 requests and got 1032552 responses
thread 2 made 958271 requests and got 958115 responses
thread 3 made 957353 requests and got 957154 responses


-----------------------------------------------------------------------------------
./nginx-clang401-cfzlib -V
nginx version: nginx/1.13.8 built by clang 4.0.1 built with OpenSSL 1.1.0g TLS SNI support enabled
configure arguments: --with-ld-opt='-L/usr/local/lib -ljemalloc -Wl,-z,relro -Wl,-rpath,/usr/local/lib' --with-cc-opt='-I/usr/local/include -m64 -march=native -DTCP_FASTOPEN=23 -g -O3 -fstack-protector --param=ssp-buffer-size=4 -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wno-sign-compare -Wno-string-plus-int -Wno-deprecated-declarations -Wno-unused-parameter -Wno-unused-const-variable -Wno-conditional-uninitialized -Wno-mismatched-tags -Wno-sometimes-uninitialized -Wno-parentheses-equality -Wno-tautological-compare -Wno-self-assign -Wno-deprecated-register -Wno-deprecated -Wno-invalid-source-encoding -Wno-pointer-sign -Wno-parentheses -Wno-enum-conversion -Wno-c++11-compat-deprecated-writable-strings -Wno-write-strings -gsplit-dwarf' --sbin-path=/usr/local/sbin/nginx --conf-path=/usr/local/nginx/conf/nginx.conf --with-compat --with-http_stub_status_module --with-http_secure_link_module --add-dynamic-module=../nginx-module-vts --with-libatomic --with-http_gzip_static_module --add-dynamic-module=../ngx_brotli --with-http_sub_module --with-http_addition_module --with-http_image_filter_module=dynamic --with-http_geoip_module --with-stream_geoip_module --with-stream_realip_module --with-stream_ssl_preread_module --with-threads --with-stream=dynamic --with-stream_ssl_module --with-http_realip_module --add-dynamic-module=../ngx-fancyindex-0.4.2 --add-module=../ngx_cache_purge-2.4.2 --add-module=../ngx_devel_kit-0.3.0 --add-dynamic-module=../set-misc-nginx-module-0.31 --add-dynamic-module=../echo-nginx-module-0.61 --add-module=../redis2-nginx-module-0.14 --add-module=../ngx_http_redis-0.3.7 --add-module=../memc-nginx-module-0.18 --add-module=../srcache-nginx-module-0.31 --add-dynamic-module=../headers-more-nginx-module-0.33 --with-pcre=../pcre-8.41 --with-pcre-jit --with-zlib=../zlib-cloudflare-1.3.0 --with-http_ssl_module --with-http_v2_module --with-openssl=../openssl-1.1.0g --with-openssl-opt='enable-ec_nistp_64_gcc_128'

start binaries/nginx-1.13.8/nginx-clang401-cfzlib

HTTP/1.1 200 OK
Date: Mon, 22 Jan 2018 11:44:32 GMT
Content-Type: text/html; charset=utf-8
Content-Length: 3801
Last-Modified: Tue, 04 Apr 2017 07:34:43 GMT
Connection: keep-alive
Vary: Accept-Encoding
ETag: "58e34c93-ed9"
Server: nginx centminmod
X-Powered-By: centminmod
Accept-Ranges: bytes


/usr/local/bin/wrk-cmm -t3 -c600 -d60s --breakout -H 'Accept-Encoding: gzip' -s scripts/setup.lua http://localhost/
thread 1 created
thread 2 created
thread 3 created
Running 1m test @ http://localhost/
  3 threads and 600 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     9.48ms    6.54ms  83.55ms   72.56%
    Connect     2.06ms    4.37ms  34.93ms   91.60%
    TTFB        9.47ms    6.54ms  83.54ms   72.58%
    TTLB        3.45us   49.01us  19.70ms   99.58%
    Req/Sec    20.20k     5.78k   45.92k    70.03%
  3605204 requests in 1.00m, 6.37GB read
Requests/sec:  60080.29
Transfer/sec:    108.69MB
thread 1 made 1202435 requests and got 1202374 responses
thread 2 made 1218398 requests and got 1218272 responses
thread 3 made 1184578 requests and got 1184558 responses


-----------------------------------------------------------------------------------
./nginx-clang501-cfzlib -V
nginx version: nginx/1.13.8 built by clang 5.0.1 built with OpenSSL 1.1.0g TLS SNI support enabled
configure arguments: --with-ld-opt='-L/usr/local/lib -ljemalloc -Wl,-z,relro -Wl,-rpath,/usr/local/lib' --with-cc-opt='-I/usr/local/include -m64 -march=native -DTCP_FASTOPEN=23 -g -O3 -fstack-protector --param=ssp-buffer-size=4 -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wno-sign-compare -Wno-string-plus-int -Wno-deprecated-declarations -Wno-unused-parameter -Wno-unused-const-variable -Wno-conditional-uninitialized -Wno-mismatched-tags -Wno-sometimes-uninitialized -Wno-parentheses-equality -Wno-tautological-compare -Wno-self-assign -Wno-deprecated-register -Wno-deprecated -Wno-invalid-source-encoding -Wno-pointer-sign -Wno-parentheses -Wno-enum-conversion -Wno-c++11-compat-deprecated-writable-strings -Wno-write-strings -gsplit-dwarf' --sbin-path=/usr/local/sbin/nginx --conf-path=/usr/local/nginx/conf/nginx.conf --with-compat --with-http_stub_status_module --with-http_secure_link_module --add-dynamic-module=../nginx-module-vts --with-libatomic --with-http_gzip_static_module --add-dynamic-module=../ngx_brotli --with-http_sub_module --with-http_addition_module --with-http_image_filter_module=dynamic --with-http_geoip_module --with-stream_geoip_module --with-stream_realip_module --with-stream_ssl_preread_module --with-threads --with-stream=dynamic --with-stream_ssl_module --with-http_realip_module --add-dynamic-module=../ngx-fancyindex-0.4.2 --add-module=../ngx_cache_purge-2.4.2 --add-module=../ngx_devel_kit-0.3.0 --add-dynamic-module=../set-misc-nginx-module-0.31 --add-dynamic-module=../echo-nginx-module-0.61 --add-module=../redis2-nginx-module-0.14 --add-module=../ngx_http_redis-0.3.7 --add-module=../memc-nginx-module-0.18 --add-module=../srcache-nginx-module-0.31 --add-dynamic-module=../headers-more-nginx-module-0.33 --with-pcre=../pcre-8.41 --with-pcre-jit --with-zlib=../zlib-cloudflare-1.3.0 --with-http_ssl_module --with-http_v2_module --with-openssl=../openssl-1.1.0g --with-openssl-opt='enable-ec_nistp_64_gcc_128'

start binaries/nginx-1.13.8/nginx-clang501-cfzlib

HTTP/1.1 200 OK
Date: Mon, 22 Jan 2018 11:45:38 GMT
Content-Type: text/html; charset=utf-8
Content-Length: 3801
Last-Modified: Tue, 04 Apr 2017 07:34:43 GMT
Connection: keep-alive
Vary: Accept-Encoding
ETag: "58e34c93-ed9"
Server: nginx centminmod
X-Powered-By: centminmod
Accept-Ranges: bytes


/usr/local/bin/wrk-cmm -t3 -c600 -d60s --breakout -H 'Accept-Encoding: gzip' -s scripts/setup.lua http://localhost/
thread 1 created
thread 2 created
thread 3 created
Running 1m test @ http://localhost/
  3 threads and 600 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     9.76ms    7.66ms  99.05ms   74.22%
    Connect     1.86ms    4.20ms  46.92ms   92.55%
    TTFB        9.75ms    7.65ms  99.05ms   74.23%
    TTLB        3.35us   46.10us  14.04ms   99.54%
    Req/Sec    20.13k     5.86k   46.64k    72.99%
  3596650 requests in 1.00m, 6.35GB read
Requests/sec:  59858.31
Transfer/sec:    108.29MB
thread 1 made 1187757 requests and got 1187558 responses
thread 2 made 1214914 requests and got 1214724 responses
thread 3 made 1194567 requests and got 1194368 responses


-----------------------------------------------------------------------------------
./nginx-clang6-cfzlib -V
nginx version: nginx/1.13.8 built by clang 6.0.0 built with OpenSSL 1.1.0g TLS SNI support enabled
configure arguments: --with-ld-opt='-L/usr/local/lib -ljemalloc -Wl,-z,relro -Wl,-rpath,/usr/local/lib' --with-cc-opt='-I/usr/local/include -m64 -march=native -DTCP_FASTOPEN=23 -g -O3 -fstack-protector --param=ssp-buffer-size=4 -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wno-sign-compare -Wno-string-plus-int -Wno-deprecated-declarations -Wno-unused-parameter -Wno-unused-const-variable -Wno-conditional-uninitialized -Wno-mismatched-tags -Wno-sometimes-uninitialized -Wno-parentheses-equality -Wno-tautological-compare -Wno-self-assign -Wno-deprecated-register -Wno-deprecated -Wno-invalid-source-encoding -Wno-pointer-sign -Wno-parentheses -Wno-enum-conversion -Wno-c++11-compat-deprecated-writable-strings -Wno-write-strings -gsplit-dwarf' --sbin-path=/usr/local/sbin/nginx --conf-path=/usr/local/nginx/conf/nginx.conf --with-compat --with-http_stub_status_module --with-http_secure_link_module --add-dynamic-module=../nginx-module-vts --with-libatomic --with-http_gzip_static_module --add-dynamic-module=../ngx_brotli --with-http_sub_module --with-http_addition_module --with-http_image_filter_module=dynamic --with-http_geoip_module --with-stream_geoip_module --with-stream_realip_module --with-stream_ssl_preread_module --with-threads --with-stream=dynamic --with-stream_ssl_module --with-http_realip_module --add-dynamic-module=../ngx-fancyindex-0.4.2 --add-module=../ngx_cache_purge-2.4.2 --add-module=../ngx_devel_kit-0.3.0 --add-dynamic-module=../set-misc-nginx-module-0.31 --add-dynamic-module=../echo-nginx-module-0.61 --add-module=../redis2-nginx-module-0.14 --add-module=../ngx_http_redis-0.3.7 --add-module=../memc-nginx-module-0.18 --add-module=../srcache-nginx-module-0.31 --add-dynamic-module=../headers-more-nginx-module-0.33 --with-pcre=../pcre-8.41 --with-pcre-jit --with-zlib=../zlib-cloudflare-1.3.0 --with-http_ssl_module --with-http_v2_module --with-openssl=../openssl-1.1.0g --with-openssl-opt='enable-ec_nistp_64_gcc_128'

start binaries/nginx-1.13.8/nginx-clang6-cfzlib

HTTP/1.1 200 OK
Date: Mon, 22 Jan 2018 11:46:44 GMT
Content-Type: text/html; charset=utf-8
Content-Length: 3801
Last-Modified: Tue, 04 Apr 2017 07:34:43 GMT
Connection: keep-alive
Vary: Accept-Encoding
ETag: "58e34c93-ed9"
Server: nginx centminmod
X-Powered-By: centminmod
Accept-Ranges: bytes


/usr/local/bin/wrk-cmm -t3 -c600 -d60s --breakout -H 'Accept-Encoding: gzip' -s scripts/setup.lua http://localhost/
thread 1 created
thread 2 created
thread 3 created
Running 1m test @ http://localhost/
  3 threads and 600 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     9.37ms    6.51ms  75.23ms   72.77%
    Connect     1.85ms    4.11ms  41.87ms   92.33%
    TTFB        9.35ms    6.50ms  75.22ms   72.78%
    TTLB        3.40us   44.95us  13.53ms   99.55%
    Req/Sec    20.49k     5.75k   49.18k    72.06%
  3661914 requests in 1.00m, 6.47GB read
Requests/sec:  60935.30
Transfer/sec:    110.24MB
thread 1 made 1229099 requests and got 1228914 responses
thread 2 made 1216305 requests and got 1216107 responses
thread 3 made 1216964 requests and got 1216893 responses


-----------------------------------------------------------------------------------
./nginx-gcc485-cfzlib -V
nginx version: nginx/1.13.8 built by gcc 4.8.5 built with OpenSSL 1.1.0g TLS SNI support enabled
configure arguments: --with-ld-opt='-L/usr/local/lib -ljemalloc -Wl,-z,relro -Wl,-rpath,/usr/local/lib' --with-cc-opt='-I/usr/local/include -m64 -march=native -DTCP_FASTOPEN=23 -g -O3 -fstack-protector-strong -flto -fuse-ld=gold --param=ssp-buffer-size=4 -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wno-deprecated-declarations -gsplit-dwarf' --sbin-path=/usr/local/sbin/nginx --conf-path=/usr/local/nginx/conf/nginx.conf --with-compat --with-http_stub_status_module --with-http_secure_link_module --add-dynamic-module=../nginx-module-vts --with-libatomic --with-http_gzip_static_module --add-dynamic-module=../ngx_brotli --with-http_sub_module --with-http_addition_module --with-http_image_filter_module=dynamic --with-http_geoip_module --with-stream_geoip_module --with-stream_realip_module --with-stream_ssl_preread_module --with-threads --with-stream=dynamic --with-stream_ssl_module --with-http_realip_module --add-dynamic-module=../ngx-fancyindex-0.4.2 --add-module=../ngx_cache_purge-2.4.2 --add-module=../ngx_devel_kit-0.3.0 --add-dynamic-module=../set-misc-nginx-module-0.31 --add-dynamic-module=../echo-nginx-module-0.61 --add-module=../redis2-nginx-module-0.14 --add-module=../ngx_http_redis-0.3.7 --add-module=../memc-nginx-module-0.18 --add-module=../srcache-nginx-module-0.31 --add-dynamic-module=../headers-more-nginx-module-0.33 --with-pcre=../pcre-8.41 --with-pcre-jit --with-zlib=../zlib-cloudflare-1.3.0 --with-http_ssl_module --with-http_v2_module --with-openssl=../openssl-1.1.0g --with-openssl-opt='enable-ec_nistp_64_gcc_128'

start binaries/nginx-1.13.8/nginx-gcc485-cfzlib

HTTP/1.1 200 OK
Date: Mon, 22 Jan 2018 11:47:50 GMT
Content-Type: text/html; charset=utf-8
Content-Length: 3801
Last-Modified: Tue, 04 Apr 2017 07:34:43 GMT
Connection: keep-alive
Vary: Accept-Encoding
ETag: "58e34c93-ed9"
Server: nginx centminmod
X-Powered-By: centminmod
Accept-Ranges: bytes


/usr/local/bin/wrk-cmm -t3 -c600 -d60s --breakout -H 'Accept-Encoding: gzip' -s scripts/setup.lua http://localhost/
thread 1 created
thread 2 created
thread 3 created
Running 1m test @ http://localhost/
  3 threads and 600 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     9.62ms    7.13ms 112.14ms   74.76%
    Connect     2.21ms    5.13ms  75.81ms   91.72%
    TTFB        9.60ms    7.13ms 112.13ms   74.77%
    TTLB        3.53us   51.50us  21.35ms   99.57%
    Req/Sec    20.01k     6.10k   47.78k    70.81%
  3572829 requests in 1.00m, 6.31GB read
Requests/sec:  59469.71
Transfer/sec:    107.59MB
thread 1 made 1180397 requests and got 1180309 responses
thread 2 made 1188177 requests and got 1188078 responses
thread 3 made 1204639 requests and got 1204442 responses


-----------------------------------------------------------------------------------
./nginx-gcc531-cfzlib -V
nginx version: nginx/1.13.8 built by gcc 5.3.1 built with OpenSSL 1.1.0g TLS SNI support enabled
configure arguments: --with-ld-opt='-L/usr/local/lib -ljemalloc -Wl,-z,relro -Wl,-rpath,/usr/local/lib' --with-cc-opt='-I/usr/local/include -m64 -march=native -DTCP_FASTOPEN=23 -g -O3 -fstack-protector-strong -flto -fuse-ld=gold --param=ssp-buffer-size=4 -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wno-deprecated-declarations -gsplit-dwarf' --sbin-path=/usr/local/sbin/nginx --conf-path=/usr/local/nginx/conf/nginx.conf --with-compat --with-http_stub_status_module --with-http_secure_link_module --add-dynamic-module=../nginx-module-vts --with-libatomic --with-http_gzip_static_module --add-dynamic-module=../ngx_brotli --with-http_sub_module --with-http_addition_module --with-http_image_filter_module=dynamic --with-http_geoip_module --with-stream_geoip_module --with-stream_realip_module --with-stream_ssl_preread_module --with-threads --with-stream=dynamic --with-stream_ssl_module --with-http_realip_module --add-dynamic-module=../ngx-fancyindex-0.4.2 --add-module=../ngx_cache_purge-2.4.2 --add-module=../ngx_devel_kit-0.3.0 --add-dynamic-module=../set-misc-nginx-module-0.31 --add-dynamic-module=../echo-nginx-module-0.61 --add-module=../redis2-nginx-module-0.14 --add-module=../ngx_http_redis-0.3.7 --add-module=../memc-nginx-module-0.18 --add-module=../srcache-nginx-module-0.31 --add-dynamic-module=../headers-more-nginx-module-0.33 --with-pcre=../pcre-8.41 --with-pcre-jit --with-zlib=../zlib-cloudflare-1.3.0 --with-http_ssl_module --with-http_v2_module --with-openssl=../openssl-1.1.0g --with-openssl-opt='enable-ec_nistp_64_gcc_128'

start binaries/nginx-1.13.8/nginx-gcc531-cfzlib

HTTP/1.1 200 OK
Date: Mon, 22 Jan 2018 11:48:56 GMT
Content-Type: text/html; charset=utf-8
Content-Length: 3801
Last-Modified: Tue, 04 Apr 2017 07:34:43 GMT
Connection: keep-alive
Vary: Accept-Encoding
ETag: "58e34c93-ed9"
Server: nginx centminmod
X-Powered-By: centminmod
Accept-Ranges: bytes


/usr/local/bin/wrk-cmm -t3 -c600 -d60s --breakout -H 'Accept-Encoding: gzip' -s scripts/setup.lua http://localhost/
thread 1 created
thread 2 created
thread 3 created
Running 1m test @ http://localhost/
  3 threads and 600 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     9.56ms    7.26ms 108.15ms   74.15%
    Connect     1.92ms    4.20ms  41.41ms   92.10%
    TTFB        9.55ms    7.25ms 108.15ms   74.15%
    TTLB        3.42us   52.25us  15.93ms   99.59%
    Req/Sec    20.28k     6.45k   48.15k    71.78%
  3619661 requests in 1.00m, 6.39GB read
Requests/sec:  60258.10
Transfer/sec:    109.01MB
thread 1 made 1143884 requests and got 1143683 responses
thread 2 made 1268216 requests and got 1268054 responses
thread 3 made 1208024 requests and got 1207924 responses


-----------------------------------------------------------------------------------
./nginx-gcc631-cfzlib -V
nginx version: nginx/1.13.8 built by gcc 6.3.1 built with OpenSSL 1.1.0g TLS SNI support enabled
configure arguments: --with-ld-opt='-L/usr/local/lib -ljemalloc -Wl,-z,relro -Wl,-rpath,/usr/local/lib' --with-cc-opt='-I/usr/local/include -m64 -march=native -DTCP_FASTOPEN=23 -g -O3 -fstack-protector-strong -flto -fuse-ld=gold --param=ssp-buffer-size=4 -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wno-deprecated-declarations -gsplit-dwarf' --sbin-path=/usr/local/sbin/nginx --conf-path=/usr/local/nginx/conf/nginx.conf --with-compat --with-http_stub_status_module --with-http_secure_link_module --add-dynamic-module=../nginx-module-vts --with-libatomic --with-http_gzip_static_module --add-dynamic-module=../ngx_brotli --with-http_sub_module --with-http_addition_module --with-http_image_filter_module=dynamic --with-http_geoip_module --with-stream_geoip_module --with-stream_realip_module --with-stream_ssl_preread_module --with-threads --with-stream=dynamic --with-stream_ssl_module --with-http_realip_module --add-dynamic-module=../ngx-fancyindex-0.4.2 --add-module=../ngx_cache_purge-2.4.2 --add-module=../ngx_devel_kit-0.3.0 --add-dynamic-module=../set-misc-nginx-module-0.31 --add-dynamic-module=../echo-nginx-module-0.61 --add-module=../redis2-nginx-module-0.14 --add-module=../ngx_http_redis-0.3.7 --add-module=../memc-nginx-module-0.18 --add-module=../srcache-nginx-module-0.31 --add-dynamic-module=../headers-more-nginx-module-0.33 --with-pcre=../pcre-8.41 --with-pcre-jit --with-zlib=../zlib-cloudflare-1.3.0 --with-http_ssl_module --with-http_v2_module --with-openssl=../openssl-1.1.0g --with-openssl-opt='enable-ec_nistp_64_gcc_128'

start binaries/nginx-1.13.8/nginx-gcc631-cfzlib

HTTP/1.1 200 OK
Date: Mon, 22 Jan 2018 11:50:02 GMT
Content-Type: text/html; charset=utf-8
Content-Length: 3801
Last-Modified: Tue, 04 Apr 2017 07:34:43 GMT
Connection: keep-alive
Vary: Accept-Encoding
ETag: "58e34c93-ed9"
Server: nginx centminmod
X-Powered-By: centminmod
Accept-Ranges: bytes


/usr/local/bin/wrk-cmm -t3 -c600 -d60s --breakout -H 'Accept-Encoding: gzip' -s scripts/setup.lua http://localhost/
thread 1 created
thread 2 created
thread 3 created
Running 1m test @ http://localhost/
  3 threads and 600 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     9.65ms    7.63ms 116.94ms   75.40%
    Connect     2.17ms    5.61ms 104.92ms   92.91%
    TTFB        9.63ms    7.63ms 116.93ms   75.42%
    TTLB        3.46us   53.91us  25.72ms   99.55%
    Req/Sec    20.29k     6.29k   53.97k    70.69%
  3619883 requests in 1.00m, 6.40GB read
Requests/sec:  60234.86
Transfer/sec:    108.97MB
thread 1 made 1178666 requests and got 1178466 responses
thread 2 made 1249928 requests and got 1249787 responses
thread 3 made 1191667 requests and got 1191630 responses


-----------------------------------------------------------------------------------
./nginx-gcc721-cfzlib -V
nginx version: nginx/1.13.8 built by gcc 7.2.1 built with OpenSSL 1.1.0g TLS SNI support enabled
configure arguments: --with-ld-opt='-L/usr/local/lib -ljemalloc -Wl,-z,relro -Wl,-rpath,/usr/local/lib' --with-cc-opt='-I/usr/local/include -m64 -march=native -DTCP_FASTOPEN=23 -g -O3 -fstack-protector-strong -flto -fuse-ld=gold --param=ssp-buffer-size=4 -Wformat -Werror=format-security -Wimplicit-fallthrough=0 -fcode-hoisting -Wp,-D_FORTIFY_SOURCE=2 -Wno-deprecated-declarations -gsplit-dwarf' --sbin-path=/usr/local/sbin/nginx --conf-path=/usr/local/nginx/conf/nginx.conf --with-compat --with-http_stub_status_module --with-http_secure_link_module --add-dynamic-module=../nginx-module-vts --with-libatomic --with-http_gzip_static_module --add-dynamic-module=../ngx_brotli --with-http_sub_module --with-http_addition_module --with-http_image_filter_module=dynamic --with-http_geoip_module --with-stream_geoip_module --with-stream_realip_module --with-stream_ssl_preread_module --with-threads --with-stream=dynamic --with-stream_ssl_module --with-http_realip_module --add-dynamic-module=../ngx-fancyindex-0.4.2 --add-module=../ngx_cache_purge-2.4.2 --add-module=../ngx_devel_kit-0.3.0 --add-dynamic-module=../set-misc-nginx-module-0.31 --add-dynamic-module=../echo-nginx-module-0.61 --add-module=../redis2-nginx-module-0.14 --add-module=../ngx_http_redis-0.3.7 --add-module=../memc-nginx-module-0.18 --add-module=../srcache-nginx-module-0.31 --add-dynamic-module=../headers-more-nginx-module-0.33 --with-pcre=../pcre-8.41 --with-pcre-jit --with-zlib=../zlib-cloudflare-1.3.0 --with-http_ssl_module --with-http_v2_module --with-openssl=../openssl-1.1.0g --with-openssl-opt='enable-ec_nistp_64_gcc_128'

start binaries/nginx-1.13.8/nginx-gcc721-cfzlib

HTTP/1.1 200 OK
Date: Mon, 22 Jan 2018 11:51:08 GMT
Content-Type: text/html; charset=utf-8
Content-Length: 3801
Last-Modified: Tue, 04 Apr 2017 07:34:43 GMT
Connection: keep-alive
Vary: Accept-Encoding
ETag: "58e34c93-ed9"
Server: nginx centminmod
X-Powered-By: centminmod
Accept-Ranges: bytes


/usr/local/bin/wrk-cmm -t3 -c600 -d60s --breakout -H 'Accept-Encoding: gzip' -s scripts/setup.lua http://localhost/
thread 1 created
thread 2 created
thread 3 created
Running 1m test @ http://localhost/
  3 threads and 600 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     9.64ms    7.92ms 118.25ms   77.80%
    Connect     2.01ms    4.40ms  48.88ms   92.17%
    TTFB        9.63ms    7.91ms 118.24ms   77.82%
    TTLB        3.54us   50.50us  14.49ms   99.55%
    Req/Sec    20.34k     6.54k   45.70k    70.58%
  3629821 requests in 1.00m, 6.41GB read
Requests/sec:  60408.18
Transfer/sec:    109.29MB
thread 1 made 1226444 requests and got 1226244 responses
thread 2 made 1181644 requests and got 1181446 responses
thread 3 made 1222316 requests and got 1222131 responses


-----------------------------------------------------------------------------------
./nginx-gcc8-cfzlib -V
nginx version: nginx/1.13.8 built by gcc 8.0.0 built with OpenSSL 1.1.0g TLS SNI support enabled
configure arguments: --with-ld-opt='-L/usr/local/lib -ljemalloc -Wl,-z,relro -Wl,-rpath,/usr/local/lib' --with-cc-opt='-I/usr/local/include -m64 -march=native -DTCP_FASTOPEN=23 -g -O3 -fstack-protector-strong -flto -fuse-ld=gold --param=ssp-buffer-size=4 -Wformat -Werror=format-security -Wimplicit-fallthrough=0 -fcode-hoisting -Wno-cast-function-type -Wp,-D_FORTIFY_SOURCE=2 -Wno-deprecated-declarations' --sbin-path=/usr/local/sbin/nginx --conf-path=/usr/local/nginx/conf/nginx.conf --with-compat --with-http_stub_status_module --with-http_secure_link_module --add-dynamic-module=../nginx-module-vts --with-libatomic --with-http_gzip_static_module --add-dynamic-module=../ngx_brotli --with-http_sub_module --with-http_addition_module --with-http_image_filter_module=dynamic --with-http_geoip_module --with-stream_geoip_module --with-stream_realip_module --with-stream_ssl_preread_module --with-threads --with-stream=dynamic --with-stream_ssl_module --with-http_realip_module --add-dynamic-module=../ngx-fancyindex-0.4.2 --add-module=../ngx_cache_purge-2.4.2 --add-module=../ngx_devel_kit-0.3.0 --add-dynamic-module=../set-misc-nginx-module-0.31 --add-dynamic-module=../echo-nginx-module-0.61 --add-module=../redis2-nginx-module-0.14 --add-module=../ngx_http_redis-0.3.7 --add-module=../memc-nginx-module-0.18 --add-module=../srcache-nginx-module-0.31 --add-dynamic-module=../headers-more-nginx-module-0.33 --with-pcre=../pcre-8.41 --with-pcre-jit --with-zlib=../zlib-cloudflare-1.3.0 --with-http_ssl_module --with-http_v2_module --with-openssl=../openssl-1.1.0g --with-openssl-opt='enable-ec_nistp_64_gcc_128'

start binaries/nginx-1.13.8/nginx-gcc8-cfzlib

HTTP/1.1 200 OK
Date: Mon, 22 Jan 2018 11:52:14 GMT
Content-Type: text/html; charset=utf-8
Content-Length: 3801
Last-Modified: Tue, 04 Apr 2017 07:34:43 GMT
Connection: keep-alive
Vary: Accept-Encoding
ETag: "58e34c93-ed9"
Server: nginx centminmod
X-Powered-By: centminmod
Accept-Ranges: bytes


/usr/local/bin/wrk-cmm -t3 -c600 -d60s --breakout -H 'Accept-Encoding: gzip' -s scripts/setup.lua http://localhost/
thread 1 created
thread 2 created
thread 3 created
Running 1m test @ http://localhost/
  3 threads and 600 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     9.57ms    7.40ms 114.88ms   74.35%
    Connect     2.11ms    4.38ms  46.22ms   90.98%
    TTFB        9.56ms    7.39ms 114.88ms   74.37%
    TTLB        3.34us   53.65us  23.95ms   99.59%
    Req/Sec    20.24k     6.19k   47.51k    70.65%
  3614741 requests in 1.00m, 6.39GB read
Requests/sec:  60155.73
Transfer/sec:    108.83MB
thread 1 made 1198502 requests and got 1198308 responses
thread 2 made 1211573 requests and got 1211374 responses
thread 3 made 1205257 requests and got 1205059 responses
```