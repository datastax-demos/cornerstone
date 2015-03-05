#!/bin/sh

# ${1} == DATASTAX_USER
# ${2} == DATASTAX_PASS

# ${3} == cqlsh IP address, default: 127.0.0.1
# ${4} == cassandra.yaml csv seeds, default: no changes made

DATASTAX_USER=${1}
DATASTAX_PASS=${2}

# cache and install dse
CACHE=/cache/apt/datastax-enterprise
if [ ! -d ${CACHE} ]; then
    mkdir -p ${CACHE}

    # setup repository access
    echo "deb http://${DATASTAX_USER}:${DATASTAX_PASS}@debian.datastax.com/enterprise stable main" | \
        sudo tee -a /etc/apt/sources.list.d/datastax.sources.list
    curl -L https://debian.datastax.com/debian/repo_key | sudo apt-key add -
    sudo apt-get update

    PACKAGES='dse-full'
    apt-get --print-uris --yes install $PACKAGES | grep ^\' | cut -d\' -f2 > ${CACHE}.list
    wget -c -i ${CACHE}.list -P ${CACHE}
fi
sudo dpkg -i ${CACHE}/*

sudo sed -i -e "s|^#MAX_HEAP_SIZE=.*|MAX_HEAP_SIZE=\"750M\"|g" /etc/dse/cassandra/cassandra-env.sh
sudo sed -i -e "s|^#HEAP_NEWSIZE=.*|HEAP_NEWSIZE=\"200M\"|g" /etc/dse/cassandra/cassandra-env.sh

if [ -n "${3}" ]; then
    sudo sed -i -e "s|listen_address:.*|listen_address: ${3}|g" /etc/dse/cassandra/cassandra.yaml
    sudo sed -i -e "s|rpc_address:.*|rpc_address: ${3}|g" /etc/dse/cassandra/cassandra.yaml
fi

if [ -n "${4}" ]; then
    sudo sed -i -e "s|seeds:.*|seeds: \"${4}\"|g" /etc/dse/cassandra/cassandra.yaml
fi
