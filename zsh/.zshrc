# uncomment to enable `zpmod source-study` (requires `zinit module build` first)
# module_path+=( "$HOME/.zinit/module/Src" )
# zmodload zdharma_continuum/zinit

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
export TMP_OLDPWD=$OLDPWD

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
zinit for \
  zdharma-continuum/zinit-annex-bin-gem-node \
  zdharma-continuum/zinit-annex-binary-symlink \
  zdharma-continuum/zinit-annex-linkman \
  zdharma-continuum/zinit-annex-default-ice \
  zdharma-continuum/zinit-annex-meta-plugins \
  zdharma-continuum/zinit-annex-rust \
  zdharma-continuum/zinit-annex-submods \
  zdharma-continuum/zinit-annex-patch-dl \
  zdharma-continuum/zinit-annex-man


# Load Oh My Zsh Libs
zinit lucid for OMZ::"lib/history.zsh"
zinit wait"0" lucid for OMZ::"lib/prompt_info_functions.zsh"
zinit wait"0" lucid for OMZ::"lib/git.zsh"
zinit wait"0" lucid for OMZ::"lib/completion.zsh"

# Load Oh My Zsh Plugins
zinit wait"0" lucid for OMZP::"colored-man-pages"
zinit wait"3" lucid for OMZP::"jenv"
zinit wait"0" lucid for OMZP::"command-not-found"
zinit wait"0" lucid for \
  nocd atload"bindkey -M viins -r '^[^['; bindkey -M viins '^\`' sudo-command-line" \
    OMZP::"sudo"

# Load Oh My Zsh completions
zinit wait"0" lucid for OMZP::"git-extras"

