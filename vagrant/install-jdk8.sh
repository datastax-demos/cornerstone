#!/bin/bash

install-jdk ()
{
    (
        CACHE=/cache/apt/webupd8team
        echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
        sudo dpkg -i ${CACHE}/*
    )
}

# cache and install required packages
CACHE=/cache/apt/webupd8team
if [ ! -d ${CACHE} ]; then
    mkdir -p ${CACHE}

    sudo add-apt-repository -y ppa:webupd8team/java
    sudo apt-get -y update

    PACKAGES='oracle-java8-installer oracle-java8-set-default'
    apt-get --print-uris --yes install $PACKAGES | grep ^\' | cut -d\' -f2 > ${CACHE}.list
    wget -c -i ${CACHE}.list -P ${CACHE}
fi

CACHE=/cache/apt/jdk
if [ ! -d ${CACHE} ]; then
    mkdir -p ${CACHE}
    install-jdk
    cp /var/cache/oracle-jdk8-installer/jdk-* ${CACHE}
else
    INSTALLER_CACHE=/var/cache/oracle-jdk8-installer/
    sudo mkdir -p ${INSTALLER_CACHE}
    sudo cp ${CACHE}/jdk-* ${INSTALLER_CACHE}
    install-jdk
fi
