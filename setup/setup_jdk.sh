#!/bin/bash -e

echo "Installing OpenJDK (latest)..."
sudo apt-get install -y default-jdk

# To install an additional JDK:
# sudo apt-get install -y openjdk-8-jdk
# To change the default JDK, use: sudo update-alternatives --config java
