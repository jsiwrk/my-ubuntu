#!/bin/bash -e

RELEASE=1.24.1

echo "Installing Docker Compose (release $RELEASE)..."

# Source: https://docs.docker.com/compose/install/
sudo curl -L "https://github.com/docker/compose/releases/download/$RELEASE/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
