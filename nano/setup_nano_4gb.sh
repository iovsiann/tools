#!/bin/bash

git clone https://github.com/Pyrestone/jetson-fan-ctl
cd jetson-fan-ctl && sudo ./install.sh
cd ~ && rm -rf jetson-fan-ctl

sudo apt update
sudo apt install libncurses5-dev
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

# Disable boot-to-GUI
sudo systemctl set-default multi-user

# Max power mode
sudo nvpmodel -m 0

# Free up some extra RAM
sudo apt autoremove --purge snapd
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
