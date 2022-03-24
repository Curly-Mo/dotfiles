# uncomment to enable `zpmod source-study` (requires `zinit module build` first)
# module_path+=( "$HOME/.zinit/bin/zmodules/Src" )
# zmodload zdharma/zplugin

# uncomment for profiling (also uncomment a the bottom of file)
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

export ZSH_CACHE_DIR=~/.cache/zsh
setopt promptsubst
setopt globdots
setopt extendedglob

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma-continuum/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f" || \
        print -P "%F{160}▓▒░ The clone has failed.%f"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit installer's chunk

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
zinit ice wait"0" lucid
zinit snippet OMZ::"lib/prompt_info_functions.zsh"
zinit ice wait"0" lucid
zinit snippet OMZ::"lib/completion.zsh"

# Load Oh My Zsh Plugins
# zinit ice wait"0" lucid
# zinit snippet OMZ::"plugins/vi-mode/vi-mode.plugin.zsh"
# zinit ice wait"0" lucid
# zinit snippet OMZ::"plugins/last-working-dir/last-working-dir.plugin.zsh"
zinit ice wait"0" lucid
zinit snippet OMZ::"plugins/colored-man-pages/colored-man-pages.plugin.zsh"
# nah, the alias expansion was too distracting
# zinit ice wait"0" silent
# zinit snippet OMZ::"plugins/globalias/globalias.plugin.zsh"
zinit ice wait"5" lucid
zinit snippet OMZ::"plugins/jenv/jenv.plugin.zsh"

# Plugins
function zvm_config() {
  # This function called by zsh-vi-mode
  ZVM_KEYTIMEOUT=0.3
  ZVM_ESCAPE_KEYTIMEOUT=0.03
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
}
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

# zinit ice wait"0" lucid
zinit light Curly-Mo/last-working-dir-tmux

# caused too many issues
# zinit ice wait"0" silent atload"zstyle ':history-search-multi-word' highlight-color 'fg=4,bold,bg=5'"
# zinit light zdharma/history-search-multi-word

zinit ice wait"0" lucid
zinit light darvid/zsh-poetry

zinit ice wait"0" lucid
zinit light davidparsson/zsh-pyenv-lazy

# zinit ice wait"0" lucid
# zinit light shihyuho/zsh-jenv-lazy
# jenv-lazy caused issues, fine I'll just load it non-lazily for now
# zinit ice wait"10" lucid
# zinit snippet OMZ::"plugins/jenv/jenv.plugin.zsh"

export NVM_LAZY_LOAD=true
zinit ice wait'0' lucid
zinit light lukechilds/zsh-nvm

# nvm wrapper like pyenv
# disabled because it's slow as fuck
# export NVM_DIR="$HOME/.nvm"
# export NVM_LAZY_LOAD=true
# zinit ice wait"2" silent
# zinit light lukechilds/zsh-nvm

# zinit ice wait"0" silent src"zsh-history-substring-search.zsh"
# zinit light zsh-users/zsh-history-substring-search
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down

# zinit ice wait"0" silent
# zinit light MichaelAquilina/zsh-you-should-use

# completions
# alacritty completion
zinit ice wait"1" as"completion" lucid
zinit snippet "https://github.com/jwilm/alacritty/blob/master/extra/completions/_alacritty"
# notes-cli completion
zinit ice wait"1" lucid id-as"notes-cli-completion" mv"notes-cli-completion -> _notes" as"completion"
zinit snippet https://github.com/rhysd/notes-cli/blob/master/completions/zsh/_notes

# local stuff
zinit ice lucid if"[[ -f $HOME/.zsh_theme ]]"
zinit snippet "$HOME/.zsh_theme"

zinit ice wait"0" lucid if"[[ -f $HOME/.aliases ]]"
zinit snippet "$HOME/.aliases"

zinit ice wait"0" lucid if"[[ -f $HOME/.localrc ]]"
zinit snippet "$HOME/.localrc"

zinit wait lucid light-mode for \
  hlissner/zsh-autopair \
  urbainvaes/fzf-marks

# Load all my functions and completions
zinit ice wait"0" lucid if"[[ -d $HOME/.zsh_functions ]]"
zinit light "$HOME/.zsh_functions"

# Programs
# git things
zinit as"program" wait"3" lucid light-mode for \
  Fakerr/git-recall \
  paulirish/git-open \
  paulirish/git-recent \
  davidosomething/git-my \
  make"PREFIX=$ZPFX install" iwata/git-now \
  make"PREFIX=$ZPFX" tj/git-extras

