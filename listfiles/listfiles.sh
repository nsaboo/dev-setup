#!/bin/bash
#############################
# OSX dev-setup configuration
#############################

PWD=~/dev/dev-setup/listfiles/

# vscode list
code --list-extensions > $PWD/code_list

# atom list
apm list -i -b > $PWD/apm_list

# brew list
brew list > $PWD/brew_list

# brew cask list
brew cask list > $PWD/brew_cask_list

# pip2 list
pip2 list > $PWD/pip2_list

# npm list
npm list -g --depth=0 > $PWD/npm_list
