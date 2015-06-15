#!/usr/bin/env bash
set -x # echo on

sudo sed -i -e "s|HADOOP_ENABLED=.*|HADOOP_ENABLED=1|g" /etc/default/dse
