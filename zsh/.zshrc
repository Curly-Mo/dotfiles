# tmux
if [[ -z "$TMUX" ]] ;then
    ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
    if [[ -z "$ID" ]] ;then # if not available create a new one
        exec tmux new-session
    else
        exec tmux attach-session -t "$ID" # if available attach to it
    fi
    return
fi

# Load zplug
export ZPLUG_HOME=~/packages/zplug
source $ZPLUG_HOME/init.zsh
export ZSH_CACHE_DIR=~/.cache/zsh

#  Theme
#zplug "themes/tonotdo", from:oh-my-zsh
zplug "~/.zsh_theme", from:local

# Load Oh My Zsh Libs
zplug "lib/history", from:oh-my-zsh
zplug "lib/directories", from:oh-my-zsh
zplug "lib/prompt_info_functions", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
# Load Oh My Zsh Plugins
#zplug "plugins/git", from:oh-my-zsh, nice:10
zplug "plugins/vi-mode", from:oh-my-zsh
#zplug "plugins/archlinux", from:oh-my-zsh
zplug "plugins/last-working-dir", from:oh-my-zsh
zplug "plugins/cp", from:oh-my-zsh
# Python Plugins
#zplug "plugins/pip", from:oh-my-zsh
#zplug "plugins/python", from:oh-my-zsh
#zplug "plugins/virtualenv", from:oh-my-zsh
#zplug "plugins/pyenv", from:oh-my-zsh
# Other Plugins
zplug "zsh-users/zsh-syntax-highlighting", nice:10
#zplug "rupa/z", use:z.sh
zplug "olivierverdier/zsh-git-prompt", use:zshrc.sh, nice:10
zplug "horosgrisa/autoenv"

# Update self
zplug "zplug/zplug"

# Source plugins and add commands to $PATH
zplug load

# Alias definitions
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# vim-mode
bindkey -v
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

#Python Virtual Environment
export PYTHONSTARTUP=/home/colin/.pystartup
# Hack to stop conda from fucking up my ps1
export CONDA_PS1_BACKUP="$PS1"
#source ~/.virtualenv/venv3/bin/activate
# AutoEnv
# source /usr/share/autoenv-git/activate.sh
export LD_LIBRARY_PATH="/usr/lib:$LD_LIBRARY_PATH"

# Fn navigation keys
bindkey "^[[7~" beginning-of-line
bindkey "^[[8~" end-of-line

# Welcome message
fortune showerthoughts

# torch7
. /home/colin/packages/torch/install/bin/torch-activate