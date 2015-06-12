#!/usr/bin/env bash
set -x # echo on

SEEDS='127.0.0.1'
SOLR_DC='Solr'

while [[ $# > 1 ]]
do
key="$1"
case $key in
    -s|--seeds)
    SEEDS="$2"
    shift
    ;;
    -l|--solr-dc)
    SOLR_DC="$2"
    shift
    ;;
    *)
    # unknown option
    ;;
esac
shift
done

SINGLE_SEED="${SEEDS%%,*}"

cd datastax-spark-streaming-demo

sbt assembly run
dse spark-submit \
    --class com.datastax.examples.meetup.StreamingDemo \
    ./target/scala-2.10/streaming-demo.jar \
    -Dspark.cassandra.connection.host=${SINGLE_SEED}

cd web

#./sbt container:start shell
