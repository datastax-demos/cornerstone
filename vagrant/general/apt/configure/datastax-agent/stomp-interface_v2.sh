#!/usr/bin/env bash
set -x # echo on

OPSCENTER_HOST='127.0.0.1'

while [[ $# > 1 ]]
do
key="$1"
case $key in
    -h|--opscenter-host)
    OPSCENTER_HOST="$2"
    shift
    ;;
    *)
    # unknown option
    ;;
esac
shift
done

echo "stomp_interface: ${OPSCENTER_HOST}" | sudo tee -a /var/lib/datastax-agent/conf/address.yaml
