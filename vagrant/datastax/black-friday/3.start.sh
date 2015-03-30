#!/usr/bin/env bash
set -x # echo on

ln -s /cornerstone/web/datastax/cornerstone-python/Cornerstone/templates .
ln -s /cornerstone/web/datastax/cornerstone-python/Cornerstone/static .

export PYTHONPATH=/cornerstone/web/datastax/cornerstone-python:$PYTHONPATH

nohup /cornerstone/web/datastax/black-friday/run &
