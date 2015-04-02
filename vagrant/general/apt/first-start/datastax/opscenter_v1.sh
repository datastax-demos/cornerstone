#!/usr/bin/env bash
set -x # echo on

bash /cornerstone/vagrant/general/apt/configure/opscenter/seed-hosts_v2.sh
bash /cornerstone/vagrant/general/apt/start/opscenter_v2.sh
