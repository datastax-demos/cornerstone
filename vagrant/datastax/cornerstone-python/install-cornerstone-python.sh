#!/usr/bin/env bash
set -x # echo on

bash /cornerstone/vagrant/general/apt/install/jdk7_v2.sh
bash /cornerstone/vagrant/general/apt/install/jdk8_v2.sh
bash /cornerstone/vagrant/general/apt/configure/java/default-jdk7_v2.sh
bash /cornerstone/vagrant/general/apt/install/dev_v3.sh
bash /cornerstone/vagrant/general/apt/install/python_v2.sh
bash /cornerstone/vagrant/general/apt/install/ruby_v2.sh
bash /cornerstone/vagrant/general/file/install/bower_v2.sh
bash /cornerstone/vagrant/datastax/cornerstone-python/2.install.sh
