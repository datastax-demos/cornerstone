#!/usr/bin/env bash
set -x # echo on

cqlsh -f /cornerstone/cql/datastax/investment-manager/schema.cql

$CATALINA_HOME/bin/startup.sh
