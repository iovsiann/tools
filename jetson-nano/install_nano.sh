sudo apt update
sudo apt install libncurses5 libncurses5-dev -y
cd ~/Downloads
wget http://www.nano-editor.org/dist/v2.4/nano-2.4.2.tar.gz
tar -xzf nano-2.4.2.tar.gz
cd nano-2.4.2
./configure
make
sudo make install
cd .. && rm nano-2.4.2.tar.gz && rm -rf nano-2.4.2
