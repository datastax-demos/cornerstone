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

SINGLE_SEED="${SEEDS%%,*}"

CFG=/cornerstone/web/datastax/cornerstone-python/Cornerstone/application.cfg
sed -i -e "s/^DSE_CLUSTER.*/DSE_CLUSTER = '${SEEDS}'/" ${CFG}

cqlsh $SINGLE_SEED -f /cornerstone/cql/datastax/ticker/ticker.cql

ln -s /cornerstone/web/datastax/cornerstone-python/Cornerstone/templates /cornerstone/web/datastax/ticker/
ln -s /cornerstone/web/datastax/cornerstone-python/Cornerstone/static /cornerstone/web/datastax/ticker/

export PYTHONPATH=/cornerstone/web/datastax/cornerstone-python:${PYTHONPATH}
echo "export PYTHONPATH=/cornerstone/web/datastax/cornerstone-python:${PYTHONPATH}" >> ${HOME}/.profile

(
    nohup /cornerstone/web/datastax/ticker/run > ${HOME}/flask.log 2>&1
) &

sleep 2
