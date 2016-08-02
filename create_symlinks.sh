#!/bin/bash
# Create symlinks in $HOME using GNU stow

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
dotdirs=$(find ${script_dir} -maxdepth 1 -type d ! -path '*/\.*' ! -path "$script_dir" -printf "%f\n")
#echo $script_dir
echo $dotdirs
for d in $dotdirs ; do
    printf "Create symlinks in $HOME for: $d\n"
    read -p "Confirm? " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        stow $d --verbose=2 -d $script_dir --target $HOME
    fi
    echo
done
