#!/bin/sh
# 802.11 AC RTL8821CU
# https://ubuntuforums.org/showthread.php?t=2407625

sudo apt update
sudo apt install build-essential git dkms
git clone https://github.com/brektrou/rtl8821CU.git
cd rtl8821CU
chmod +x dkms-install.sh
sudo ./dkms-install.sh
sudo modprobe 8821cu
