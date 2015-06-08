#!/usr/bin/env bash

sudo sed -i -e "s|num_tokens:.*|num_tokens: 32|g" /etc/dse/cassandra/cassandra.yaml
