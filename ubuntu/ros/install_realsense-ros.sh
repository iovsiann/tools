#!/bin/sh
# Install realsense-ros
# Requires ROS Melodic, librealsense already installed
# https://github.com/IntelRealSense/realsense-ros

sudo apt install ros-melodic-ddynamic-reconfigure -y

mkdir -p ~/rs_catkin_ws/src && cd ~/rs_catkin_ws/src/

git clone https://github.com/IntelRealSense/realsense-ros.git
cd realsense-ros/
git checkout `git tag | sort -V | grep -P "^\d+\.\d+\.\d+" | tail -1`
cd ..

catkin_init_workspace
cd ..
catkin_make clean
catkin_make -DCATKIN_ENABLE_TESTING=False -DCMAKE_BUILD_TYPE=Release
catkin_make install
echo "source ~/rs_catkin_ws/devel/setup.bash" >> ~/.bashrc
source ~/rs_catkin_ws/devel/setup.bash

echo "roslaunch realsense2_camera rs_camera.launch"
