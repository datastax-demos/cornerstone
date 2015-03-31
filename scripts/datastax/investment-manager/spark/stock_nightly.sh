#!/usr/bin/env bash
set -x # echo on

dse shark -f /cornerstone/scripts/datastax/investment-manager/spark/holdings_daily.q
