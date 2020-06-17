#!/usr/bin/bash

cd ~/ros_ws
rosinstall_generator common_msgs common_msgs rosserial image_common image_transport_plugins diagnostics nodelet_core --rosdistro melodic --deps --wet-only --tar > melodic-extra-wet.rosinstall
wstool merge -t src melodic-extra-wet.rosinstall
wstool update -j8 -t src
rosdep install --from-paths src --ignore-src --rosdistro melodic -y
sudo ./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release --install-space /opt/ros/melodic

mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/ && catkin_make
echo "source $HOME/catkin_ws/devel/setup.bash" >> ~/.bashrc

cd ~/catkin_ws/src
git clone https://github.com/ROBOTIS-GIT/hls_lfcd_lds_driver.git
git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
git clone https://github.com/UbiquityRobotics/raspicam_node.git
cd ~/catkin_ws/src/turtlebot3
rm -r turtlebot3_description/ turtlebot3_teleop/ turtlebot3_navigation/ turtlebot3_slam/ turtlebot3_example/
cd ~/catkin_ws && catkin_make
rosrun turtlebot3_bringup create_udev_rules
sudo apt install ntpdate
sudo ntpdate ntp.ubuntu.com
