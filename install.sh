#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

rm $HOME/.bashrc

ln -s $(pwd)/bashrc $HOME/.bashrc
ln -s $(pwd)/vimrc $HOME/.vimrc
ln -s $(pwd)/vim $HOME/.vim

echo '[[ -v GH_GH_PAT ]] && export GITHUB_TOKEN=$GH_GH_PAT' >> ~/.bashrc

apt-get install fzf

vim -Es -u $HOME/.vimrc -c "PlugInstall | qa"
