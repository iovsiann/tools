#!/bin/bash

curl -sSL https://get.docker.com | sh
sudo usermod -a -G docker $USER
sudo apt install -y libffi-dev libssl-dev python3 python3-pip -y
# sudo apt remove python-configparser -y
sudo pip3 install docker-compose
