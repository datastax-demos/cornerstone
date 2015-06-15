#!/usr/bin/env bash
set -x # echo on

(
    cd /usr/share/dse/demos/weather_sensors/
    (
        (
            nohup python web/weather.py
        ) &
    ) &
)

# wait for backgrounded nohups
sleep 2
