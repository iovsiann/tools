#!/bin/sh
# Install Realtek rtl8188fu WiFi USB adapter on Ubuntu 18.04
# https://github.com/kelebek333/rtl8188fu

sudo apt-get install build-essential git dkms linux-headers-$(uname -r)
git clone https://github.com/kelebek333/rtl8188fu
sudo dkms add ./rtl8188fu
sudo dkms build rtl8188fu/1.0
sudo dkms install rtl8188fu/1.0
sudo cp ./rtl8188fu/firmware/rtl8188fufw.bin /lib/firmware/rtlwifi/
sudo iw reg set US   # set timezone to enable 5GHz
