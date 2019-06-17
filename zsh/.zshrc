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

# Oh my zsh themes
# zplugin ice wait"0" silent
# zplugin snippet OMZ::lib/git.zsh
# zplugin ice wait"0" atload"unalias grv" silent
# zplugin snippet OMZ::plugins/git/git.plugin.zsh

# Custom theme
autoload -U colors
colors
# source $HOME/dotfiles/zsh/.zsh_theme
# zplugin ice wait"!0" silent
zplugin snippet 'https://github.com/Curly-Mo/dotfiles/blob/master/zsh/.zsh_theme'
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

zplugin ice wait"1" silent atinit"zpcompinit; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting

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

# custom completions
zplugin ice wait"0" silent
zplugin snippet 'https://github.com/Curly-Mo/dotfiles/blob/master/zsh/.zsh_functions/.zsh_functions'

# zplugin ice wait"0" silent src"zsh-history-substring-search.zsh"
# zplugin light zsh-users/zsh-history-substring-search
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down

# zplugin ice wait"0" silent
# zplugin light MichaelAquilina/zsh-you-should-use

# local stuff
zplugin ice wait"0" silent if"[[ -f $HOME/.aliases ]]"
zplugin snippet "$HOME/.aliases"

zplugin ice wait"0" silent if"[[ -f $HOME/.localrc ]]"
zplugin snippet "$HOME/.localrc"

# Programs
zplugin ice wait"1" silent as"program" pick"$ZPFX/bin/git-*"  make"PREFIX=$ZPFX" nocompile
zplugin light tj/git-extras
zplugin ice wait"2" silent
zplugin snippet "https://github.com/tj/git-extras/blob/master/etc/git-extras-completion.zsh"

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

# uncomment for profiling
# zprof
