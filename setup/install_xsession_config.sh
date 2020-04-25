#!/bin/bash -e

echo "Installing X session config..."

if [ ! -d ~/.xsessionrc.d ]; then
    mkdir ~/.xsessionrc.d
fi

if [ ! -f ~/.xsessionrc ]; then
    echo 'source <(cat ~/.xsessionrc.d/*)' >> ~/.xsessionrc
    echo >> ~/.xsessionrc
fi
