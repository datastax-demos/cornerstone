#!/usr/bin/env bash
set -x # echo on

FILENAME=maven2_v1.sh

PACKAGES='maven2'
CACHE=/cache/apt/$FILENAME

if [ ! -d ${CACHE} ]; then
    mkdir -p ${CACHE}
    apt-get --print-uris --yes install $PACKAGES | grep ^\' | cut -d\' -f2 > ${CACHE}.list
    wget -c -i ${CACHE}.list -P ${CACHE}
fi
sudo dpkg -i ${CACHE}/*

SETTINGS=/etc/maven2/settings.xml
FIND_LINE=$(grep -n localRepository $SETTINGS | sed -n 2p | cut -f 1 -d ':')
INSERT_LINE=$(expr $FIND_LINE + 2)
sudo sed -i "${INSERT_LINE}s <localRepository>/cache/installed/m2/repository</localRepository>" $SETTINGS
