#!/bin/bash
#########################################################
# benchmark nginx binaries compiled with different compilers
# for centminmod.com lemp stack built nginx web server
#########################################################
WORKDIR='binaries'
NGINXBIN_DFT='/usr/local/sbin/nginx'
NGINXBACKUP_BIN="${NGINXBIN_DFT}-bench-backup"
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

  backupbin

BINLIST='nginx-clang342 nginx-clang401 nginx-clang501 nginx-clang6 nginx-gcc531 nginx-gcc631 nginx-gcc721 nginx-gcc8'
for b in ${BINLIST[@]}; do
  echo
  echo "./$b -V"
  echo -n $("${WORKDIR}/$b" -V 2>&1 | head -n4 | cut -d' ' -f1-4)
  echo
  "${WORKDIR}/$b" -V 2>&1 | awk 'NR>4'
  echo
done

  restorebin

}

############
startbench