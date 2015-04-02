#!/usr/bin/env bash
set -x # echo on

bash /cornerstone/vagrant/general/apt/install/jdk7_v2.sh

FILENAME=datastax-enterprise_v3.sh

PACKAGES='dse-full'
CACHE=/cache/apt/$FILENAME

while [[ $# > 1 ]]
do
key="$1"
case $key in
    -u|--datastax-user)
    DATASTAX_USER="$2"
    shift
    ;;
    -p|--datastax-pass)
    DATASTAX_PASS="$2"
    shift
    ;;
    *)
    # unknown option
    ;;
esac
shift
done

if [ ! -d ${CACHE} ]; then
    if [ -z "$DATASTAX_USER" ] || [ -z "$DATASTAX_PASS" ]; then
        >&2 echo "\$DATASTAX_USER (-u/--datastax-user) and \$DATASTAX_PASS (-p/--datastax-pass) must be set."
        exit 1
    fi

    # setup repository access
    echo "deb http://${DATASTAX_USER}:${DATASTAX_PASS}@debian.datastax.com/enterprise stable main" | \
        sudo tee -a /etc/apt/sources.list.d/datastax.sources.list
    curl -L https://debian.datastax.com/debian/repo_key | sudo apt-key add -
    sudo apt-get update

    mkdir -p ${CACHE}
    apt-get --print-uris --yes install $PACKAGES | grep ^\' | cut -d\' -f2 > ${CACHE}.list
    wget -c -i ${CACHE}.list -P ${CACHE}
fi
sudo dpkg -i ${CACHE}/*
