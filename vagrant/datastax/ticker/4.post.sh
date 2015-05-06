#!/usr/bin/env bash
set -x # echo on

SEEDS='127.0.0.1'
SOLR_NODE='127.0.0.1'

while [[ $# > 1 ]]
do
key="$1"
case $key in
    -s|--seeds)
    SEEDS="$2"
    shift
    ;;
    -l|--solr-node)
    SOLR_NODE="$2"
    shift
    ;;
    *)
    # unknown option
    ;;
esac
shift
done

curl http://$SOLR_NODE:8983/solr/resource/ticker.latest/solrconfig.xml --data-binary @/cornerstone/scripts/datastax/ticker/ticker.latest/solrconfig.xml -H 'Content-type:text/xml; charset=utf-8'
curl http://$SOLR_NODE:8983/solr/resource/ticker.latest/schema.xml --data-binary @/cornerstone/scripts/datastax/ticker/ticker.latest/schema.xml -H 'Content-type:text/xml; charset=utf-8'
curl "http://$SOLR_NODE:8983/solr/admin/cores?action=CREATE&name=ticker.latest&generateResources=false&reindex=true"
#curl "http://$SOLR_NODE:8983/solr/admin/cores?action=RELOAD&name=ticker.latest&generateResources=false&reindex=true"

(
    cd /cornerstone/tools/datastax/metagener/datastax/ticker

    sed -i -e "s/127.0.0.1/${SEEDS}/" ./seed.py
    sed -i -e "s/127.0.0.1/${SEEDS}/" ./stream.py

    ./seed.py
    (
        nohup ./stream.py > ${HOME}/stream.log 2>&1
    ) &
)

sleep 2
