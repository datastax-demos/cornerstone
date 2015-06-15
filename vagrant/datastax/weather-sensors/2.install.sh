#!/usr/bin/env bash
set -x # echo on

sudo apt-get install -y python2.7-dev python-pip

(
    cd /usr/share/dse/demos/weather_sensors/
    sudo pip install --find-links web/sdists/ hive_utils six flask
    sudo pip install --find-links web/sdists/ --upgrade cassandra-driver
)

sudo sed -i -e "s|8983|5000|g" /usr/share/dse/demos/weather_sensors/web/weather.py
sudo sed -i -e "s|self.cluster = Cluster()|self.cluster = Cluster(['172.31.17.252'])|g" /usr/share/dse/demos/weather_sensors/web/weather.py
sudo sed -i -e "s|127.0.0.1|172.31.17.252|g" /usr/share/dse/demos/weather_sensors/web/weather.py
#self.cluster = Cluster(['172.31.20.80'])
#127.0.0.1
