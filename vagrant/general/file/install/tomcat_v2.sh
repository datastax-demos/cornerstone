#!/usr/bin/env bash
set -x # echo on

FILENAME=tomcat_v1.sh

CACHE=/cache/tar/$FILENAME
DOWNLOADNAME=apache-tomcat-8.0.20.tar.gz
EXTRACTEDNAME=apache-tomcat-8.0.20
if [ ! -d ${CACHE} ]; then
    mkdir -p ${CACHE}
    wget -c http://supergsego.com/apache/tomcat/tomcat-8/v8.0.20/bin/${DOWNLOADNAME} -P ${CACHE}

    mkdir -p /cache/installed
    tar -zxvf ${CACHE}/${DOWNLOADNAME} --directory /cache/installed
fi

export CATALINA_HOME=/cache/installed/${EXTRACTEDNAME}
echo "export CATALINA_HOME=/cache/installed/${EXTRACTEDNAME}" >> ${HOME}/.profile
