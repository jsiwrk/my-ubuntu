#!/bin/bash -e

echo "Installing Visual Studio Code..."

sudo snap install --classic code

# Add "Docker" extension:
code --install-extension ms-azuretools.vscode-docker

# Add "C/C++" extension:
code --install-extension ms-vscode.cpptools

# Add "Phyton" extension:
code --install-extension ms-python.python

# Add "Bookmarks" extension:
code --install-extension alefragnani.bookmarks

# Add "Markdown All in One" extension:
code --install-extension yzhang.markdown-all-in-one

# Add "GitLens" extension:
code --install-extension eamodio.gitlens

# Add "macros" extension:
code --install-extension ctf0.macros

# Add "Change Language Mode" extension (useful for macros, see https://stackoverflow.com/q/56565851/10202182):
code --install-extension usernamehw.change-language-mode

# Add "Remote Development" extension:
ext install ms-vscode-remote.vscode-remote-extensionpack
