#!/usr/bin/env bash
set -x # echo on

bash /cornerstone/vagrant/general/apt/configure/datastax-enterprise/enable_analytics_v1.sh
bash /cornerstone/vagrant/general/apt/first-start/datastax/cassandra_v1.sh
