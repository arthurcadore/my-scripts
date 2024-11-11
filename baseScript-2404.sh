#!/bin/bash
# Author: Arthur Cadore M. Barcella
# Github: arthurcadore

echo "updating system packages..."
sudo apt-get update && sudo apt-get upgrade -y 

echo "installing basic packages"

sudo apt-get install -y \
             tree \
             openssh-server \
             htop \
             arping \
             net-tools \
             tcpdump \
             git \



echo "enabling free access to tcpdump capturing interfaces..."

sudo setcap cap_net_raw,cap_net_admin+eip /usr/bin/tcpdump

echo "installing wireshark..."

sudo apt-get install -y \
             wireshark