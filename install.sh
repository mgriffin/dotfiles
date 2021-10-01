#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

ln -s $(pwd)/bashrc $HOME/.bashrc
ln -s $(pwd)/vimrc $HOME/.vimrc
ln -s $(pwd)/vim $HOME/.vim

apt-get install fzf

vim -Es -u $HOME/.vimrc -c "PlugInstall | qa"
