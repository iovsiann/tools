#!/bin/bash

cd
rm examples.desktop
rmdir Public
rmdir Templates
rmdir Videos
rmdir Documents
rmdir Music
rmdir Pictures

git clone https://github.com/Pyrestone/jetson-fan-ctl
cd jetson-fan-ctl && sudo ./install.sh
cd ~ && rm -rf jetson-fan-ctl

# Disable JetPack updates
# sudo gedit /etc/apt/sources.list.d/nvidia-l4t-apt-source.list
# sudo apt update

sudo apt update
sudo apt install libncurses5-dev -y
cd ~/Downloads
wget http://www.nano-editor.org/dist/v2.4/nano-2.4.2.tar.gz
tar -xzf nano-2.4.2.tar.gz
cd nano-2.4.2
./configure
make
sudo make install
cd .. && rm nano-2.4.2.tar.gz && rm -rf nano-2.4.2

free -m
sudo systemctl disable nvzramconfig

# Create swap file https://www.jetsonhacks.com/2019/04/14/jetson-nano-use-more-memory/
git clone https://github.com/JetsonHacksNano/installSwapfile
./installSwapfile/installSwapfile.sh
rm -rf installSwapfile
free -m

# Max power mode
sudo nvpmodel -m 0

# Free up some extra RAM
sudo apt remove update-notifier -y
sudo apt autoremove --purge snapd -y
free -m

# Select “LXDE” after boot at GUI login prompt
sudo dpkg-reconfigure lightdm

# VNC for LightDM https://developer.nvidia.com/embedded/learn/tutorials/vnc-setup
cd ~ && mkdir -p ~/.config/autostart
cp /usr/share/applications/vino-server.desktop ~/.config/autostart/.
gsettings set org.gnome.Vino prompt-enabled false
gsettings set org.gnome.Vino require-encryption false
gsettings set org.gnome.Vino authentication-methods "['vnc']"
gsettings set org.gnome.Vino vnc-password $(echo -n 'thepassword'|base64)

# gsettings set org.gnome.desktop.background picture-options 'none'
# gsettings set org.gnome.desktop.background primary-color '#000000'

# Boot to shell prompt
# sudo systemctl set-default multi-user.target

# Boot to GUI
# sudo systemctl set-default graphical.target

# Launch GUI manually
# sudo systemctl start gdm3.service

# Enable/disable LightDM autologin
# sudo nano /etc/lightdm.conf/lightdm.conf.d
# autologin-user=username

# For Isaac SDK
sudo apt install libzmq3-dev -y

# Check Jetson info
# git clone https://github.com/jetsonhacks/jetsonUtilities
# cd jetsonUtilities
# python jetsonInfo.py
