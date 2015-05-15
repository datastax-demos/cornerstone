#!/usr/bin/env bash
set -x # echo on

bash /cornerstone/vagrant/general/apt/install/jdk7_v2.sh
bash /cornerstone/vagrant/general/apt/install/jdk8_v2.sh
bash /cornerstone/vagrant/general/apt/configure/java/default-jdk7_v2.sh
bash /cornerstone/vagrant/general/apt/install/dev_v3.sh
bash /cornerstone/vagrant/general/apt/install/python_v2.sh
bash /cornerstone/vagrant/general/apt/install/ruby_v2.sh

sudo pip install -r /cornerstone/web/datastax/cornerstone-python/Cornerstone/requirements.txt

CACHE=/cache/tar/gviz_api_py
DOWNLOADNAME=gviz_api_py-1.8.2.tar.gz
EXTRACTEDNAME=gviz_api_py-1.8.2
if [ ! -d ${CACHE} ]; then
    mkdir -p ${CACHE}
    wget -c https://google-visualization-python.googlecode.com/files/${DOWNLOADNAME} -P ${CACHE}

    mkdir -p /cache/extracted
    tar zxf ${CACHE}/${DOWNLOADNAME} --directory /cache/extracted
fi
(
    cd /cache/extracted/${EXTRACTEDNAME}
    sudo python setup.py install
)


CACHE=/cache/tar/jquery
DOWNLOADNAME=2.1.4.tar.gz
PACKAGESDIR=/cornerstone/web/datastax/cornerstone-python/Cornerstone/static/packages
if [ ! -d ${CACHE}/${DOWNLOADNAME} ]; then
    mkdir -p ${CACHE}
    wget https://github.com/jquery/jquery/archive/${DOWNLOADNAME} -P ${CACHE}
fi

mkdir -p ${PACKAGESDIR}
tar zxf ${CACHE}/${DOWNLOADNAME} --directory ${PACKAGESDIR}
mv $PACKAGESDIR/jquery-* $PACKAGESDIR/jquery

CACHE=/cache/tar/bootstrap
DOWNLOADNAME=v3.3.4.tar.gz
PACKAGESDIR=/cornerstone/web/datastax/cornerstone-python/Cornerstone/static/packages
if [ ! -d ${CACHE}/${DOWNLOADNAME} ]; then
    mkdir -p ${CACHE}
    wget https://github.com/twbs/bootstrap/archive/${DOWNLOADNAME} -P ${CACHE}
fi

mkdir -p ${PACKAGESDIR}
tar zxf ${CACHE}/${DOWNLOADNAME} --directory ${PACKAGESDIR}
mv $PACKAGESDIR/bootstrap-* $PACKAGESDIR/bootstrap


CFG=/cornerstone/web/datastax/cornerstone-python/Cornerstone/application.cfg
if [ ! -f ${CFG} ]; then
    cp /cornerstone/web/datastax/cornerstone-python/Cornerstone/application.cfg.template ${CFG}

    SECRET_KEY=$(date +%s | sha256sum | base64 | head -c 32)

    sed -i -e "s/^SECRET_KEY.*/SECRET_KEY = '${SECRET_KEY}'/" ${CFG}
fi

echo "export PYTHONPATH=/cornerstone/web/datastax/cornerstone-python:${PYTHONPATH}" >> ${HOME}/.profile
