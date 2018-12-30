# uncomment for profiling
# zmodload zsh/zprof

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

export ZSH_CACHE_DIR=~/.cache/zsh
setopt promptsubst

# Oh my zsh themes
# zplugin ice wait"0" silent
# zplugin snippet OMZ::lib/git.zsh
# zplugin ice wait"0" atload"unalias grv" silent
# zplugin snippet OMZ::plugins/git/git.plugin.zsh

# Custom theme
autoload -U colors
colors
# source $HOME/dotfiles/zsh/.zsh_theme
zplugin snippet 'https://github.com/Curly-Mo/dotfiles/blob/master/zsh/.zsh_theme'
# zplugin ice wait"!0" silent
zplugin snippet 'https://github.com/woefe/git-prompt.zsh/blob/master/git-prompt.zsh'

# Load Oh My Zsh Libs
# zplugin ice wait"0" silent
zplugin snippet OMZ::"lib/history.zsh"
zplugin ice wait"0" silent
zplugin snippet OMZ::"lib/prompt_info_functions.zsh"
zplugin ice wait"0" silent
zplugin snippet OMZ::"lib/completion.zsh"
# zplugin ice wait"0" silent
# zplugin snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

# Load Oh My Zsh Plugins
# zplugin ice wait"0" silent
# zplugin snippet OMZ::"plugins/vi-mode/vi-mode.plugin.zsh"
zplugin ice wait"!0" silent
zplugin snippet OMZ::"plugins/last-working-dir/last-working-dir.plugin.zsh"
zplugin ice wait"0" silent
zplugin snippet OMZ::"plugins/pyenv/pyenv.plugin.zsh"

# Plugins
zplugin ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh"
zplugin light trapd00r/LS_COLORS

zplugin ice wait"0" silent blockf
zplugin light zsh-users/zsh-completions

zplugin ice wait"0" silent atload"_zsh_autosuggest_start"
zplugin light zsh-users/zsh-autosuggestions

zplugin ice wait"0" silent atinit"zpcompinit; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting

# custom completions
zplugin ice wait"0" silent
zplugin snippet 'https://github.com/Curly-Mo/dotfiles/blob/master/zsh/.zsh_functions/.zsh_functions'

# zplugin ice wait"0" silent src"zsh-history-substring-search.zsh"
# zplugin light zsh-users/zsh-history-substring-search
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down

# zplugin ice wait"0" silent
# zplugin light MichaelAquilina/zsh-you-should-use

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

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
export PATH="/usr/local/opt/openssl/bin:$PATH"


# uncomment for profiling
# zprof
