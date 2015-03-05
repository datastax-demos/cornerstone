#!/bin/sh

sudo pip install -r /cornerstone/flask/DataStaxDemo/requirements.txt

CACHE=/cache/gviz_api_py
if [ ! -d ${CACHE} ]; then
    wget -c https://google-visualization-python.googlecode.com/files/gviz_api_py-1.8.2.tar.gz -P /cache
    tar -zxvf /cache/gviz_api_py-1.8.2.tar.gz --directory /cache
    mv /cache/gviz_api_py*/ ${CACHE}
fi

(
    cd /cache/gviz_api_py
    sudo python setup.py install
)

(
    cd /cornerstone/flask/DataStaxDemo
    bower --config.analytics=false install
)

CFG=/cornerstone/flask/DataStaxDemo/application.cfg
if [ ! -f ${CFG} ]; then
    # copy the template to its real location
    cp /cornerstone/flask/DataStaxDemo/application.cfg.template ${CFG}

    # generate new secret key and DSE IP addresses
    SECRET_KEY=$(date +%s | sha256sum | base64 | head -c 32)

#    DSE_CLUSTER='192.168.101.10,192.168.101.11,192.168.101.12'
    DSE_CLUSTER='127.0.0.1'

    # make replacements
    sed -i -e "s/^SECRET_KEY.*/SECRET_KEY = '${SECRET_KEY}'/" ${CFG}
    sed -i -e "s/^DSE_CLUSTER.*/DSE_CLUSTER = '${DSE_CLUSTER}'/" ${CFG}
fi
