#!/usr/bin/env bash
set -x # echo on

# use IP instead
(
    cd /usr/share/dse/demos/weather_sensors/
    bin/create-and-load
)

(
    (
        nohup dse shark --service sharkserver -p 5588
    ) &
) &


(
    (
        nohup dse hive --service hiveserver -p 5587
    ) &
) &

# wait for backgrounded nohups
sleep 2
