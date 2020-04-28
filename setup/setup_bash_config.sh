#!/bin/bash -e

echo "Installing Bash config..."

if [ ! -d ~/.bashrc.d ]; then
    mkdir ~/.bashrc.d
fi

if ! grep -q .bashrc.d ~/.bashrc; then
    echo >> ~/.bashrc
    echo 'source <(cat ~/.bashrc.d/*)' >> ~/.bashrc
    echo >> ~/.bashrc
fi

cp ../config/bashrc.d/* ~/.bashrc.d/
