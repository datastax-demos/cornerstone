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


ln -s /cornerstone/web/datastax/cornerstone-python/Cornerstone/templates /cornerstone/web/datastax/black-friday/
ln -s /cornerstone/web/datastax/cornerstone-python/Cornerstone/static /cornerstone/web/datastax/black-friday/

export PYTHONPATH=/cornerstone/web/datastax/cornerstone-python:${PYTHONPATH}
echo "export PYTHONPATH=/cornerstone/web/datastax/cornerstone-python:${PYTHONPATH}" >> ${HOME}/.profile

(
    nohup /cornerstone/web/datastax/black-friday/run
) &

sleep 2
