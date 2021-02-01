#!/bin/sh



# .zshrc
rm ~/.zshrc.old 
mv ~/.zshrc ~/.zshrc.old
ln .zshrc ~/ 2>/dev/null

# .vimrc
ln .vimrc/.vimrc ~/ 2>/dev/null

# i3config
mkdir -p ~/.config/i3
rm ~/.config/i3/config.old
mv ~/.config/i3/config ~/.config/i3/config.old
ln i3-config/i3/config ~/.config/i3/config

# i3status
mkdir -p ~/.config/i3
rm ~/.config/i3status/config.old 
mv ~/.config/i3status/config ~/.config/i3status/config.old
ln i3-config/i3status/config ~/.config/i3status/config

