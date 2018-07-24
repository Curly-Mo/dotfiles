# tmux
if [[ -z "$TMUX" ]] ;then
    ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
    if [[ -z "$ID" ]] ;then # if not available create a new one
        tmux new-session
    else
        tmux attach-session -t "$ID" # if available attach to it
    fi
fi

# Load zplugin
source ~/.zplugin/bin/zplugin.zsh

# Oh my zsh themes
# zplugin ice wait"0" lucid
# zplugin snippet OMZ::lib/git.zsh
# zplugin ice wait"0" atload"unalias grv" lucid
# zplugin snippet OMZ::plugins/git/git.plugin.zsh
# Custom theme
zplugin light _local/my_theme
# Load Oh My Zsh Libs
export ZSH_CACHE_DIR=~/.cache/zsh
setopt promptsubst
zplugin ice wait"0" lucid
zplugin snippet OMZ::"lib/history.zsh"
zplugin ice wait"0" lucid
zplugin snippet OMZ::"lib/directories.zsh"
zplugin ice wait"0" lucid
zplugin snippet OMZ::"lib/prompt_info_functions.zsh"
zplugin ice wait"0" lucid
zplugin snippet OMZ::"lib/completion.zsh"
zplugin ice wait"0" lucid
# zplugin snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
# Load Oh My Zsh Plugins
#zplug "plugins/git", from:oh-my-zsh, nice:10
zplugin ice wait"0" lucid
zplugin snippet OMZ::"plugins/vi-mode/vi-mode.plugin.zsh"
zplugin snippet OMZ::"plugins/last-working-dir/last-working-dir.plugin.zsh"
zplugin ice wait"0" lucid
zplugin snippet OMZ::"plugins/pyenv/pyenv.plugin.zsh"
zplugin ice pick"zshrc.sh"
zplugin light olivierverdier/zsh-git-prompt

# Plugins
zplugin ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh"
zplugin light trapd00r/LS_COLORS

zplugin ice wait"0" lucid blockf
zplugin light zsh-users/zsh-completions

zplugin ice wait"0" lucid atload"_zsh_autosuggest_start"
zplugin light zsh-users/zsh-autosuggestions

zplugin ice wait"0" lucid atinit"zpcompinit; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting
# End zplugin config

# Alias definitions
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# vim-mode
bindkey -v
export KEYTIMEOUT=1
bindkey '^R' history-incremental-search-backward
#bindkey '^[[A' up-line-or-search
#bindkey '^[[B' down-line-or-search

# Fn navigation keys
bindkey "^[[7~" beginning-of-line
bindkey "^[[8~" end-of-line

# Welcome message
if [[ -o login ]]; then
  fortune showerthoughts | lolcat
fi

# setup special keys
bindkey  "\e[1~"  beginning-of-line
bindkey  "\e[4~"  end-of-line
bindkey  "\e[7~"  beginning-of-line
bindkey  "\e[8~"  end-of-line
bindkey  "\eOH"   beginning-of-line
bindkey  "\eOF"   end-of-line
bindkey  "\e[H"   beginning-of-line
bindkey  "\e[F"   end-of-line
bindkey  "\e[3~"  delete-char
bindkey  "\e[2~"  overwrite-mode


if [ -f ~/.localrc ]; then
    . ~/.localrc
fi

if [ -f ~/.zsh_functions ]; then
    . ~/.zsh_functions
fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
