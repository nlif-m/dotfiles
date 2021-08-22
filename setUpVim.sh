#!/bin/sh
folder=$(pwd)
PREFIX=~/.local/src
VIM_FOLDER=vim
mkdir -p "$PREFIX"

git clone https://github.com/vim/vim.git "$PREFIX"/"$VIM_FOLDER"

cd "$PREFIX"/"$VIM_FOLDER"/src || echo "Error cd $PREFIX/src" ; exit

 ./configure --with-features=huge --with-python3-command=python3 --enable-python3interp=yes --with-compiledby=$USER


make -j$(nproc) LDFLAGS="-rdynamic"
sudo make -j$(nproc) install LDFLAGS="-rdynamic"

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

cd $folder
