#!/usr/bin/env bash

FILENAME=java-default-jdk8_v1.sh

PACKAGES='oracle-java8-set-default'
CACHE=/cache/apt/$FILENAME

if [ ! -d ${CACHE} ]; then
    sudo add-apt-repository -y ppa:webupd8team/java
    sudo apt-get -y update

    mkdir -p ${CACHE}
    apt-get --print-uris --yes install $PACKAGES | grep ^\' | cut -d\' -f2 > ${CACHE}.list
    wget -c -i ${CACHE}.list -P ${CACHE}
fi
sudo dpkg -i ${CACHE}/*
