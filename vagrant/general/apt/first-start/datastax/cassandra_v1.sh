#!/usr/bin/env bash
set -x # echo on

bash /cornerstone/vagrant/general/apt/configure/datastax-enterprise/address_v2.sh
bash /cornerstone/vagrant/general/apt/configure/datastax-enterprise/heap_v2.sh
bash /cornerstone/vagrant/general/apt/configure/datastax-enterprise/seeds_v2.sh
bash /cornerstone/vagrant/general/apt/configure/datastax-agent/stomp-interface_v2.sh
bash /cornerstone/vagrant/general/apt/start/datastax-enterprise_v2.sh
bash /cornerstone/vagrant/general/apt/start/datastax-agent_v2.sh
