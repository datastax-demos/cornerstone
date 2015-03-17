#!/bin/bash

DOWNLOADNAME=vagrant_1.7.2_x86_64.deb
wget -c https://dl.bintray.com/mitchellh/vagrant/${DOWNLOADNAME} -P /cache/tar
sudo dpkg -i /cache/${DOWNLOADNAME}
