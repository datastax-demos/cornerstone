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

SINGLE_SEED="${SEEDS%%,*}"
#cqlsh $SINGLE_SEED -f /cornerstone/cql/datastax/black-friday/retail.cql

#/cornerstone/scripts/datastax/black-friday/1.seed_zipcode_data/1.zipcodes-to-cassandra.py

#/cornerstone/scripts/datastax/black-friday/2.seed_retail_data/1.download-data.sh
#/cornerstone/scripts/datastax/black-friday/2.seed_retail_data/2.data-to-cassandra.py

#/cornerstone/scripts/datastax/black-friday/3.scan_data/1.extract-ids.py
#/cornerstone/scripts/datastax/black-friday/3.scan_data/2.extract-zipcodes.py
#/cornerstone/scripts/datastax/black-friday/3.scan_data/3.start-metagener.sh
sleep 20
#/cornerstone/scripts/datastax/black-friday/3.scan_data/4.metagener-to-cassandra-stores-employees.py

mkdir -p /mnt/log/spark_streaming/
nohup nc -l 5005 &
#nohup /cornerstone/scripts/datastax/black-friday/3.scan_data/5.metagener-to-cassandra-scan-items.py &
