#!/usr/bin/env bash

sudo mdadm --create /dev/md0 --chunk=256 --metadata=1.2 --raid-devices=2 --level=0 /dev/xvdg1 /dev/xvdh1
sudo mdadm --examine --scan > /etc/mdadm.conf
sudo mkfs.xfs -b size=4096 -d su=262144 -d sw=2 /dev/md0
