#!/bin/sh
# Install ROS Melodic desktop_full (with GUI) on Ubuntu 18.04
# http://wiki.ros.org/melodic/Installation/Ubuntu

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

sudo apt update
sudo apt install ros-melodic-desktop-full ros-melodic-navigation ros-melodic-gmapping -y

sudo rosdep init
rosdep update

echo 'source /opt/ros/melodic/setup.bash' >> ~/.bashrc
source /opt/ros/melodic/setup.bash
sudo apt install python-rosinstall python-rosinstall-generator python-wstool build-essential -y
sudo apt install ros-melodic-joint-state-publisher-gui -y

echo export ROS_MASTER_URI=http://$(hostname -I | awk '{print $1}'):11311 >> ~/.bashrc
echo export ROS_HOSTNAME=$(hostname -I | awk '{print $1}') >> ~/.bashrc
