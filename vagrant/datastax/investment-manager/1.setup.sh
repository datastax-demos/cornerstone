#!/usr/bin/env bash
set -x # echo on

if [ ! -d ${CACHE} ]; then
    sudo mkdir -p /cornerstone
    sudo chown -R $(whoami):$(whoami) /cornerstone
    git clone https://github.com/datastax-demos/cornerstone.git /cornerstone
fi
