#!/usr/bin/env bash
set -x # echo on

SEEDS='127.0.0.1'
SOLR_DC='Solr'

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

# configure Flask application.cfg appropriately
CFG=/cornerstone/web/datastax/cornerstone-python/Cornerstone/application.cfg
sed -i -e "s/^DSE_CLUSTER.*/DSE_CLUSTER = '${SEEDS}'/" ${CFG}
sed -i -e "s/^DSE_SOLR_DC.*/DSE_SOLR_DC = '${SOLR_DC}'/" ${CFG}

# load schema into DSE
cqlsh $SINGLE_SEED -f /cornerstone/cql/datastax/template-cornerstone/ticker.cql

# create symlinks to Cornerstone project's templates and static files in the new project
ln -s /cornerstone/web/datastax/cornerstone-python/Cornerstone/templates /cornerstone/web/datastax/template-cornerstone/
ln -s /cornerstone/web/datastax/cornerstone-python/Cornerstone/static /cornerstone/web/datastax/template-cornerstone/

# start webserver, with logging
(
    nohup /cornerstone/web/datastax/template-cornerstone/run > ${HOME}/flask.log 2>&1
) &

wait
