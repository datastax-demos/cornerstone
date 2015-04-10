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

bash /cornerstone/vagrant/general/apt/configure/datastax-enterprise/enable_analytics_v1.sh
bash /cornerstone/vagrant/general/apt/first-start/datastax/cassandra_v1.sh \
    --seeds $SEEDS --opscenter-host $OPSCENTER_HOST
