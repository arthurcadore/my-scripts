#!/bin/bash
# Author: Arthur Cadore M. Barcella
# Github: arthurcadore

# Function to install Docker on Debian 12
install_docker_debian() {
    echo "Installing Docker for Debian 12..."
    sudo apt-get remove -y docker docker-engine docker.io containerd runc
    sudo apt-get update
    sudo apt-get install -y apt-transport-https ca-certificates curl gnupg
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo tee /etc/apt/keyrings/docker.asc > /dev/null
    sudo chmod a+r /etc/apt/keyrings/docker.asc
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian bookworm stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    sudo usermod -aG docker $USER
    install_docker_compose
}

# Function to install Docker on Ubuntu 24.04
install_docker_ubuntu() {
    echo "Installing Docker for Ubuntu 24.04..."
    sudo apt-get remove -y docker docker-engine docker.io containerd runc
    sudo apt-get update
    sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io
    sudo usermod -aG docker $USER
    install_docker_compose
}

# Function to install Docker Compose
install_docker_compose() {
    echo "Installing Docker Compose..."
    mkdir -p ~/.docker/cli-plugins
    curl -SL https://github.com/docker/compose/releases/download/v2.0.1/docker-compose-linuxx86_64 -o ~/.docker/cli-plugins/docker_compose
    chmod +x ~/.docker/cli-plugins/docker_compose
    docker compose version
}

# Detect OS and call the appropriate function
if grep -q "Debian GNU/Linux 12" /etc/os-release; then
    install_docker_debian
elif grep -q "Ubuntu 24.04" /etc/os-release; then
    install_docker_ubuntu
else
    echo "Unsupported OS. This script supports:
    - Debian 12
    - Ubuntu 24.04"
    exit 1
fi
