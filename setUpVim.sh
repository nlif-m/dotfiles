#!/bin/sh
folder=$(pwd)
git clone https://github.com/vim/vim.git ~/vim-t

cd ~/vim-t/src

 ./configure --with-features=huge --with-python3-command=python3 --enable-python3interp=yes --with-compiledby=$USER


make -j$(nproc) LDFLAGS="-rdynamic"
sudo make -j$(nproc) install LDFLAGS="-rdynamic"

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

cd $folder
