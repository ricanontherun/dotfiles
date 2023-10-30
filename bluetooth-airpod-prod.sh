#! /usr/bin/sh

sudo vim /etc/bluetooth/main.conf
# Add
# Controller=bredr

# Restart bluetooth service
sudo /etc/init.d/bluetooth restart
sudo /etc/init.d/bluetooth status
