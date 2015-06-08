#!/usr/bin/env bash
set -x # echo on

FILENAME=git_v1.sh

PACKAGES='git-core'
CACHE=/cache/apt/$FILENAME

sudo mkdir -p /cache/tar
sudo chown -R $(whoami):$(whoami) /cache

if [ ! -d ${CACHE} ]; then
    mkdir -p ${CACHE}
    sudo apt-get update && sudo apt-get update
    apt-get --print-uris --yes install $PACKAGES | grep ^\' | cut -d\' -f2 > ${CACHE}.list
    wget -c -i ${CACHE}.list -P ${CACHE}
fi
sudo dpkg -i ${CACHE}/*
