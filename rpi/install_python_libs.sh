#!/bin/bash

sudo apt install pypy3-dev python3-pyaudio libportaudio19-dev -y
cd &&  wget https://bootstrap.pypa.io/get-pip.py
pypy3 get-pip.py
python3 get-pip.py
python get-pip.py && rm get-pip.py

git clone https://github.com/iovsiann/pyaudio
cd pyaudio && pypy3 -m pip install .
cd && rm -rf pyaudio

pip3 install pvporcupine pyyaml rospkg webrtcvad
pypy3 -m pip install pvporcupine pyyaml rospkg webrtcvad
