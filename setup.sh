read -p "Please enter location to install zplug: (default: $HOME/packages/zplug)" ZPLUG_HOME
[ -z "${ZPLUG_HOME}" ] && ZPLUG_HOME='$HOME/packages/zplug'
echo "Installing zplug into $ZPLUG_HOME..."
git clone https://github.com/zplug/zplug $ZPLUG_HOME
source $ZPLUG_HOME/init.zsh
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install zplug plugins? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

if hash nvim 2>/dev/null; then
    echo "Installing vim-plug (for neovim)..."
    curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    nvim +PlugInstall +qall
fi
if hash vim 2>/dev/null; then
    echo "Installing vim-plug..."
    curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    command vim +PlugInstall +qall
fi

echo "Installing tmux plugins..."
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
$HOME/.tmux/plugins/tpm/bin/install_plugins

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
${script_dir}/simple_symlinks.sh
