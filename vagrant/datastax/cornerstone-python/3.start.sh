#!/usr/bin/env bash
set -x # echo on

SEEDS='127.0.0.1'

while [[ $# > 1 ]]
do
key="$1"
case $key in
    -s|--seeds)
    SEEDS="$2"
    shift
    ;;
    *)
    # unknown option
    ;;
esac
shift
done

CFG=/cornerstone/web/datastax/cornerstone-python/Cornerstone/application.cfg
sed -i -e "s/^DSE_CLUSTER.*/DSE_CLUSTER = '${SEEDS}'/" ${CFG}

(
    nohup /cornerstone/web/datastax/cornerstone-python/run
) &

sleep 2
