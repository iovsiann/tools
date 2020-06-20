#!/usr/bin/bash

mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
git clone https://github.com/ROBOTIS-GIT/hls_lfcd_lds_driver.git
git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
git clone https://github.com/UbiquityRobotics/raspicam_node.git
cd ~/catkin_ws/src/turtlebot3
rm -r turtlebot3_description turtlebot3_teleop turtlebot3_navigation turtlebot3_slam turtlebot3_example
cd ~/catkin_ws && catkin_make
rosrun turtlebot3_bringup create_udev_rules
sudo apt install ntpdate
sudo ntpdate ntp.ubuntu.com