zinit as"program" wait lucid light-mode make"!" for \
  atclone"./direnv hook zsh > zhook.zsh" atpull"%atclone" pick"direnv" src"zhook.zsh" \
    direnv/direnv

# Packs
# actually packs are dumb
# This pack seems broken
# zinit pack"default+keys" for fzf
zinit as'command' wait lucid light-mode \
    atclone'PREFIX=$ZPFX FZF_VERSION=0.28.0 FZF_REVISION=zinit-pack make install &&
      mkdir -p $ZPFX/{bin,man/man1} &&
      cp shell/completion.zsh _fzf_completion &&
      cp -vf bin/fzf(|-tmux) $ZPFX/bin &&
      cp -vf man/man1/fzf(|-tmux).1 $ZPFX/man/man1' \
    atpull'%atclone' depth'1' nocompile pick'$ZPFX/bin/fzf(|-tmux)' src'shell/key-bindings.zsh' \
  for @junegunn/fzf
zinit as"program" wait lucid light-mode from"gh-r" for \
  mv"fd* -> fd" pick"fd/fd" \
   @sharkdp/fd

zinit pack"no-dir-color-swap" for ls_colors

# zsh stuff
zinit wait lucid light-mode for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf atpull'zinit creinstall -q .' \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" atload"zstyle ':completion:*' special-dirs false" \
    zsh-users/zsh-autosuggestions


function _fzf_tab_config() {
  # zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
  # zstyle ':completion:*:fzf-flags:*' 
  # disable sort when completing `git checkout`
  zstyle ':completion:*:git-checkout:*' sort false
  # set list-colors to enable filename colorizing
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
  # preview directory's content with exa when completing cd
  zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
  # set descriptions format to enable group support
  zstyle ':completion:*:descriptions' format '[%d]'
  # switch group using `,` and `.`
  zstyle ':fzf-tab:*' switch-group ',' '.'
  # give a preview of commandline arguments when completing `kill`
  # zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
  # zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview \
  #   [[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w
  # zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap
  # show systemd unit status
  zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'
  # show file contents
  zstyle ':fzf-tab:complete:*:*' fzf-preview 'bat --color=always --plain ${(Q)realpath}'
  # environment variable
  zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' \
    fzf-preview 'echo ${(P)word}'
  # git
  zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview \
    'git diff $word | delta'
  zstyle ':fzf-tab:complete:git-log:*' fzf-preview \
    'git log --color=always $word'
  zstyle ':fzf-tab:complete:git-help:*' fzf-preview \
    'git help $word | bat -plman --color=always'
  zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
    'case "$group" in
    "commit tag") git show --color=always $word ;;
    *) git show --color=always $word | delta ;;
    esac'
  zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
    'case "$group" in
    "modified file") git diff $word | delta ;;
    "recent commit object name") git show --color=always $word | delta ;;
    *) git log --color=always $word ;;
    esac'
  # fix man
  zstyle ':fzf-tab:complete:(\\|)run-help:*' fzf-preview 'run-help $word'
  zstyle ':fzf-tab:complete:(\\|*/|)man:*' fzf-preview 'man $word'
}
zinit wait"1" lucid light-mode for \
  atinit"_fzf_tab_config" \
    Aloxaf/fzf-tab

# End zinit config

# vim-mode
# bindkey -v
# export KEYTIMEOUT=5
# bindkey '^R' history-incremental-search-backward
#bindkey '^[[A' up-line-or-search
#bindkey '^[[B' down-line-or-search

# Fn navigation keys
bindkey "^[[7~" beginning-of-line
bindkey "^[[8~" end-of-line

# Welcome message
if [[ -o login && -x "$(command -v fortune)" && -x "$(command -v lolcat)" ]]; then
  # wget http://skeeto.s3.amazonaws.com/share/showerthoughts -O /usr/share/fortune/showerthoughts
  # strfile /usr/share/fortune/showerthoughts /usr/share/fortune/showerthoughts.dat
  fortune showerthoughts | lolcat
fi

# History
HISTSIZE=10000000
SAVEHIST=10000000

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

# AutoComplete
# complete .. to ../
zstyle ':completion:*' special-dirs true
# autosuggest Shift-Tab
zmodload zsh/complist # must be laoded before menuselect is available
bindkey -M menuselect '^[[Z' reverse-menu-complete

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
