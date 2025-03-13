#!/bin/bash
# Author: Arthur Cadore M. Barcella

echo "updating system packages..."

sudo echo "HostKeyAlgorithms +ssh-rsa" >> /etc/ssh/ssh_config
sudo echo "PubkeyAcceptedAlgorithms +ssh-rsa" >> /etc/ssh/ssh_config

# reload ssh service
sudo systemctl restart ssh

