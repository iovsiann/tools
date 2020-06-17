  
#!/bin/sh

sudo systemctl mask apt-daily.service apt-daily-upgrade.service
sudo apt update
sudo apt upgrade -y
sudo apt install git iw raspi-config wireless-tools -y
# git conf credential.helper store
git config --global credential.helper 'cache --timeout=7200'
sudo ntpdate ntp.ubuntu.com
sed -i 's/HISTSIZE=[0-9]\+/HISTSIZE=/' .bashrc
sed -i 's/HISTFILESIZE=[0-9]\+/HISTFILESIZE=/' .bashrc
sudo timedatectl set-timezone America/Los_Angeles
sudo iw reg set US  # connect WiFi to 5G

# https://linuxconfig.org/ubuntu-20-04-connect-to-wifi-from-command-line
# Change WiFi SSID to 5G; RPi 4B fw crashes on 5G connection

# resize disk here
# sudo resize2fs /dev/mmcblk0p2
