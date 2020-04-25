#!/bin/bash -e

echo "Installing JetBrains Toolbox..."

# Source: https://github.com/nagygergo/jetbrains-toolbox-install/blob/master/jetbrains-toolbox.sh
download_url=$(curl 'https://data.services.jetbrains.com/products/releases?code=TBA&latest=true&type=release' | grep -Po '"linux":.*?[^\\]",' | awk -F ':' '{print $3,":"$4}'| sed 's/[", ]//g')
download_file=$(basename $download_url)

INSTALL_DIR=/opt/jetbrains-toolbox
sudo rm -rf $INSTALL_DIR
sudo mkdir $INSTALL_DIR
sudo chmod 755 $INSTALL_DIR

pushd /tmp
wget $download_url
sudo tar -xzf $download_file -C $INSTALL_DIR --strip-components=1
rm $download_file
popd
