#!/bin/sh
# Install librealsense on Ubuntu 18.04.3
# https://github.com/IntelRealSense/librealsense/blob/master/doc/installation.md

git clone https://github.com/IntelRealSense/librealsense.git

sudo apt-get install git libssl-dev libusb-1.0-0-dev pkg-config libgtk-3-dev -y
sudo apt-get install libglfw3-dev libgl1-mesa-dev libglu1-mesa-dev -y
cd librealsense
./scripts/setup_udev_rules.sh
./scripts/patch-realsense-ubuntu-lts.sh
mkdir build && cd build
cmake ../ -DCMAKE_BUILD_TYPE=Release
sudo make uninstall && make clean && make && sudo make install
