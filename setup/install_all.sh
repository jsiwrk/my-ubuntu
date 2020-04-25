#!/bin/bash -e

echo "Installing software..."

./install_utils.sh
./install_sysctl_config.sh
./install_git.sh
./install_git_config.sh
./install_smartgit.sh
./install_docker.sh
./install_docker_compose.sh
./install_chrome.sh
./install_samba.sh
./install_vscode.sh
./install_vscode_config.sh
./install_jdk.sh
./install_jetbrains_toolbox.sh
./install_diff_tool.sh
./install_jd_gui.sh
./install_bash_config.sh
./install_xsession_config.sh

echo "All software installed successfully"
