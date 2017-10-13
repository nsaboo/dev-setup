# dev-setup
```
## mkdir dev directory in $HOME (dev environment)
mkdir $HOME/dev
cd $HOME/dev/

## checkout git repo dev-setup
git clone https://github.com/nsaboo/dev-setup.git
```

# link dotfiles
```
## global gitignore file
ln -s $HOME/dev/dev-setup/dotfiles/.gitignore $HOME/.gitignore
git config --global core.excludesfile $HOME/.gitignore

## link .tmux.conf in your $HOME dir
ln -s $HOME/dev/dev-setup/dotfiles/.tmux.conf $HOME/.tmux.conf

## link .vimrc in your $HOME dir
ln -s $HOME/dev/dev-setup/dotfiles/.vimrc $HOME/.vimrc
```
