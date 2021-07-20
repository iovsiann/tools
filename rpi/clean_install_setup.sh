#!/bin/bash
# Setup after a fresh install

git config --global user.name "Ilia O."
git config --global credential.helper 'cache --timeout=7200'
sed -i 's/HISTSIZE=[0-9]\+/HISTSIZE=/' .bashrc
sed -i 's/HISTFILESIZE=[0-9]\+/HISTFILESIZE=/' .bashrc
# wget https://www.realvnc.com/download/file/vnc.files/VNC-Server-6.6.0-Linux-x64.deb
# sudo apt install ./VNC-Server-6.6.0-Linux-x64.deb
# rm ./VNC-Server-6.6.0-Linux-x64.deb
# sudo systemctl start vncserver-x11-serviced
# sudo systemctl enable vncserver-x11-serviced
sudo -H pip3 install --upgrade pip
sudo apt install virtualenv mpg321 libatlas-base-dev python-pyaudio portaudio19-dev libffi-dev python3-pyaudio -y
sudo apt install libatlas3-base libatlas-base-dev libblas3 libblas-dev libopenblas-base libopenblas-dev -y
sudo apt install libfftw3-3 libfftw3-dev libfftw3-mpi3 libfftw3-mpi-dev python3-numpy python-numpy -y
sudo apt install liblapack-dev liblapacke-dev liblapack3 liblapack-pic liblapacke -y
# sudo apt install avahi-daemon
sudo systemctl disable avahi-daemon  # Bonjour local discovery http://raspberrypi.local
sudo systemctl disable triggerhappy  # GUI shortcuts
systemctl disable bluetooth
