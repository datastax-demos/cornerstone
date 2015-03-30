#!/usr/bin/env bash
set -x # echo on

dse shark -f /cornerstone/scripts/datastax/investment-manager/spark/correction.q
