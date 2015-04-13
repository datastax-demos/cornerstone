#!/usr/bin/env bash
set -x # echo on

sudo sed -i -e "s|SOLR_ENABLED=.*|SOLR_ENABLED=1|g" /etc/default/dse
