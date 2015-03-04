#!/bin/sh

sudo mkdir /cache
sudo chown -R $(whoami):$(whoami) /cache
wget -c https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2_x86_64.deb -P /cache
sudo dpkg -i /cache/vagrant_1.7.2_x86_64.deb
