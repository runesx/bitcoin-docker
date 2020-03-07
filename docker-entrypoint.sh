#!/bin/bash
set -e
GOSU="gosu bitcoin"
# don't use gosu when id is not 0
if [ "$(id -u)" -ne "0" ];then
  GOSU=""
fi

if [[ "$1" == "bitcoin-cli" || "$1" == "bitcoin-tx" ]]; then
	exec $GOSU "$@"
else
  exec $GOSU "bitcoind"
fi

