#!/usr/bin/env bash
set -x # echo on

# $MAXHEAP
# $NEWSIZE

while [[ $# > 1 ]]
do
key="$1"
case $key in
    -m|--max-heap)
    MAXHEAP="$2"
    shift
    ;;
    -n|--new-size)
    NEWSIZE="$2"
    shift
    ;;
    *)
    # unknown option
    ;;
esac
shift
done

if [ -n "$MAXHEAP" ]; then
    sudo sed -i -e "s|^#MAX_HEAP_SIZE=.*|MAX_HEAP_SIZE=\"${MAXHEAP}\"|g" /etc/dse/cassandra/cassandra-env.sh
fi

if [ -n "$NEWSIZE" ]; then
    sudo sed -i -e "s|^#HEAP_NEWSIZE=.*|HEAP_NEWSIZE=\"${NEWSIZE}\"|g" /etc/dse/cassandra/cassandra-env.sh
fi
