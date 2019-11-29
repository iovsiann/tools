#!/bin/sh

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get remove unattended-upgrades firefox -y
sudo apt-get install git curl chromium-browser openssh-server terminator -y
sudo ntpdate ntp.ubuntu.com
sudo iw reg set US
sed -i 's/HISTSIZE=[0-9]\+/HISTSIZE=/' .bashrc
sed -i 's/HISTFILESIZE=[0-9]\+/HISTFILESIZE=/' .bashrc
git config credential.helper store
git config --global credential.helper "cache --timeout 7200"
