#!/bin/bash

sudo mkdir -p /mnt/lib
sudo mkdir -p /mnt/log

sudo chown -R $(whoami):$(whoami) /mnt/lib
sudo chown -R $(whoami):$(whoami) /mnt/log
