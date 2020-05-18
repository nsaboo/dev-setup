# JAVA_HOME
#export JAVA_HOME=/Library/Java/Home
export JAVA_HOME=$(/usr/libexec/java_home)

# nvm configuration
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# bashrc
[[ -s ~/.bashrc ]] && source ~/.bashrc

# .aliasrc
[[ -s ~/.aliasrc ]] && source ~/.aliasrc

# .minikube-completion
[[ -s ~/.minikube-completion ]] && source ~/.minikube-completion

# kops completion
source $HOME/.kops/completion.bash.inc

# helm completion
source $HOME/.helm/helm.completion.bash.inc
