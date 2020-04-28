#!/bin/bash -e

echo "Installing JD-GUI..."

# Source: https://gist.github.com/steinwaywhw/a4cd19cda655b8249d908261a62687f8#gistcomment-2731054
download_url=$(curl -sL https://api.github.com/repos/java-decompiler/jd-gui/releases/latest | jq -r '.assets[] | select(.name | contains(".deb")) | .browser_download_url')
download_file=$(basename $download_url)

pushd /tmp
wget $download_url
sudo dpkg -i $download_file
rm $download_file
popd