# Workaround for zinit issue#504: remove subversion dependency. Function clones all files in plugin
# directory (on github) that might be useful to zinit snippet directory. Should only be invoked
# via zinit atclone"_omzp_fix"
setopt RE_MATCH_PCRE   # _omzp_fix function uses this regex style
_omzp_fix() {
  if [[ ! -f ._zinit/teleid ]] then return 0; fi
  if [[ ! $(cat ._zinit/teleid) =~ "^OMZP::.*" ]] then return 0; fi
  local OMZP_NAME=$(cat ._zinit/teleid | sed -n 's/OMZP:://p')
  git clone --quiet --no-checkout --depth=1 --filter=tree:0 https://github.com/ohmyzsh/ohmyzsh
  cd ohmyzsh
  git sparse-checkout set --no-cone plugins/$OMZP_NAME
  git checkout --quiet
  cd ..
  local OMZP_PATH="ohmyzsh/plugins/$OMZP_NAME"
  local file
  for file in ohmyzsh/plugins/$OMZP_NAME/*~(.gitignore|*.plugin.zsh)(D); do
    local filename="${file:t}"
    echo "Copying $file to $(pwd)/$filename..."
    cp $file $filename
  done
  rm -rf ohmyzsh
}
# OMZ plugins that require more than 1 file
# zinit wait"0" lucid atclone"_omzp_fix" for \
#   OMZP::"gitfast"


# local stuff
# Custom theme
autoload -U colors
colors
# source $HOME/dotfiles/zsh/.zsh_theme
# # zinit ice wait"!0" silent
# zinit snippet 'https://github.com/Curly-Mo/dotfiles/blob/master/zsh/.zsh_theme'
zinit ice lucid
zinit snippet 'https://github.com/woefe/git-prompt.zsh/blob/master/git-prompt.zsh'
# zinit ice wait"0" lucid if"[[ -f $HOME/.zsh_theme ]]"
zinit ice lucid if"[[ -f $HOME/.zsh_theme ]]"
zinit snippet "$HOME/.zsh_theme"

zinit ice wait"0" lucid if"[[ -f $HOME/.localrc ]]"
zinit snippet "$HOME/.localrc"

zinit ice wait"0" lucid if"[[ -f $HOME/.aliases ]]"
zinit snippet "$HOME/.aliases"

# completions
# zinit ice wait"0" lucid if"[[ -d $HOME/bin/_completions ]]" creinstall "$HOME/bin/_completions"

# Load all my functions and completions
# TODO: load these better
zinit wait"0" lucid id-as"my_zsh_functions" for \
  pick:"zsh/.zsh_functions/zsh_functions.plugin.zsh" \
  multisrc:"zsh/.zsh_functions/my_zsh_functions.zsh" \
    Curly-Mo/dotfiles


# Plugins
function zvm_config() {
  # This function called by zsh-vi-mode
  ZVM_KEYTIMEOUT=0.3
  ZVM_ESCAPE_KEYTIMEOUT=0.03
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
}
zinit lucid depth=1 for \
  jeffreytse/zsh-vi-mode

zinit lucid for Curly-Mo/last-working-dir-tmux

zinit wait"0" lucid for darvid/zsh-poetry

zinit wait"0" lucid for davidparsson/zsh-pyenv-lazy

zinit wait"0" lucid for @shihyuho/zsh-jenv-lazy
# jenv-lazy caused issues, fine I'll just load it non-lazily for now
# zinit ice wait"10" lucid
# zinit snippet OMZ::"plugins/jenv/jenv.plugin.zsh"

export NVM_LAZY_LOAD=true
zinit wait'0' lucid for \
  lukechilds/zsh-nvm

# curses console `ziconsole`
zinit wait lucid for \
  zdharma-continuum/zui \
  zdharma-continuum/zinit-console

zinit wait lucid for \
  urbainvaes/fzf-marks


# Packages https://github.com/zdharma-continuum/zinit-packages
zinit pack for dircolors-material

# any-gem installs https://github.com/zdharma-continuum/zinit-packages/tree/main/any-gem
# zinit pack param="GEM → colorls" for any-gem
# any-node modules https://github.com/zdharma-continuum/zinit-packages/tree/main/any-node
# zinit pack param="MOD → prettier" for any-node


# Programs
# zinit lucid as=program for \
#   pick="$ZPFX/bin/(fzf|fzf-tmux)" \
#   multisrc'shell/{completion,key-bindings}.zsh' \
#   atclone="cp shell/completion.zsh _fzf_completion; cp bin/(fzf|fzf-tmux) $ZPFX/bin" \
#   make="PREFIX=$ZPFX install" \
#   atload"_fzf_config" \
#     junegunn/fzf
zinit wait'0' lucid for \
  multisrc'shell/{completion,key-bindings}.zsh $XDG_CONFIG_HOME/zsh/fzf.zsh' \
  id-as"junegunn/fzf_completions" \
    junegunn/fzf
# zinit wait"0" pack"binary+keys" for fzf

zinit wait"0" lucid for \
  multisrc="$XDG_CONFIG_HOME/zsh/fzf-tab.zsh" \
    Aloxaf/fzf-tab

zinit wait"0" lucid make lbin for \
  jhawthorn/fzy
# zinit wait lucid for \
#   multisrc="$XDG_CONFIG_HOME/zsh/fzy.zsh" \
#     aperezdc/zsh-fzy

zinit wait"0" lucid make"!" lbin for \
  atclone"./direnv hook zsh > zhook.zsh" \
  atpull"%atclone" \
  src"zhook.zsh" \
    direnv/direnv

zinit wait"0" from"gh-r" lucid lbin for \
  nocd atload:'!eval "$(zoxide init zsh)"' \
    ajeetdsouza/zoxide

# zinit wait"0" pack for ls_colors
zinit lucid light-mode \
  atclone"[[ -z ${commands[dircolors]} ]] &&
    local P=${${(M)OSTYPE##darwin}:+g};
    ${P}dircolors -b LS_COLORS >! clrs.zsh" \
  atload'zstyle ":completion:*:default" list-colors "${(s.:.)LS_COLORS}";' \
  atpull'%atclone' nocompile'!' pick'clrs.zsh' for \
  git id-as'trapd00r/LS_COLORS' \
    @trapd00r/LS_COLORS

zinit wait"0" from"gh-r" lucid lbin for \
  mv"completions/exa.zsh -> _exa" \
    ogham/exa

# sharkdp
zinit wait"0" from"gh-r" lucid lbin for \
  nocd atload"export BAT_THEME='ansi'" \
    @sharkdp/bat
zinit wait"0" from"gh-r" lucid lbin for \
  @sharkdp/fd
zinit wait"0" from"gh-r" lucid lbin for \
  @sharkdp/hexyl
zinit wait"0" from"gh-r" lucid lbin for \
  @sharkdp/hyperfine
zinit wait"0" from"gh-r" lucid lbin for \
  @sharkdp/vivid

zinit wait"0" lucid make lbin for \
  mptre/yank

zinit wait"0" lucid from"gh-r" lbin for \
  pick"misc/quitcd/quitcd.zsh" \
    jarun/nnn

zinit wait"0" lucid lbin'sk' lman'sk' for \
  atclone"cargo build --release" atpull"%atclone" \
  multisrc"shell/completion.zsh" \
    lotabout/skim

zinit wait"0" lucid from"gh-r" lbin for \
  peco/peco

zinit wait"0" lucid from"gh-r" for \
  lbin="rg" \
    BurntSushi/ripgrep

zinit wait"0" lucid from"gh-r" lbin'jq* -> jq' for \
  jqlang/jq

# git stuff
zinit wait"0" lucid lbin for \
  Fakerr/git-recall \
  davidosomething/git-my \
  iwata/git-now \
  paulirish/git-open \
  paulirish/git-recent \
  arzzen/git-quick-stats
zinit wait"0" lucid from"gh-r" lbin for \
  dandavison/delta
zinit wait"0" lucid from"gh-r" lbin for \
  nocd atload="alias lg='lazygit'" \
    jesseduffield/lazygit
zinit wait"0" lucid make lbin for \
  zdharma-continuum/git-url
zinit wait"0" lucid as:"program" make for \
  pick"bin/git-*" \
  lman"bin/git-*" \
    tj/git-extras 
  # src"etc/git-extras-completion.zsh" \
zinit wait"0" lucid make lbin for \
  pick"hub/etc/hub.zsh_completion" \
    @github/hub
# zinit wait"0" lucid for \
#   wfxr/forgit


# zsh stuff
zinit wait lucid for \
  atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
  blockf atpull'zinit creinstall -q .' \
    zsh-users/zsh-completions \
  nocd atload"!_zsh_autosuggest_start" atload"zstyle ':completion:*' special-dirs false" \
    zsh-users/zsh-autosuggestions


# Completions
# alacritty completion
zinit ice wait"1" as"completion" lucid
zinit snippet "https://github.com/jwilm/alacritty/blob/master/extra/completions/_alacritty"


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
