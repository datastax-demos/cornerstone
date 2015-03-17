#!/bin/bash

FILENAME=bower_v1.sh

CACHE=/cache/tar/$FILENAME
DOWNLOADNAME=node-v0.10.35-linux-x64.tar.gz
EXTRACTEDNAME=node-v0.10.35-linux-x64
if [ ! -d ${CACHE} ]; then
    mkdir -p ${CACHE}
    wget -c http://nodejs.org/dist/v0.10.35/${DOWNLOADNAME} -P ${CACHE}

    mkdir -p /cache/installed
    tar -zxvf ${CACHE}/${DOWNLOADNAME} --directory /cache/installed
fi

export PATH=/cache/installed/${EXTRACTEDNAME}/bin:${PATH}
echo "export PATH=/cache/installed/${EXTRACTEDNAME}/bin:${PATH}" >> ${HOME}/.profile

if [ ! -f /cache/installed/${EXTRACTEDNAME}/bin/bower ]; then
    npm install -g bower
fi
