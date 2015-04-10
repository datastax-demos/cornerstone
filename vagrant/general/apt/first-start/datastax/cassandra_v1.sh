#!/usr/bin/env bash
set -x # echo on

THIS_HOST=$(hostname -i | awk '{ print $2}')
SEEDS=$THIS_HOST
OPSCENTER_HOST=$THIS_HOST

while [[ $# > 1 ]]
do
key="$1"
case $key in
    -s|--seeds)
    SEEDS="$2"
    shift
    ;;
    -h|--opscenter-host)
    OPSCENTER_HOST="$2"
    shift
    ;;
    *)
    # unknown option
    ;;
esac
shift
done

bash /cornerstone/vagrant/general/apt/configure/datastax-enterprise/address_v2.sh \
    --listen-address $THIS_HOST --rpc-address $THIS_HOST
bash /cornerstone/vagrant/general/apt/configure/datastax-enterprise/heap_v2.sh
bash /cornerstone/vagrant/general/apt/configure/datastax-enterprise/seeds_v2.sh \
    --seeds $SEEDS
bash /cornerstone/vagrant/general/apt/configure/datastax-agent/stomp-interface_v2.sh \
    --opscenter-host $OPSCENTER_HOST
bash /cornerstone/vagrant/general/apt/start/datastax-enterprise_v2.sh \
    --host $THIS_HOST
bash /cornerstone/vagrant/general/apt/start/datastax-agent_v2.sh
