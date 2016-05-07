# Load zplug
export ZPLUG_HOME=~/packages/zplug
source $ZPLUG_HOME/init.zsh

#  Theme
#zplug "themes/tonotdo", from:oh-my-zsh
zplug "~/.zsh_theme", from:local

# Load Oh My Zsh Libs
zplug "lib/history", from:oh-my-zsh
zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug "lib/prompt_info_functions", from:oh-my-zsh
# Load Oh My Zsh Plugins
zplug "plugins/git", from:oh-my-zsh, nice:10
zplug "plugins/vi-mode", from:oh-my-zsh
zplug "plugins/archlinux", from:oh-my-zsh
export ZSH_CACHE_DIR=~/.cache/zsh
zplug "plugins/last-working-dir", from:oh-my-zsh
zplug "plugins/cp", from:oh-my-zsh
# Python Plugins
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/python", from:oh-my-zsh
zplug "plugins/virtualenv", from:oh-my-zsh
zplug "plugins/pyenv", from:oh-my-zsh
# Other Plugins
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "rupa/z", use:z.sh

# Update self
zplug "zplug/zplug"

# Source plugins and add commands to $PATH
zplug load --verbose


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
source ~/.virtualenv/venv3/bin/activate

# Fn navigation keys
bindkey "^[[7~" beginning-of-line
bindkey "^[[8~" end-of-line
