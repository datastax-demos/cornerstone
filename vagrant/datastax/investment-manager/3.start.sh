#!/usr/bin/env bash
set -x # echo on

cqlsh -f /cornerstone/cql/datastax/investment-manager/stocks.cql

$CATALINA_HOME/bin/startup.sh
