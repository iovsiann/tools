sudo cp ./pigpiod.service /etc/systemd/system/

sudo systemctl start pigpiod
sudo systemctl enable pigpiod
# sudo systemctl status pigpiod
# sudo systemctl stop pigpiod
