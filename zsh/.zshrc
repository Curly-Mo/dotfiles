# uncomment for profiling
# zmodload zsh/zprof

# tmux
tmux::reattach_or_new_session() {
  if [[ -z "$TMUX" ]] ;then
      ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
      if [[ -z "$ID" ]] ;then # if not available create a new one
          tmux -2 new-session
      else
          tmux attach-session -t "$ID" # if available attach to it
      fi
  fi
}
tmux::reattach_or_new_session

# Load zplugin
source ~/.zplugin/bin/zplugin.zsh

export ZSH_CACHE_DIR=~/.cache/zsh
setopt promptsubst
setopt globdots
setopt extendedglob

# Oh my zsh themes
# zplugin ice wait"0" silent
# zplugin snippet OMZ::lib/git.zsh
# zplugin ice wait"0" atload"unalias grv" silent
# zplugin snippet OMZ::plugins/git/git.plugin.zsh

# Custom theme
autoload -U colors
colors
# moved to local snippets
# source $HOME/dotfiles/zsh/.zsh_theme
# # zplugin ice wait"!0" silent
# zplugin snippet 'https://github.com/Curly-Mo/dotfiles/blob/master/zsh/.zsh_theme'
# zplugin ice wait"!0" silent
zplugin snippet 'https://github.com/woefe/git-prompt.zsh/blob/master/git-prompt.zsh'

# Load Oh My Zsh Libs
zplugin snippet OMZ::"lib/history.zsh"
zplugin ice wait"0" silent
zplugin snippet OMZ::"lib/prompt_info_functions.zsh"
zplugin ice wait"0" silent
zplugin snippet OMZ::"lib/completion.zsh"

# Load Oh My Zsh Plugins
zplugin ice wait"0" silent
zplugin snippet OMZ::"plugins/vi-mode/vi-mode.plugin.zsh"
zplugin ice wait"!0" silent
zplugin snippet OMZ::"plugins/last-working-dir/last-working-dir.plugin.zsh"
zplugin ice wait"0" silent
zplugin snippet OMZ::"plugins/colored-man-pages/colored-man-pages.plugin.zsh"
# nah, the alias expansion was too distracting
# zplugin ice wait"0" silent
# zplugin snippet OMZ::"plugins/globalias/globalias.plugin.zsh"

# Plugins
zplugin ice wait"0" silent atclone"dircolors -b LS_COLORS > clrs.zsh" atpull'%atclone' pick"clrs.zsh"
zplugin light trapd00r/LS_COLORS

zplugin ice wait"0" silent blockf
zplugin light zsh-users/zsh-completions

# export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
# export ZSH_AUTOSUGGEST_USE_ASYNC=true
# export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'
zplugin ice wait"1" silent atload"_zsh_autosuggest_start" atload"zstyle ':completion:*' special-dirs false"
zplugin light zsh-users/zsh-autosuggestions

# caused too many issues
# zplugin ice wait"0" silent atload"zstyle ':history-search-multi-word' highlight-color 'fg=4,bold,bg=5'"
# zplugin light zdharma/history-search-multi-word

zplugin ice wait"0" silent
zplugin light darvid/zsh-poetry

zplugin ice wait"0" silent
zplugin light davidparsson/zsh-pyenv-lazy

zplugin ice wait"0" silent
zplugin light shihyuho/zsh-jenv-lazy

# nvm wrapper like pyenv
export NVM_DIR="$HOME/.nvm"
export NVM_LAZY_LOAD=true
zplugin ice wait"2" silent
zplugin light lukechilds/zsh-nvm

# Use this instead of git-prompt once I get it working
# zplugin ice wait'1' silent pick"gitstatus.plugin.zsh"
# zplugin light romkatv/gitstatus

# zplugin ice wait"0" silent from"gh-r" as"program"
# zplugin load junegunn/fzf-bin

# zplugin ice wait"0" silent src"zsh-history-substring-search.zsh"
# zplugin light zsh-users/zsh-history-substring-search
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down

# zplugin ice wait"0" silent
# zplugin light MichaelAquilina/zsh-you-should-use

# completions
zplugin ice wait"1" as"completion" silent
zplugin snippet "https://github.com/jwilm/alacritty/blob/master/extra/completions/_alacritty"

# local stuff
zplugin ice silent if"[[ -f $HOME/.zsh_theme ]]"
zplugin snippet "$HOME/.zsh_theme"

zplugin ice wait"0" silent if"[[ -f $HOME/.aliases ]]"
zplugin snippet "$HOME/.aliases"

zplugin ice wait"0" silent if"[[ -f $HOME/.localrc ]]"
zplugin snippet "$HOME/.localrc"

# Load all my functions and completions
zplugin ice wait"1" silent if"[[ -d $HOME/.zsh_functions ]]"
zplugin light "$HOME/.zsh_functions"

# Programs
zplugin ice wait"1" silent as"program" pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX" nocompile
zplugin light tj/git-extras
zplugin ice wait"2" silent
zplugin snippet "https://github.com/tj/git-extras/blob/master/etc/git-extras-completion.zsh"

# do this one last since it calls compinit
zplugin ice wait"1" silent atinit"zpcompinit; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting

# End zplugin config

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
# quit current buffer
bindkey '^q' push-line-or-edit


# TODO: Do I want this stuff? just trying it out
# # Fuzzy matching of completions for when you mistype them:
# zstyle ':completion:*' completer _complete _match _approximate
# zstyle ':completion:*:match:*' original only
# zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3>7?7:($#PREFIX+$#SUFFIX)/3))numeric)'
# # Pretty completions
# zstyle ':completion:*:matches' group 'yes'
# zstyle ':completion:*:options' description 'yes'
# zstyle ':completion:*:options' auto-description '%d'
# zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
# zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
# zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
# zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
# zstyle ':completion:*:default' list-prompt '%S%M matches%s'
# zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' verbose yes
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
# zstyle ':completion:*' rehash true

# uncomment for profiling
# zprof
