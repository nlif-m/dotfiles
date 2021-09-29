#!/bin/sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
pip3 install --user pynvim neovim-remote
nvim +PluginInstall +qall
