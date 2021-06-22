#!/bin/sh

rm ~/examples.desktop
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get remove unattended-upgrades firefox update-notifier -y
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
sudo apt install python-pip python3-pip -y
rmdir Video Templates Music Documents Pictures Public

# Disable automatic upgrades GUI
cat > 20auto-upgrades <<EOF
APT::Periodic::Update-Package-Lists "0";
APT::Periodic::Download-Upgradeable-Packages "0";
APT::Periodic::AutocleanInterval "0";
APT::Periodic::Unattended-Upgrade "1";
EOF
chmod g=r 20auto-upgrades
sudo chown root:root 20auto-upgrades
sudo mv 20auto-upgrades /etc/apt/apt.conf.d/
rm .sudo_as_admin_successful

# ubuntu-drivers devices
# sudo ubuntu-drivers autoinstall
# https://linuxconfig.org/how-to-install-the-nvidia-drivers-on-ubuntu-18-04-bionic-beaver-linux
# https://linuxconfig.org/how-to-install-the-nvidia-drivers-on-ubuntu-21-04
sudo apt install nvidia-driver-390
