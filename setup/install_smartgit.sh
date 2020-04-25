#!/bin/bash -e

RELEASE=20_1_1

echo "Installing SmartGit (release $RELEASE)..."

pushd /tmp
wget https://www.syntevo.com/downloads/smartgit/smartgit-$RELEASE.deb
sudo dpkg -i smartgit-$RELEASE.deb
rm smartgit-$RELEASE.deb
popd
