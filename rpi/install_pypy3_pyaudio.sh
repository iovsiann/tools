#!/bin/bash

sudo apt install pypy3-dev python3-pyaudio libportaudio19-dev -y
cd &&  wget https://bootstrap.pypa.io/get-pip.py
pypy3 get-pip.py
python3 get-pip.py && rm get-pip.py

git clone https://github.com/iovsiann/pyaudio
cd pyaudio && pypy3 -m pip install .
cd && rm -rf pyaudio
