#!/bin/bash -e

echo "Configuring Visual Studio Code..."

VS_CONFIG_DIR=~/.config/Code/User

cp ../config/vscode/keybindings.json $VS_CONFIG_DIR/
cp ../config/vscode/settings.json $VS_CONFIG_DIR/
