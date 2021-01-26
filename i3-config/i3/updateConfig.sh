#!/bin/bash

# Remove old config
rm $HOME/.config/i3/config

# Link new one 
ln $HOME/code/i3-config/i3/config $HOME/.config/i3/config

