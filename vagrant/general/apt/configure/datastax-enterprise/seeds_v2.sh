#!/bin/bash

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

sudo sed -i -e "s|seeds:.*|seeds: \"${SEEDS}\"|g" /etc/dse/cassandra/cassandra.yaml
