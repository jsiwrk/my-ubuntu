#!/bin/bash -e

echo "Installing Samba..."

sudo apt-get install -y samba
sudo ufw allow 'Samba'
