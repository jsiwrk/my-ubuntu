#!/bin/bash -e

echo "Installing Git client..."

sudo apt-add-repository -y ppa:git-core/ppa
sudo apt-get update
sudo apt-get install -y git

echo "Installing Git LFS..."

curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-get install -y git-lfs
git lfs install

# Note: the error message "Error: Failed to call git rev-parse --git-dir: exit status 128"
# can be ignored. See https://github.com/git-lfs/git-lfs/issues/3964.
