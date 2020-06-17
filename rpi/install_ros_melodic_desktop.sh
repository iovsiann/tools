#!/usr/bin/bash

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt update
sudo apt install -y python-rosdep python-rosinstall-generator python-wstool python-rosinstall build-essential cmake
sudo rosdep init
rosdep update
mkdir ~/ros_ws
cd ~/ros_ws
rosinstall_generator desktop --rosdistro melodic --deps --wet-only --tar > melodic-desktop-wet.rosinstall
wstool init -j4 src melodic-desktop-wet.rosinstall

cd
mkdir -p ~/ros_ws/external_src
cd ~/ros_ws/external_src
wget https://sourceforge.net/projects/assimp/files/assimp-3.1/assimp-3.1.1_no_test_models.zip/download -O assimp-3.1.1_no_test_models.zip
unzip assimp-3.1.1_no_test_models.zip
cd assimp-3.1.1/
cmake .
make
sudo make install
sudo apt install libogre-1.9-dev

cd ~/ros_ws
rosdep install --from-paths src --ignore-src --rosdistro melodic -y

sudo ./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release --install-space /opt/ros/melodic -j2
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
