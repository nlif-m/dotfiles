#!/bin/sh



# .zshrc
rm ~/.zshrc 
ln .zshrc ~/ 2>/dev/null

# .vimrc
rm ~/.vimrc
ln .vimrc ~/ 2>/dev/null

# i3config
mkdir -p ~/.config/i3 2>/dev/null
rm ~/.config/i3/config
ln ~/code/dotfiles/i3-config/i3/config ~/.config/i3/config

# i3status
mkdir -p ~/.config/i3status 2>/dev/null 
rm ~/.config/i3status/config
ln ~/code/dotfiles/i3-config/i3status/config ~/.config/i3status/config

