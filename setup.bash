#!/bin/bash
#A simple bash script to clone ardupilot source code, flight engines
#and run necessary install instructions to be able to use
#the sitl simulation
#this script only needs to be run once
#setup path to sim_vehicle.py
cd ~
export PATH=$PATH:$HOME/ardupilot/Tools/autotest
#install required python packages
python -m ensurepip --user
python -m pip install --user future
python -m pip install --user lxml
python -m pip install --user uavcan
#download and setup ardupilot
cd ~
git clone git://github.com/ArduPilot/ardupilot.git
cd ardupilot
git submodule update --init --recursive
#download and setup JSBSim
cd ~
git clone git://github.com/tridge/jsbsim.git
cd jsbsim
./autogen.sh
make
cp src/JSBSim.exe /usr/local/bin