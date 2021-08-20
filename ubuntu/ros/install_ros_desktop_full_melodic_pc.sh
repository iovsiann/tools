#!/bin/sh
# Install ROS Melodic desktop_full (with GUI) on Ubuntu 18.04
# http://wiki.ros.org/melodic/Installation/Ubuntu

# sudo apt-key del 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt install curl -y
# sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

sudo apt update
sudo apt install ros-melodic-desktop-full -y

sudo rosdep init
rosdep update

echo 'source /opt/ros/melodic/setup.bash' >> ~/.bashrc
source /opt/ros/melodic/setup.bash
sudo apt install python-rosinstall python-rosinstall-generator python-wstool build-essential -y
sudo apt install ros-melodic-joint-state-publisher-gui -y
sudo apt install ros-melodic-navigation ros-melodic-gmapping -y
sudo apt install ros-melodic-cartographer ros-melodic-cartographer-rviz -y

echo export ROS_MASTER_URI=http://$(hostname -I | awk '{print $1}'):11311 >> ~/.bashrc
echo export ROS_HOSTNAME=$(hostname -I | awk '{print $1}') >> ~/.bashrc
