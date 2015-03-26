#!/usr/bin/env bash
set -x # echo on

FILENAME=jdk8_v2.sh

PACKAGES='oracle-java8-installer'
CACHE=/cache/apt/$FILENAME
TAR_CACHE=/cache/tar/$FILENAME
INSTALLER_CACHE=/var/cache/oracle-jdk8-installer/

install-jdk ()
{
    (
        echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
        sudo dpkg -i ${CACHE}/java-common*
        sudo dpkg -i ${CACHE}/oracle-java*-installer*
        sudo dpkg -i ${CACHE}/*
    )
}

if [ ! -d ${CACHE} ]; then
    sudo add-apt-repository -y ppa:webupd8team/java
    sudo apt-get -y update

    mkdir -p ${CACHE}
    apt-get --print-uris --yes install $PACKAGES | grep ^\' | cut -d\' -f2 > ${CACHE}.list
    wget -c -i ${CACHE}.list -P ${CACHE}
fi

if [ ! -d ${TAR_CACHE} ]; then
    install-jdk
    mkdir -p ${TAR_CACHE}
    cp /var/cache/oracle-jdk*-installer/jdk-* ${TAR_CACHE}
else
    sudo mkdir -p ${INSTALLER_CACHE}
    sudo cp ${TAR_CACHE}/jdk-* ${INSTALLER_CACHE}
    install-jdk
fi
