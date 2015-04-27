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

curl http://$SINGLE_SEED:8983/solr/resource/ticker.latest/solrconfig.xml --data-binary @/cornerstone/scripts/datastax/ticker/ticker.latest/solrconfig.xml -H 'Content-type:text/xml; charset=utf-8'
curl http://$SINGLE_SEED:8983/solr/resource/ticker.latest/schema.xml --data-binary @/cornerstone/scripts/datastax/ticker/ticker.latest/schema.xml -H 'Content-type:text/xml; charset=utf-8'
curl "http://$SINGLE_SEED:8983/solr/admin/cores?action=CREATE&name=ticker.latest&generateResources=false&reindex=true"
#curl "http://$SINGLE_SEED:8983/solr/admin/cores?action=RELOAD&name=ticker.latest&generateResources=false&reindex=true"

(
    cd /cornerstone/tools/datastax/metagener/datastax/ticker
    ./seed.py
)
