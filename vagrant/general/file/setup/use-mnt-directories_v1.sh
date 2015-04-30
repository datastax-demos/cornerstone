#!/usr/bin/env bash
set -x # echo on

VERSION=$(date +"%Y%m%d_%H%M%S")
sudo mv /var/lib/cassandra{,.bak.$VERSION}
sudo mv /var/log/cassandra{,.bak.$VERSION}

sudo ln -s /mnt/lib/cassandra /var/lib/cassandra
sudo ln -s /mnt/log/cassandra /var/log/cassandra

sudo chown -R cassandra:cassandra /var/lib/cassandra
sudo chown -R cassandra:cassandra /var/log/cassandra
sudo chown -R cassandra:cassandra /mnt/lib/cassandra
sudo chown -R cassandra:cassandra /mnt/log/cassandra
