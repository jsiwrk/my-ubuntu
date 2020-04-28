#!/bin/bash -e

echo "Installing software..."

./setup_utils.sh
./setup_sysctl_config.sh
./setup_git.sh
./setup_git_config.sh
./setup_smartgit.sh
./setup_docker.sh
./setup_docker_compose.sh
./setup_chrome.sh
./setup_samba.sh
./setup_vscode.sh
./setup_vscode_config.sh
./setup_jdk.sh
./setup_jetbrains_toolbox.sh
./setup_diff_tool.sh
./setup_jd_gui.sh
./setup_bash_config.sh
./setup_xsession_config.sh

echo "All software installed successfully"
