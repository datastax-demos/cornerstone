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


# add post-start setup instructions here

