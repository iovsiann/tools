#!/bin/sh

rm ~/examples.desktop
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get remove unattended-upgrades firefox -y
sudo apt-get install git curl chromium-browser openssh-server terminator net-tools -y
git config --global credential.helper 'cache --timeout=7200'
sudo ntpdate ntp.ubuntu.com
sudo iw reg set US
sed -i 's/HISTSIZE=[0-9]\+/HISTSIZE=/' .bashrc
sed -i 's/HISTFILESIZE=[0-9]\+/HISTFILESIZE=/' .bashrc
wget https://www.realvnc.com/download/file/vnc.files/VNC-Server-6.6.0-Linux-x64.deb
sudo apt install ./VNC-Server-6.6.0-Linux-x64.deb
rm ./VNC-Server-6.6.0-Linux-x64.deb
sudo systemctl start vncserver-x11-serviced
sudo systemctl enable vncserver-x11-serviced
gsettings set org.gnome.desktop.background picture-options 'none'
gsettings set org.gnome.desktop.background primary-color '#000000'
