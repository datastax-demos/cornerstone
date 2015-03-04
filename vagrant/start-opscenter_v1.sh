#!/bin/sh

SEEDS="${1}"

sudo mkdir -p /etc/opscenter/clusters
echo "[cassandra]\nseed_hosts = ${SEEDS}" | sudo tee /etc/opscenter/clusters/demo.conf

sudo service opscenterd start
