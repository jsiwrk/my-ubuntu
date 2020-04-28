#!/bin/bash

git config --global color.ui true
git config --global core.excludesfile ~/.gitignore_global
git config --global core.pager "less --tabs=4"
git config --global pull.rebase true

# Disable background GC to avoid problems with graphical Git clients (e.g. SmartGit)
git config --global gc.autoDetach false
