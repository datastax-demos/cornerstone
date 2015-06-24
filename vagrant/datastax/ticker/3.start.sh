#!/usr/bin/env bash
set -x # echo on

SEEDS='127.0.0.1'
SOLR_DC='SearchAnalytics'

while [[ $# > 1 ]]
do
key="$1"
case $key in
    -s|--seeds)
    SEEDS="$2"
    shift
    ;;
    -l|--solr-dc)
    SOLR_DC="$2"
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
sed -i -e "s/^DSE_SOLR_DC.*/DSE_SOLR_DC = '${SOLR_DC}'/" ${CFG}

cqlsh $SINGLE_SEED -f /cornerstone/cql/datastax/ticker/ticker.cql

ln -s /cornerstone/web/datastax/cornerstone-python/Cornerstone/templates /cornerstone/web/datastax/ticker/
ln -s /cornerstone/web/datastax/cornerstone-python/Cornerstone/static /cornerstone/web/datastax/ticker/

(
    nohup /cornerstone/web/datastax/ticker/run > ${HOME}/flask.log 2>&1
) &

sleep 2
