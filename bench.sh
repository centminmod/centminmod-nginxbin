#!/bin/bash
#########################################################
# benchmark nginx binaries compiled with different compilers
# for centminmod.com lemp stack built nginx web server
#########################################################
WORKDIR='binaries'
NGINXBIN_DFT='/usr/local/sbin/nginx'
NGINXBACKUP_BIN="${NGINXBIN_DFT}-bench-backup"

# wrk binary and parameters
WRKBIN='/usr/local/bin/wrk-cmm'
WRK_OPTS='--breakout'
USERS='200'
DURATION='20s'
TARGET_URL='http://localhost/'
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
  sleep 2
  echo
  
  # backup binary
  # backupbin

BINLIST='nginx-clang342 nginx-clang401 nginx-clang501 nginx-clang6 nginx-gcc485 nginx-gcc531 nginx-gcc631 nginx-gcc721 nginx-gcc8'
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
  nohup "${WORKDIR}/$b" >/dev/null 2>&1 &
  sleep 10
  ps xao pid,ppid,command | grep 'nginx[:] [master|worker]'
  echo

  # wrk
  if [[ -f "$WRKBIN" ]]; then
    echo "$WRKBIN -c${USERS} -d${DURATION} $WRK_OPTS $TARGET_URL"
    $WRKBIN -c${USERS} -d${DURATION} $WRK_OPTS $TARGET_URL
    echo
  fi

  # ss stats
  ss -s
  echo

  # stop nginx process
  echo "kill ${WORKDIR}/$b processes"
  # echo "$(pidof ${WORKDIR}/$b)" | xargs -n1 | while read p; do echo "kill -9 $p"; kill -9 $p; done
  ps xao pid,ppid,command | grep 'nginx[:] [master|worker]' |awk '{print $1}' | xargs -n1 | while read p; do echo "kill -9 $p"; kill -9 $p; done
  sleep 10
done

  # restorebin
  # star nginx
  echo
  service nginx start >/dev/null 2>&1
}

############
startbench