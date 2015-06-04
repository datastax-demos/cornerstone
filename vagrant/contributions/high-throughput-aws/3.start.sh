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

# load schema into DSE
cqlsh $SINGLE_SEED -f /cornerstone/cql/contributions/high-throughput-aws/schema.cql

