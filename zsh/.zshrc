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
setopt interactive_comments
unsetopt complete_aliases

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

# zinit annexes
zinit light-mode for \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-rust \
    zdharma-continuum/zinit-annex-man

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
# TODO: migrate these old style plugins to new style
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

# new style
zinit wait lucid light-mode for \
  urbainvaes/fzf-marks

function zsh_fzy_config() {
  # bindkey '\ec' fzy-cd-widget
  # bindkey '^T'  fzy-file-widget
  # bindkey '^R'  fzy-history-widget
  bindkey '^Y'  fzy-history-widget
  bindkey '^P'  fzy-proc-widget
  # zstyle :fzy:history prompt       'history >> '
  # zstyle :fzy:history command      fzy-history-default-command
  # zstyle :fzy:file    prompt       'file >> '
  # zstyle :fzy:file    command      fzy-file-default-command
  # zstyle :fzy:cd      prompt       'cd >> '
  # zstyle :fzy:cd      command      fzy-cd-default-command
  # zstyle :fzy:proc    prompt       'proc >> '
  # zstyle :fzy:proc    command      fzy-proc-default-command
}
zinit wait lucid light-mode for \
  atinit"zsh_fzy_config" aperezdc/zsh-fzy

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

# zinit ice wait"0" lucid if"[[ -f $HOME/.aliases ]]"
zinit ice lucid if"[[ -f $HOME/.aliases ]]"
zinit snippet "$HOME/.aliases"

zinit ice lucid if"[[ -f $HOME/.localrc ]]"
# zinit ice wait"0" lucid if"[[ -f $HOME/.localrc ]]"
zinit snippet "$HOME/.localrc"

# Load all my functions and completions
# zinit ice wait"0" lucid if"[[ -d $HOME/.zsh_functions ]]"
# zinit snippet "$HOME/.zsh_functions/my_zsh_functions.zsh"
# from dotfiles
zinit wait"0" lucid light-mode for \
  pick:"zsh/.zsh_functions/.zsh_functions.plugin.zsh" \
  src:"zsh/.zsh_functions/my_zsh_functions.zsh" \
  Curly-Mo/dotfiles

# Programs
# git things
zinit as"null" wait"2" lucid light-mode for \
  sbin Fakerr/git-recall \
  sbin paulirish/git-open \
  sbin paulirish/git-recent \
  sbin davidosomething/git-my \
  make"PREFIX=$ZPFX install" iwata/git-now \
  make"PREFIX=$ZPFX" tj/git-extras

zinit as"program" wait lucid light-mode make"!" for \
  atclone"./direnv hook zsh > zhook.zsh" atpull"%atclone" pick"direnv" src"zhook.zsh" \
    direnv/direnv

