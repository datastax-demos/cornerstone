#!/bin/sh

# ${1} == cqlsh IP address, default: 127.0.0.1
# ${2} == OpsCenter IP address, default: 127.0.0.1

# start dse
sudo service dse start

# wait for Cassandra's native transport to start
while :
do
    if [ -n "${1}" ]; then
        echo "SELECT bootstrapped FROM system.local;" | cqlsh ${1} && break
    else
        echo "SELECT bootstrapped FROM system.local;" | cqlsh 127.0.0.1 && break
    fi
    sleep 1
done

# setup opscenter's stomp interface
if [ -n "${2}" ]; then
    echo "stomp_interface: ${2}" | sudo tee -a /var/lib/datastax-agent/conf/address.yaml
else
    echo "stomp_interface: 127.0.0.1" | sudo tee -a /var/lib/datastax-agent/conf/address.yaml
fi
sudo service datastax-agent start
