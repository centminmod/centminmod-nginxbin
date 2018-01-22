#!/bin/bash
#########################################################
# benchmark nginx binaries compiled with different compilers
# for centminmod.com lemp stack built nginx web server
# https://www.nginx.com/resources/wiki/start/topics/tutorials/commandline/
# http://nginx.org/en/docs/http/ngx_http_core_module.html
#########################################################
WORKDIR='binaries/nginx-1.13.8'
NGINXBIN_DFT='/usr/local/sbin/nginx'
NGINX_CONFIGFILE='/usr/local/nginx/conf/nginx.conf'
NGINXBACKUP_BIN="${NGINXBIN_DFT}-bench-backup"

# wrk binary and parameters
WRKBIN='/usr/local/bin/wrk-cmm'
WRK_OPTS='--breakout'
THREADS='3'
USERS='300'
DURATION='30s'
TARGET_URL='http://localhost/'

SLEEPTIME='15'
DEBUG='n'
#########################################################

backupbin() {
  echo
  echo "backup existing binary"
  echo "\cp -fa "$NGINXBIN_DFT" "$NGINXBACKUP_BIN""
  \cp -fa "$NGINXBIN_DFT" "$NGINXBACKUP_BIN"
  echo
}

restorebin() {
  echo
  echo "restore existing binary"
  echo "\cp -fa "$NGINXBACKUP_BIN" "$NGINXBIN_DFT""
  \cp -fa "$NGINXBACKUP_BIN" "$NGINXBIN_DFT"
  echo
}

startbench() {
  # stop default nginx server
  service nginx stop >/dev/null 2>&1
  ps xao pid,ppid,command | grep 'nginx[:] [master|worker]' |awk '{print $1}' | xargs -n1 | while read p; do kill -9 $p >/dev/null 2>&1 ; done
  sleep 2
  echo
  
  # backup binary
  # backupbin

BINLIST='nginx-clang342 nginx-clang401 nginx-clang501 nginx-clang6 nginx-gcc485 nginx-gcc531 nginx-gcc631 nginx-gcc721 nginx-gcc8 nginx-clang401-cfzlib nginx-clang501-cfzlib nginx-clang6-cfzlib nginx-gcc485-cfzlib nginx-gcc531-cfzlib nginx-gcc631-cfzlib nginx-gcc721-cfzlib nginx-gcc8-cfzlib'
for b in ${BINLIST[@]}; do
  echo
  echo "-----------------------------------------------------------------------------------"
  echo "./$b -V"
  echo -n $("${WORKDIR}/$b" -V 2>&1 | head -n4 | cut -d' ' -f1-4)
  echo
  "${WORKDIR}/$b" -V 2>&1 | awk 'NR>4'
  echo
  # start nginx binary
  echo "start ${WORKDIR}/$b"
  nohup "${WORKDIR}/$b" -c "$NGINX_CONFIGFILE" >/dev/null 2>&1 &
  sleep $SLEEPTIME
  if [[ "$DEBUG" = [yY] ]]; then
    ps xao pid,ppid,command | grep 'nginx[:] [master|worker]'
  fi
  echo

  # wrk
  if [[ -f "$WRKBIN" ]]; then
    curl -I "$TARGET_URL"
    if [[ "$DEBUG" = [yY] ]]; then
      curl -sw "\n DNS Lookup: %{time_namelookup}\n SSL Handshake (time_appconnect): %{time_appconnect}\n TCP Connect time: %{time_connect}\n Pre-Transfer Negotiations: %{time_pretransfer}\n Redirect Time: %{time_redirect}\n TTFB (includes pre-transfer): %{time_starttransfer}\n Total time: %{time_total}\n" -o /dev/null $TARGET_URL
    fi
    echo
    echo "$WRKBIN -t${THREADS} -c${USERS} -d${DURATION} $WRK_OPTS -H 'Accept-Encoding: gzip' -s scripts/setup.lua $TARGET_URL"
    $WRKBIN -t${THREADS} -c${USERS} -d${DURATION} $WRK_OPTS -H 'Accept-Encoding: gzip' -s scripts/setup.lua "$TARGET_URL"
    echo
  fi

  if [[ "$DEBUG" = [yY] ]]; then
    # ss stats
    ss -s
    echo
  fi

  # stop nginx process
  if [[ "$DEBUG" = [yY] ]]; then
    echo "kill ${WORKDIR}/$b processes"
    # echo "$(pidof ${WORKDIR}/$b)" | xargs -n1 | while read p; do echo "kill -9 $p"; kill -9 $p; done
    ps xao pid,ppid,command | grep 'nginx[:] [master|worker]' |awk '{print $1}' | xargs -n1 | while read p; do echo "kill -9 $p"; kill -9 $p; done
    sleep $SLEEPTIME
  else
    ps xao pid,ppid,command | grep 'nginx[:] [master|worker]' |awk '{print $1}' | xargs -n1 | while read p; do kill -9 $p; done
  fi
done

  # restorebin
  # star nginx
  echo
  service nginx start >/dev/null 2>&1
}

############
startbench