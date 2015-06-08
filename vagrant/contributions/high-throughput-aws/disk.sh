#!/usr/bin/env bash

sudo apt-get install -y xfsprogs
sudo mkfs.xfs -b size=4096 -d su=262144 -d sw=2 /dev/xvdg
sudo mkdir -p /mnt
sudo mount vagran/dev/xvdg /mnt

sudo cp /etc/fstab /etc/fstab.orig
echo "/dev/xvdg /mnt xfs defaults,nobootwait" | sudo tee -a /etc/fstab
sudo mount -a
echo
