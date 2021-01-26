#!/bin/sh



# .zshrc
ln .zshrc ~/ 2>/dev/null

# .vimrc
ln .vimrc/.vimrc ~/ 2>/dev/null

# i3config
mkdir -p ~/.config/i3
ln i3-config/i3/config ~/.config/i3/config

# i3status
mkdir -p ~/.config/i3
ln i3-config/i3status/config ~/.config/i3status/config

