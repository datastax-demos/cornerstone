#!/bin/bash

LISTEN_ADDRESS='localhost'
RPC_ADDRESS='localhost'

while [[ $# > 1 ]]
do
key="$1"
case $key in
    -l|--listen-address)
    LISTEN_ADDRESS="$2"
    shift
    ;;
    -r|--rpc-address)
    RPC_ADDRESS="$2"
    shift
    ;;
    *)
    # unknown option
    ;;
esac
shift
done

sudo sed -i -e "s|listen_address:.*|listen_address: ${LISTEN_ADDRESS}|g" /etc/dse/cassandra/cassandra.yaml
sudo sed -i -e "s|rpc_address:.*|rpc_address: ${RPC_ADDRESS}|g" /etc/dse/cassandra/cassandra.yaml
