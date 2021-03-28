#!/usr/bin/bash

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt update
sudo apt install -y python-rosdep python-rosinstall-generator python-wstool python-rosinstall build-essential cmake
sudo rosdep init
rosdep update
mkdir ~/ros_ws
cd ~/ros_ws
#rosinstall_generator roscomm common_msgs common_msgs rosserial image_common image_transport_plugins diagnostics nodelet_core --rosdistro melodic --deps --wet-only --tar > melodic-tb3-wet.rosinstall
rosinstall_generator roscomm common_msgs common_msgs rosserial rosserial_server image_common image_transport_plugins diagnostics nodelet_core --rosdistro melodic --deps --wet-only --tar > melodic-tb3-wet.rosinstall
wstool init -j4 src melodic-tb3-wet.rosinstall

cd ~/ros_ws
rosdep install --from-paths src --ignore-src --rosdistro melodic -y

sudo ./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release --install-space /opt/ros/melodic -j4
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
