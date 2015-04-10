#!/usr/bin/env bash
set -x # echo on

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

bash /cornerstone/vagrant/general/apt/configure/opscenter/seed-hosts_v2.sh \
    --seeds $SEEDS
bash /cornerstone/vagrant/general/apt/start/opscenter_v2.sh
