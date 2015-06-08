#!/usr/bin/env bash

echo -e "$(curl http://169.254.169.254/latest/meta-data/local-ipv4)\t$(hostname)" | sudo tee -a /etc/hosts
