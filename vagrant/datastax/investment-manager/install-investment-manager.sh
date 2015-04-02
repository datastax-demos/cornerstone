#!/usr/bin/env bash
set -x # echo on

bash /cornerstone/vagrant/general/apt/install/jdk7_v2.sh
bash /cornerstone/vagrant/general/apt/install/maven2_v1.sh
bash /cornerstone/vagrant/general/file/install/tomcat_v2.sh
bash /cornerstone/vagrant/datastax/investment-manager/2.install.sh
