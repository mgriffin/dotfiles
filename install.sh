#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

rm $HOME/.bashrc

ln -s $(pwd)/git-prompt $HOME/.git-prompt
ln -s $(pwd)/bashrc $HOME/.bashrc
ln -s $(pwd)/vimrc $HOME/.vimrc
ln -s $(pwd)/vim $HOME/.vim
ln -s $(pwd)/gitconfig-user $HOME/.gitconfig-user
cat $(pwd)/gitconfig >> $HOME/.gitconfig

echo '[[ -v GH_GH_PAT ]] && export GITHUB_TOKEN=$GH_GH_PAT' >> ~/.bashrc

sudo apt-get install fzf

vim -Es -u $HOME/.vimrc -c "PlugInstall | qa"
