#!/bin/bash

PWD=~/dev/dev-setup/listfiles/

# atom list
apm list -i -b > $PWD/apm_list

# brew list
brew list > $PWD/brew_list

# brew cask list
brew cask list > $PWD/brew_cask_list
