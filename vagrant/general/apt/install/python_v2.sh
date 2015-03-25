#!/usr/bin/env bash
set -x # echo on

FILENAME=python_v1.sh

PACKAGES='python-pip python-dev libev4 libev-dev python-snappy'
CACHE=/cache/apt/$FILENAME

if [ ! -d ${CACHE} ]; then
    mkdir -p ${CACHE}
    apt-get --print-uris --yes install $PACKAGES | grep ^\' | cut -d\' -f2 > ${CACHE}.list
    wget -c -i ${CACHE}.list -P ${CACHE}
fi
sudo dpkg -i ${CACHE}/*
