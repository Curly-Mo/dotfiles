#!/bin/bash

read -p "Please enter location to install fonts: (default: ${HOME}/packages/fonts)" fonts_dir
[ -z "${fonts_dir}" ] && fonts_dir="${HOME}/packages/fonts"
echo "Downloading fonts into {$fonts_dir}..."

git clone https://github.com/powerline/fonts.git ${fonts_dir}
echo "Installing fonts from {$fonts_dir}..."
cd ${fonts_dir}
./install.sh
