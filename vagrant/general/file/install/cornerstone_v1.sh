#!/usr/bin/env bash
set -x # echo on

CORNERSTONE=/cornerstone
if [ ! -d ${CORNERSTONE} ]; then
    sudo mkdir -p /cornerstone
    sudo chown -R $(whoami):$(whoami) /cornerstone
    git clone https://github.com/datastax-demos/cornerstone.git /cornerstone
fi

bash /cornerstone/vagrant/general/file/setup/cache_v2.sh
bash /cornerstone/vagrant/general/file/setup/sbin_v2.sh
bash /cornerstone/vagrant/general/file/setup/mnt-directories_v2.sh
