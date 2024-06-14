apk update
apk add --no-cache \
    ca-certificates \
    curl \
    device-mapper \
    iptables \
    openssl \
    shadow \
    sudo \
    gnupg \
    openrc

# Installing Docker
apk add --no-cache docker

# Starting Docker service
rc-update add docker boot
service docker start

# Adding docker permissions to the current user
usermod -aG docker $USER

# Installing Docker Compose
DOCKER_COMPOSE_VERSION=2.0.1
mkdir -p ~/.docker/cli-plugins
curl -SL "https://github.com/docker/compose/releases/download/v${DOCKER_COMPOSE_VERSION}/docker-compose-linux-x86_64" -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose
sudo ln -s ~/.docker/cli-plugins/docker-compose /usr/local/bin/docker-compose

# Verifying Docker and Docker Compose versions
docker --version
docker-compose --version