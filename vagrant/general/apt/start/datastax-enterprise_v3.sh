#!/usr/bin/env bash
set -x # echo on

HOST='127.0.0.1'

while [[ $# > 1 ]]
do
key="$1"
case $key in
    -h|--host)
    HOST="$2"
    shift
    ;;
    *)
    # unknown option
    ;;
esac
shift
done

bash /cornerstone/vagrant/general/file/setup/mnt-directories_v2.sh
bash /cornerstone/vagrant/general/file/setup/use-mnt-directories_v1.sh

sudo service dse start

# wait for Cassandra's native transport to start
while :
do
    echo "SELECT bootstrapped FROM system.local;" | cqlsh ${HOST} && break
    sleep 1
done
