#!/bin/sh
# Download and build Prusa MK3S firmware

sudo apt-get install gawk
cd; mkdir prusa; cd ~/prusa
git clone https://github.com/prusa3d/Prusa-Firmware.git
cd Prusa-Firmware
git checkout MK3
git checkout tags/v3.10.0
cd ~/prusa/Prusa-Firmware/Firmware
cp variants/1_75mm_MK3S-EINSy10a-E3Dv6full.h Configuration_prusa.h
cd ~/prusa/Prusa-Firmware; ./build.sh

# Copy “firmware.hex” to 
nautilus --browser ~/prusa/Prusa-Firmware/lang/
