#!/bin/ash
# Author: Arthur Cadore M. Barcella
# Github: arthurcadore

#NOTE: Execute alpine-startup first!

# Installing Docker
sudo apk add --no-cache docker

# Starting Docker service
sudo rc-update add docker boot
sudo service docker start

# Adding docker permissions to the current user
sudo usermod -aG docker $USER

# Installing Docker Compose
DOCKER_COMPOSE_VERSION=2.0.1
mkdir -p ~/.docker/cli-plugins
curl -SL "https://github.com/docker/compose/releases/download/v${DOCKER_COMPOSE_VERSION}/docker-compose-linux-x86_64" -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose
sudo ln -s ~/.docker/cli-plugins/docker-compose /usr/local/bin/docker-compose

# Verifying Docker and Docker Compose versions
docker --version
docker-compose --version
