#!/bin/bash

SEEDS='127.0.0.1'

while [[ $# > 1 ]]
do
key="$1"
case $key in
    -s|--seeds)
    SEEDS="$2"
    shift
    ;;
    *)
    # unknown option
    ;;
esac
shift
done

sudo pip install -r /cornerstone/web/datastax/python-cornerstone/Cornerstone/requirements.txt

CACHE=/cache/tar/gviz_api_py
DOWNLOADNAME=gviz_api_py-1.8.2.tar.gz
EXTRACTEDNAME=gviz_api_py-1.8.2
if [ ! -d ${CACHE} ]; then
    mkdir -p ${CACHE}
    wget -c https://google-visualization-python.googlecode.com/files/${DOWNLOADNAME} -P ${CACHE}

    mkdir -p /cache/extracted
    tar -zxvf ${CACHE}/${DOWNLOADNAME} --directory /cache/extracted
fi
(
    cd /cache/extracted/${EXTRACTEDNAME}
    sudo python setup.py install
)

(
    cd /cornerstone/web/datastax/python-cornerstone/Cornerstone
    bower --config.analytics=false install
)

CFG=/cornerstone/web/datastax/python-cornerstone/Cornerstone/application.cfg
if [ ! -f ${CFG} ]; then
    cp /cornerstone/web/datastax/python-cornerstone/Cornerstone/application.cfg.template ${CFG}

    SECRET_KEY=$(date +%s | sha256sum | base64 | head -c 32)

    sed -i -e "s/^SECRET_KEY.*/SECRET_KEY = '${SECRET_KEY}'/" ${CFG}
    sed -i -e "s/^DSE_CLUSTER.*/DSE_CLUSTER = '${SEEDS}'/" ${CFG}
fi
