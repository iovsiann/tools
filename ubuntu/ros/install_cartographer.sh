
#!/bin/sh
# Install Google Cartographer on Ubuntu 18.04

sudo apt-get update
sudo apt-get install -y python-wstool python-rosdep ninja-build stow

if [ ! -d "~/catkin_ws" ] 
then
    mkdir -p ~/catkin_ws/src
    cd ~/catkin_ws
    catkin_make
    sudo rosdep init
fi

cd ~/catkin_ws
wstool init src
wstool merge -t src https://raw.githubusercontent.com/cartographer-project/cartographer_ros/master/cartographer_ros.rosinstall
wstool update -t src
rosdep update
rosdep install --from-paths src --ignore-src --rosdistro=${ROS_DISTRO} -y
source ~/catkin_ws/src/cartographer/scripts/install_abseil.sh
# sudo apt-get remove ros-${ROS_DISTRO}-abseil-cpp
catkin_make_isolated --install --use-ninja
echo 'source ~/catkin_ws/install_isolated/setup.bash' >> ~/.bashrc
