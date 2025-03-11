#!/bin/bash
# Description: configure dependencies for container runtime
# Author: Arthur Cadore M. Barcella

cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.ipv4.ip_forward = 1
EOF

sudo sysctl --system

sysctl net.ipv4.ip_forward