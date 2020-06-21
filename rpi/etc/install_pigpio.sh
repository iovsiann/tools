#!/bin/bash -e

sudo apt-get install pigpio python-pigpio
sudo systemctl enable pigpiod
sudo systemctl start pigpiod
# sudo pigpiod
# sudo systemctl disable pigpiod
# sudo systemctl stop pigpiod
