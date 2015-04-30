#!/usr/bin/env bash
set -x # echo on

sudo mkdir -p /mnt/lib/cassandra
sudo mkdir -p /mnt/log/cassandra

sudo chown -R $(whoami):$(whoami) /mnt/lib
sudo chown -R $(whoami):$(whoami) /mnt/log
