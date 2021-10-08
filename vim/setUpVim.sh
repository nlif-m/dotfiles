#!/bin/sh
folder=$(pwd)
PREFIX=~/.local/src
VIM_FOLDER=vim


vim_src="$PREFIX/$VIM_FOLDER"
mkdir -p "$PREFIX" || exit 1
[ ! -d "$vim_src" ] && (git clone https://github.com/vim/vim.git "$vim_src" || exit 2)

cd "$PREFIX"/"$VIM_FOLDER"/src || (echo "Error cd $PREFIX/src" && exit 3)

 ./configure --with-features=huge --with-python3-command=python3 --enable-python3interp=yes --with-luajit --enable-luainterp=yes --with-compiledby=$USER


make -j LDFLAGS="-rdynamic"
sudo make -j install LDFLAGS="-rdynamic"

vim_Vundle="$HOME/.vim/bundle/Vundle.vim"
[ ! -d "$vim_Vundle" ] && (git clone https://github.com/VundleVim/Vundle.vim.git "$vim_Vundle" || exit 4)
vim +PluginInstall +qall

cd $folder
