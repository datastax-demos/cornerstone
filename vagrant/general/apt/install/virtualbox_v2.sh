#!/usr/bin/env bash

FILENAME=virtualbox_v1.sh

PACKAGES='virtualbox-4.3 dkms'
CACHE=/cache/apt/$FILENAME

if [ ! -d ${CACHE} ]; then
    echo "deb http://download.virtualbox.org/virtualbox/debian trusty contrib" | \
        sudo tee /etc/apt/sources.list.d/virtualbox.list
    curl -L https://www.virtualbox.org/download/oracle_vbox.asc | sudo apt-key add -
    sudo apt-get update

    mkdir -p ${CACHE}
    apt-get --print-uris --yes install $PACKAGES | grep ^\' | cut -d\' -f2 > ${CACHE}.list
    wget -c -i ${CACHE}.list -P ${CACHE}
fi
sudo dpkg -i ${CACHE}/*
