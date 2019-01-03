#!/bin/bash

echo "Installing zplugin..."
mkdir $HOME/.zplugin
git clone https://github.com/zdharma/zplugin.git $HOME/.zplugin/bin

if hash vim 2>/dev/null; then
    echo "Installing vim-plug..."
    curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    command vim +PlugInstall +qall
fi
if hash nvim 2>/dev/null; then
    echo "Installing vim-plug (for neovim)..."
    curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    nvim +PlugInstall +qall
fi

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
${script_dir}/create_symlinks.sh

echo "Installing tmux plugins..."
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
$HOME/.tmux/plugins/tpm/bin/install_plugins

# Make necessary directories
touch $HOME/.lastdir
mkdir -p $HOME/.vim/tmp/backup
mkdir -p $HOME/.vim/tmp/swap
mkdir -p $HOME/.vim/tmp/undo

echo Make sure zsh is working properly, then \`chsh -s \$\(which zsh\)\`
