#!/usr/bin/env bash
set -x # echo on

sudo mkdir -p /cache/tar
sudo chown -R $(whoami):$(whoami) /cache
