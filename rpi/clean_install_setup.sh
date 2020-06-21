#!/bin/bash
# Setup after a fresh install

git config --global credential.helper 'cache --timeout=7200'
sed -i 's/HISTSIZE=[0-9]\+/HISTSIZE=/' .bashrc
sed -i 's/HISTFILESIZE=[0-9]\+/HISTFILESIZE=/' .bashrc
# wget https://www.realvnc.com/download/file/vnc.files/VNC-Server-6.6.0-Linux-x64.deb
# sudo apt install ./VNC-Server-6.6.0-Linux-x64.deb
# rm ./VNC-Server-6.6.0-Linux-x64.deb
# sudo systemctl start vncserver-x11-serviced
# sudo systemctl enable vncserver-x11-serviced
sudo apt install virtualenv
