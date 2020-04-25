#!/bin/bash -e

echo "Configuring Git client..."

cp ../config/git/gitignore_global ~/.gitignore_global
../config/git/set_git_options.sh
