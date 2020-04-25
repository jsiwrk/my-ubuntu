#!/bin/bash -e

echo "Installing sysctl config..."

sudo cp ../config/sysctl/* /etc/sysctl.d
