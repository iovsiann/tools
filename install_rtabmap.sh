#!/bin/sh
# Install standalone rtabmap from source on Ubuntu 18.04.3
# (to enable RealSense support in rtabmap)
# https://github.com/introlab/rtabmap/wiki/Installation

sudo apt install ros-melodic-rtabmap ros-melodic-rtabmap-ros
sudo apt remove ros-melodic-rtabmap ros-melodic-rtabmap-ros

# Install gtsam
cd ~
git clone --branch 4.0.0-alpha2 https://github.com/borglab/gtsam.git gtsam-4.0.0-alpha2 gtsam
cd ~/gtsam && mkdir build && cd build
cmake -DGTSAM_USE_SYSTEM_EIGEN=ON -DGTSAM_BUILD_EXAMPLES_ALWAYS=OFF -DCMAKE_BUILD_TYPE=Release -DGTSAM_BUILD_TESTS=OFF -DGTSAM_BUILD_UNSTABLE=OFF GTSAM_USE_SYSTEM_EIGEN=ON ..
make -j4
sudo make install

# g2o (faster than one packaged with ROS)
sudo apt install ros-melodic-rtabmap-ros
    sudo apt remove ros-melodic-rtabmap-ros ros-melodic-rtabmap
  // or
    git clone https://github.com/RainerKuemmerle/g2o.git 
    cd g2o
    mkdir build && cd build
    cmake -DBUILD_WITH_MARCH_NATIVE=OFF -DG2O_BUILD_APPS=OFF -DG2O_BUILD_EXAMPLES=OFF -DG2O_USE_OPENGL=OFF -DCMAKE_BUILD_TYPE=Release ..
    make -j4
    sudo make install


# cvsba
cd ~
sudo apt install liblapack-dev libf2c2-dev 
wget https://sourceforge.net/projects/cvsba/files/1.0.0/cvsba-1.0.0.tgz/download
tar -zxvf cvsba-1.0.0.tgz
rm cvsba-1.0.0.tgz
mv cvsba-1.0.0 cvsba
mkdir cvsba/build
cd cvsba/build
cmake -DCMAKE_BUILD_TYPE=Release ..
make
sudo make install
sudo mkdir /usr/local/lib/cmake/cvsba 
sudo mv /usr/local/lib/cmake/Findcvsba.cmake /usr/local/lib/cmake/cvsba/cvsbaConfig.cmake

# rtabmap
cd ~
git clone https://github.com/introlab/rtabmap.git rtabmap
cd rtabmap/build
cmake ..
make -j4
sudo make install

