#!/bin/sh

# setup shell cache directory for production servers
sudo mkdir -p /cache

# chown directories accordingly
sudo chown -R $(whoami):$(whoami) /cache

# add /sbin to PATH
echo 'export PATH=/sbin:$PATH' >> ${HOME}/.profile

# update apt repos
sudo apt-get update || exit 1

# cache and install required packages
CACHE=/cache/apt/bootstrap
if [ ! -d ${CACHE} ]; then
    mkdir -p ${CACHE}
    PACKAGES='ruby-dev build-essential git-core tree python-pip python-dev libev4 libev-dev python-snappy vim'
    apt-get --print-uris --yes install $PACKAGES | grep ^\' | cut -d\' -f2 > ${CACHE}.list
    wget -c -i ${CACHE}.list -P ${CACHE}
fi
sudo dpkg -i ${CACHE}/*
