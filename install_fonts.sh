#!/bin/bash
# Create symlinks in $HOME using GNU stow

git clone https://github.com/powerline/fonts.git ~/packages/fonts
cd ~/packages/fonts
./install.sh
