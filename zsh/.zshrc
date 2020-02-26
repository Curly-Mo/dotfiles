# uncomment to enable `zpmod source-study`
# requires `zinit module build` first
# module_path+=( "/Users/colinfahy/.zinit/bin/zmodules/Src" )
# zmodload zdharma/zplugin

# uncomment for profiling
# zmodload zsh/zprof

# tmux
tmux::reattach_or_new_session() {
  if [[ -z "$TMUX" ]]; then
    # get the id of a deattached session
    ID="`tmux ls 2> /dev/null | grep -vm1 attached | cut -d: -f1`"
    if [[ -z "$ID" ]]; then
      # if not available create a new one
      tmux -2 new-session
    else
      # if available attach to it
      tmux attach-session -t "$ID"
    fi
  fi
}
tmux::reattach_or_new_session

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f" || \
        print -P "%F{160}▓▒░ The clone has failed.%f"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit installer's chunk

export ZSH_CACHE_DIR=~/.cache/zsh
setopt promptsubst
setopt globdots
setopt extendedglob

# Oh my zsh themes
# zinit ice wait"0" silent
# zinit snippet OMZ::lib/git.zsh
# zinit ice wait"0" atload"unalias grv" silent
# zinit snippet OMZ::plugins/git/git.plugin.zsh

# Custom theme
autoload -U colors
colors
# moved to local snippets
# source $HOME/dotfiles/zsh/.zsh_theme
# # zinit ice wait"!0" silent
# zinit snippet 'https://github.com/Curly-Mo/dotfiles/blob/master/zsh/.zsh_theme'
# zinit ice wait"!0" silent
zinit snippet 'https://github.com/woefe/git-prompt.zsh/blob/master/git-prompt.zsh'

# Load Oh My Zsh Libs
zinit snippet OMZ::"lib/history.zsh"
zinit ice wait"0" silent
zinit snippet OMZ::"lib/prompt_info_functions.zsh"
zinit ice wait"0" silent
zinit snippet OMZ::"lib/completion.zsh"

# Load Oh My Zsh Plugins
zinit ice wait"0" silent
zinit snippet OMZ::"plugins/vi-mode/vi-mode.plugin.zsh"
zinit ice wait"0" silent
zinit snippet OMZ::"plugins/last-working-dir/last-working-dir.plugin.zsh"
zinit ice wait"0" silent
zinit snippet OMZ::"plugins/colored-man-pages/colored-man-pages.plugin.zsh"
# nah, the alias expansion was too distracting
# zinit ice wait"0" silent
# zinit snippet OMZ::"plugins/globalias/globalias.plugin.zsh"

# Plugins
zinit ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh" nocompile'!'
zinit light trapd00r/LS_COLORS

zinit ice wait"0" silent blockf
zinit light zsh-users/zsh-completions

# export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
# export ZSH_AUTOSUGGEST_USE_ASYNC=true
# export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'
zinit ice wait"1" silent atload"_zsh_autosuggest_start" atload"zstyle ':completion:*' special-dirs false"
zinit light zsh-users/zsh-autosuggestions

# caused too many issues
# zinit ice wait"0" silent atload"zstyle ':history-search-multi-word' highlight-color 'fg=4,bold,bg=5'"
# zinit light zdharma/history-search-multi-word

zinit ice wait"0" silent
zinit light darvid/zsh-poetry

zinit ice wait"0" silent
zinit light davidparsson/zsh-pyenv-lazy

zinit ice wait"0" silent
zinit light shihyuho/zsh-jenv-lazy

# nvm wrapper like pyenv
# disabled because it's slow as fuck
# export NVM_DIR="$HOME/.nvm"
# export NVM_LAZY_LOAD=true
# zinit ice wait"2" silent
# zinit light lukechilds/zsh-nvm

# Use this instead of git-prompt once I get it working
# zinit ice wait'1' silent pick"gitstatus.plugin.zsh"
# zinit light romkatv/gitstatus

# zinit ice wait"0" silent from"gh-r" as"program"
# zinit load junegunn/fzf-bin

# zinit ice wait"0" silent src"zsh-history-substring-search.zsh"
# zinit light zsh-users/zsh-history-substring-search
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down

# zinit ice wait"0" silent
# zinit light MichaelAquilina/zsh-you-should-use

# completions
zinit ice wait"1" as"completion" silent
zinit snippet "https://github.com/jwilm/alacritty/blob/master/extra/completions/_alacritty"

# local stuff
zinit ice silent if"[[ -f $HOME/.zsh_theme ]]"
zinit snippet "$HOME/.zsh_theme"

zinit ice wait"0" silent if"[[ -f $HOME/.aliases ]]"
zinit snippet "$HOME/.aliases"

zinit ice wait"0" silent if"[[ -f $HOME/.localrc ]]"
zinit snippet "$HOME/.localrc"

# Load all my functions and completions
zinit ice wait"1" silent if"[[ -d $HOME/.zsh_functions ]]"
zinit light "$HOME/.zsh_functions"

# Programs
# zinit ice wait"1" silent as"program" pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX" nocompile
# zinit light tj/git-extras
# zinit ice wait"2" silent
# zinit snippet "https://github.com/tj/git-extras/blob/master/etc/git-extras-completion.zsh"

# do this one last since it calls compinit
zinit ice wait"1" silent atinit"zpcompinit; zpcdreplay"
zinit light zdharma/fast-syntax-highlighting

# End zinit config

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

# Stop stupid behavior of ctrl-d after a space
exit_zsh() { exit }
zle -N exit_zsh
bindkey '^D' exit_zsh

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
