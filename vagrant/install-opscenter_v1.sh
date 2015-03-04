#!/bin/sh

# cache and install dse
CACHE=/cache/apt/opscenter
if [ ! -d ${CACHE} ]; then
    mkdir -p ${CACHE}

    # setup repository access
    echo "deb http://debian.datastax.com/community stable main" | \
        sudo tee -a /etc/apt/sources.list.d/datastax.sources.list
    curl -L https://debian.datastax.com/debian/repo_key | sudo apt-key add -
    sudo apt-get update

    PACKAGES='opscenter'
    apt-get --print-uris --yes install $PACKAGES | grep ^\' | cut -d\' -f2 > ${CACHE}.list
    wget -c -i ${CACHE}.list -P ${CACHE}
fi
sudo dpkg -i ${CACHE}/*
