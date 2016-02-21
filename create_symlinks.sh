#!/bin/bash
# Create symlinks in $HOME to all .files and .dirs in dotfiles directory

dotfiles=$(find ~/dotfiles -maxdepth 1 -type f -name '.*' -printf "%f\n")
dotdirs=$(find ~/dotfiles -maxdepth 1 -type d -name '.*' ! -name '.git' -printf "%f\n")
printf "Create symlinks for: \n$dotfiles \n and \n$dotdirs \nIn: $HOME \n"
read -p "Confirm? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Creating symlinks"
    find ~/dotfiles -maxdepth 1 -type f -name '.*' -exec ln -s -i {} --target-directory=$HOME \;
    find ~/dotfiles -maxdepth 1 -type d -name '.*' ! -name '.git' -exec ln -s -i {} --target-directory=$HOME \;
fi

printf 'done!\n'
