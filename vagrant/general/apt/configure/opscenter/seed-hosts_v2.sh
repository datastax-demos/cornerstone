#!/usr/bin/env bash

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

sudo mkdir -p /etc/opscenter/clusters
echo "[cassandra]\nseed_hosts = ${SEEDS}" | sudo tee /etc/opscenter/clusters/Demo.conf
