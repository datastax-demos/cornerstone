#!/bin/sh


sudo mkdir -p /cornerstone
sudo chown -R $(whoami):$(whoami) /cornerstone

git clone https://github.com/datastax-demos/cornerstone.git /cornerstone
