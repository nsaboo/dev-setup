# JAVA_HOME
export JAVA_HOME=/Library/Java/Home

# nvm configuration
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# bashrc
[[ -s ~/.bashrc ]] && source ~/.bashrc
