#!/bin/ash
# Author: Arthur Cadore M. Barcella
# Github: arthurcadore

# =====================================================
# DHCP configuration 
# =====================================================

# Add DHCP configuration to interfaces 
echo "auto eth0" >> /etc/network/interfaces
echo "iface eth0 inet dhcp" >> /etc/network/interfaces

# Restart the eth0 interface 
ifdown eth0
ifup eth0

# Verify the IP address received. 
ip addr show eth0

# =====================================================
# Updating the repositories configuration
# =====================================================

# Cleaning the repositories file. 
echo "" >> /etc/apk/repositories

# Adding repositories address. 
echo "https://dl-cdn.alpinelinux.org/alpine/v3.15/main" >> /etc/apk/repositories
echo "https://dl-cdn.alpinelinux.org/alpine/v3.15/community"  >> /etc/apk/repositories

apk update 

# =====================================================
# Installing SSH server: 
# =====================================================

# adding and starting the openssh server package: 
apk add --no-cache \
    openssh \
    ca-certificates \
    curl \
    device-mapper \
    iptables \
    openssl \
    shadow \
    sudo \
    gnupg \
    openrc \
    git

# adding service to the system initialization: 
rc-update add sshd

# starting the service: 
service sshd start
rc-service sshd status

# adding a new user called "dev"
adduser dev
passwd dev

# =====================================================
# Adding the user to 'sudoers' file foor root access: 
# =====================================================

sudo echo "dev    ALL=(ALL:ALL) ALL" >> /etc/sudoers