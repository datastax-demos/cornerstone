#!/bin/sh

# install nodejs
CACHE=/cache/node
if [ ! -d ${CACHE} ]; then
    wget -c http://nodejs.org/dist/v0.10.35/node-v0.10.35-linux-x64.tar.gz -P /cache
    tar -zxvf /cache/node-v0.10.35-linux-x64.tar.gz --directory /cache
    mv /cache/node*/ ${CACHE}
fi

# set PATH to include nodejs
export PATH=/cache/node/bin:${PATH}
echo "export PATH=/cache/node/bin:${PATH}" >> ${HOME}/.profile

# install npmbox
npm install -g bower