function fzf_config() {
  # keys
  # bindkey '^I' fzf-completion
  # bindkey "^Y" $fzf_default_completion
  # bindkey "^[c" fzf-cd-widget
  # bindkey "^T" fzf-file-widget
  bindkey "^R" history-incremental-search-backward
  bindkey "^E" fzf-history-widget
  # config
  export FZF_PREVIEW_CMD="(highlight -O ansi --line-range 0-200 {} 2> /dev/null || bat --force-colorization --line-range 0:200 --plain {-1} || tree -C {}) 2> /dev/null | head -200"
  export FZF_COMMAND='fd --hidden --exclude .git --color=always --max-depth 12'
  # export FZF_DEFAULT_COMMAND="${FZF_COMMAND} | proximity-sort ."
  export FZF_DEFAULT_COMMAND="${FZF_COMMAND}"
  FZF_BINDINGS_OPTS="--bind 'ctrl-a:toggle-all' --bind 'ctrl-space:toggle+down' --bind 'tab:replace-query+down' --bind 'shift-tab:backward-kill-word' --bind 'right:replace-query+down' --bind 'left:backward-kill-word' --bind 'change:first' --bind 'ctrl-f:jump' --bind 'ctrl-d:delete-char/eof+clear-query'  --bind 'alt-j:down' --bind 'alt-k:up'"
  export FZF_DEFAULT_OPTS="--height 60% --border --ansi --info=inline --algo v2 ${FZF_BINDINGS_OPTS}"
  # export FZF_DEFAULT_OPTS="--height 50% --border --ansi --info=inline --algo v1 --tiebreak=index ${FZF_BINDINGS_OPTS}"
  FZF_CTRL_R_PREVIEW_OPTS="--preview 'echo {} | highlight --syntax sh -O ansi' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
  export FZF_CTRL_R_OPTS="--exact --bind 'ctrl-e:up' --bind 'ctrl-E:down' ${FZF_CTRL_R_PREVIEW_OPTS}"
  export FZF_CTRL_T_COMMAND="${FZF_COMMAND}"
  export FZF_CTRL_T_OPTS="${FZF_DEFAULT_OPTS} --select-1 --exit-0 --preview '${FZF_PREVIEW_CMD}'"
  # export FZF_ALT_C_COMMAND="${FZF_COMMAND} --type d | proximity-sort ."
  export FZF_ALT_C_COMMAND="${FZF_COMMAND} --type d"
  # export FZF_ALT_C_OPTS="${FZF_DEFAULT_OPTS} --select-1 --exit-0 --preview 'tree -C {} | head -200' --bind 'alt-c:down' --bind 'alt-C:up' --bind 'tab:down' --bind 'shift-tab:up'"
  export FZF_ALT_C_OPTS="${FZF_DEFAULT_OPTS} --select-1 --exit-0 --preview 'tree -C {} | head -200' --bind 'alt-c:down' --bind 'alt-C:up'"
  FZF_COMPLETION_BINDINGS_OPTS=""
  export FZF_COMPLETION_OPTS="${FZF_DEFAULT_OPTS} --select-1 --exit-0 --preview '${FZF_PREVIEW_CMD}' ${FZF_COMPLETION_BINDINGS_OPTS}"
  _fzf_compgen_path() {
    # fd --hidden --exclude .git --full-path --color=always . "$1" | proximity-sort .
    fd --hidden --exclude .git --color=always --max-depth 10 . "$1"
  }
  _fzf_compgen_dir() {
    # fd --hidden --exclude .git --full-path --color=always --type d . "$1" | proximity-sort .
    fd --hidden --exclude .git --color=always --max-depth 10 --type d . "$1"
  }
  # export FZF_COMPLETION_TRIGGER=''
  # Super hack to only notrigger complete for certain commands
  # rename fzf-completion to _fzf-completion
  eval "`declare -f fzf-completion | sed '1s/.*/_&/'`"
  fzf-completion() {
    d_cmds=(${=FZF_COMPLETION_DIR_COMMANDS:-cd pushd rmdir})
    f_cmds=(${=FZF_COMPLETION_FILE_COMMANDS:-vim nvim cat rm})
    p_cmds=(${=FZF_COMPLETION_PATH_COMMANDS:-ls})
    cmd=$(__fzf_extract_command "$LBUFFER")
    cmd=$(__fzf_extract_command $(whence $cmd))
    if [ ${d_cmds[(i)$cmd]} -le ${#d_cmds} ]; then
      FZF_COMPLETION_TRIGGER='' _fzf-completion
    elif [ ${f_cmds[(i)$cmd]} -le ${#f_cmds} ]; then
      FZF_COMPLETION_TRIGGER='' _fzf-completion
    elif [ ${p_cmds[(i)$cmd]} -le ${#p_cmds} ]; then
      FZF_COMPLETION_TRIGGER='' _fzf-completion
    else
      _fzf-completion
    fi
  }
}
# zinit as'command' wait'2' lucid light-mode \
#     atclone'PREFIX=$ZPFX FZF_VERSION=0.28.0 FZF_REVISION=zinit-pack make install &&
#       mkdir -p $ZPFX/{bin,man/man1} &&
#       cp shell/completion.zsh _fzf_completion &&
#       cp -vf bin/fzf(|-tmux) $ZPFX/bin &&
#       cp -vf man/man1/fzf(|-tmux).1 $ZPFX/man/man1' \
#     atpull'%atclone' depth'1' nocompile pick'$ZPFX/bin/fzf(|-tmux)' src'shell/key-bindings.zsh' \
#     atload"fzf_config" \
#   for @junegunn/fzf
zinit wait'0' lucid light-mode for \
  multisrc'shell/{completion,key-bindings}.zsh' \
  atload"fzf_config" \
  id-as"junegunn/fzf_completions" \
    junegunn/fzf
  # src'shell/completion.zsh' \
# function fzf_completions_config() {
# }
# zinit wait'0' lucid light-mode for \
#   pick'zsh/fzf-zsh-completion.sh' \
#   atload"fzf_completions_config" \
#     lincheney/fzf-tab-completion

function _fzf_tab_config() {
  # accept and run
  # zstyle ':fzf-tab:*' print-query alt-space # unbind from alt-enter
  # zstyle ':fzf-tab:*' accept-line alt-enter
  zstyle ':fzf-tab:*' accept-line ctrl-x
  zstyle ':fzf-tab:*' continuous-trigger 'right'
  zstyle ':fzf-tab:*' continuous-trigger 'tab'
  # disable sort when completing `git checkout`
  zstyle ':completion:*:git-checkout:*' sort false
  # set list-colors to enable filename colorizing
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
  # preview directory's content with exa when completing cd
  # zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
  zstyle ':fzf-tab:complete:cd:*' fzf-preview 'tree -C ${(Q)realpath} | head -200'
  # set descriptions format to enable group support
  zstyle ':completion:*:descriptions' format '[%d]'
  # switch group using `,` and `.`
  zstyle ':fzf-tab:*' switch-group ',' '.'
  # give a preview of commandline arguments when completing `kill`
  zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
  zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap
  # show systemd unit status
  zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'
  # show file contents
  # zstyle ':fzf-tab:complete:*:*' fzf-preview 'bat --color=always --plain ${(Q)realpath}'
  zstyle ':fzf-tab:complete:*:*' fzf-preview '(highlight -O ansi --line-range 0-200 $realpath || bat --color=always --line-range :200 --plain ${(Q)realpath} || tree -C $realpath) 2> /dev/null | head -200'
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
  # looks
  zstyle ':fzf-tab:complete:*' fzf-pad 4
  # zstyle ':fzf-tab:complete:*' fzf-flags --tiebreak=index
  # use fd
  # _files() {
  #   # fd --hidden --exclude .git --type=f | {
  #   fd --hidden --exclude .git --type=f | proximity-sort . | {
  #     while read line; do
  #       compadd -f -- $line
  #     done
  #   }
  # }
  # _cd() {
  #   fd --hidden --exclude .git --type=d | proximity-sort . | {
  #     while read line; do
  #       compadd -f -- $line
  #     done
  #   }
  #   # local dirs=($(fd --hidden --exclude .git --type=d | proximity-sort .))
  #   # compadd -a -f dirs
  # }
}
zinit wait"1" lucid light-mode for \
  atinit"_fzf_tab_config" \
    Aloxaf/fzf-tab

# zinit as"program" wait lucid light-mode from"gh-r" for \
#   mv"fd* -> fd" pick"fd/fd" \
#    @sharkdp/fd

zinit wait lucid light-mode as:'program' from:'gh-r' for \
  mv:'zoxide* -> zoxide' \
  pick:'zoxide/zoxide' \
  atload:'!eval "$(zoxide init zsh)"' \
    @ajeetdsouza/zoxide

zinit wait lucid light-mode \
  atclone"[[ -z ${commands[dircolors]} ]] &&
    local P=${${(M)OSTYPE##darwin}:+g};
    ${P}dircolors -b LS_COLORS >! clrs.zsh" \
  atload'zstyle ":completion:*:default" list-colors "${(s.:.)LS_COLORS}";' \
  atpull'%atclone' nocompile'!' pick'clrs.zsh' for \
  git id-as'trapd00r/LS_COLORS' \
    @trapd00r/LS_COLORS

# zsh stuff
zinit wait lucid light-mode for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf atpull'zinit creinstall -q .' \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" atload"zstyle ':completion:*' special-dirs false" \
    zsh-users/zsh-autosuggestions

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
