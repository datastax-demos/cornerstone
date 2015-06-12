#!/usr/bin/env bash
set -x # echo on

FILENAME=sbt_v1.sh

PACKAGES='sbt'
CACHE=/cache/apt/$FILENAME

if [ ! -d ${CACHE} ]; then
    mkdir -p ${CACHE}
    wget -c https://dl.bintray.com/sbt/debian/sbt-0.13.8.deb -P ${CACHE}
fi
sudo dpkg -i ${CACHE}/*
