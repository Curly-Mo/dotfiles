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
zinit light-mode for \
  zdharma-continuum/zinit-annex-bin-gem-node \
  zdharma-continuum/zinit-annex-binary-symlink \
  zdharma-continuum/zinit-annex-link-man \
  zdharma-continuum/zinit-annex-default-ice \
  zdharma-continuum/zinit-annex-rust \
  zdharma-continuum/zinit-annex-submods \
  zdharma-continuum/zinit-annex-patch-dl \
  zdharma-continuum/zinit-annex-man
zinit light-mode for \
  atinit'Z_A_USECOMP=1' \
  NICHOLAS85/z-a-eval


# Load Oh My Zsh Libs
zinit lucid for OMZ::"lib/history.zsh"
zinit wait"0" lucid for OMZ::"lib/prompt_info_functions.zsh"
zinit wait"0" lucid for OMZ::"lib/git.zsh"
zinit wait"0" lucid for OMZ::"lib/completion.zsh"

# Load Oh My Zsh Plugins
zinit wait"0" lucid for OMZP::"colored-man-pages"
# zinit wait"3" lucid for OMZP::"jenv"
zinit wait"0" lucid for OMZP::"command-not-found"
zinit wait"0" lucid for \
  nocd atload"bindkey -M viins -r '^[^['; bindkey -M vicmd -r '^[^['; bindkey -M emacs -r '^[^['; bindkey -M viins '^\`' sudo-command-line; bindkey -M vicmd '^\`' sudo-command-line" \
    OMZP::"sudo"

# Load Oh My Zsh completions
# zinit wait"0" lucid for OMZP::"git-extras"

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
zinit ice lucid link if"[[ -f $HOME/.zsh_theme ]]"
zinit snippet "$HOME/.zsh_theme"

zinit ice wait"0" lucid link if"[[ -f $HOME/.localrc ]]"
zinit snippet "$HOME/.localrc"

zinit ice wait"0" lucid link if"[[ -f $HOME/.aliases ]]"
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

# zsh-vi-mode
function zvm_config() {
  ZVM_KEYTIMEOUT=0.3
  ZVM_ESCAPE_KEYTIMEOUT=0.03
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_LAZY_KEYBINDINGS=true
}
function zvm_after_lazy_keybindings() {
  # bindkey -M vicmd 's' your_normal_widget
  # bindkey -M visual 'n' your_visual_widget
}
# patch all modify functions to copy/paste from/to the clipboard
function zvm_patch_functions() {
  for f in zvm_backward_kill_region zvm_yank zvm_replace_selection zvm_change_surround_text_object zvm_vi_delete zvm_vi_change zvm_vi_change_eol; do
    eval "$(echo "_$f() {"; declare -f $f | tail -n +2)"
    eval "$f() { _$f; echo -en \$CUTBUFFER | xsel -bi }"
  done
  for f in zvm_vi_put_after zvm_vi_put_before; do
    eval "$(echo "_$f() {"; declare -f $f | tail -n +2)"
    eval "$f() { CUTBUFFER=\$(xclip -out -selection clipboard); _$f; zvm_highlight clear }"
  done
}
zinit lucid depth=1 for \
  atload"zvm_patch_functions" \
  jeffreytse/zsh-vi-mode

zinit lucid for Curly-Mo/last-working-dir-tmux

zinit wait"0" lucid for darvid/zsh-poetry

zinit wait"0" lucid for davidparsson/zsh-pyenv-lazy

# zinit wait"0" lucid for @shihyuho/zsh-jenv-lazy
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

# zinit wait lucid for \
#   MichaelAquilina/zsh-you-should-use
# export YSU_IGNORED_ALIASES=("zini")


# Packages https://github.com/zdharma-continuum/zinit-packages
# zinit pack for dircolors-material

# any-gem installs https://github.com/zdharma-continuum/zinit-packages/tree/main/any-gem
# zinit pack param="GEM → colorls" for any-gem
# any-node modules https://github.com/zdharma-continuum/zinit-packages/tree/main/any-node
# zinit pack param="MOD → prettier" for any-node


# Programs
zinit lucid lman for \
  lbin="*bin/(fzf|fzf-tmux)" \
  make="install" \
    junegunn/fzf
  # atload"_fzf_config" \
zinit wait'0' lucid for \
  multisrc'shell/{completion,key-bindings}.zsh $XDG_CONFIG_HOME/zsh/fzf.zsh' \
  id-as"junegunn/fzf_completions" \
    junegunn/fzf
# zinit wait"0" pack"binary+keys" for fzf

# load fzf-tab-sources from source dir
# zstyle ':fzf-tab:sources' config-directory "$XDG_CONFIG_HOME/zsh/fzf-tab/sources"
zinit wait"0" lucid for \
    Aloxaf/fzf-tab \
  multisrc="$XDG_CONFIG_HOME/zsh/fzf-tab/fzf-tab.zsh" \
    Freed-Wu/fzf-tab-source

zinit wait"0" lucid make lbin lman for \
  jhawthorn/fzy
# zinit wait lucid for \
#   multisrc="$XDG_CONFIG_HOME/zsh/fzy.zsh" \
#     aperezdc/zsh-fzy

zinit wait"0" lucid make"!" lbin lman for \
  eval"./direnv hook zsh" \
    direnv/direnv

zinit wait"0" from"gh-r" lucid lbin lman for \
  eval'./zoxide init zsh' \
    ajeetdsouza/zoxide

zinit lucid light-mode for \
  eval"dircolors -b LS_COLORS" \
  atload'zstyle ":completion:*:default" list-colors "${(s.:.)LS_COLORS}";' \
  git id-as'trapd00r/LS_COLORS' \
    @trapd00r/LS_COLORS
# zinit lucid light-mode for \
#     zpm-zsh/theme-neutral

zinit wait"0" lucid lman completions nocompile for \
    eza-community/eza

# sharkdp
zinit wait"0" from"gh-r" lucid lbin lman completions nocompile for \
  nocd atload"export BAT_THEME='ansi'" \
  cp="bat-*/autocomplete/bat.zsh -> _bat" \
    @sharkdp/bat
zinit wait"0" from"gh-r" lucid lbin lman for \
  cp="fd-*/autocomplete/_fd -> _fd" \
    @sharkdp/fd
zinit wait"0" from"gh-r" lucid lbin lman for \
  @sharkdp/hexyl
zinit wait"0" from"gh-r" lucid lbin lman for \
  @sharkdp/hyperfine
zinit wait"0" from"gh-r" lucid lbin lman for \
  @sharkdp/vivid

zinit wait"0" lucid make lbin lman for \
  mptre/yank

zinit wait"0" lucid from"gh-r" lbin lman for \
  pick"misc/quitcd/quitcd.zsh" \
    jarun/nnn

# zinit wait"0" lucid lbin'sk' lman'sk' for \
#   atclone"cargo build --release" atpull"%atclone" \
#   multisrc"shell/completion.zsh" \
#     lotabout/skim
zinit wait"0" lucid lbin'sk' lman'sk' for \
  atclone"cargo build --release" atpull"%atclone" \
    lotabout/skim

zinit wait"0" lucid from"gh-r" lbin lman for \
  peco/peco

zinit wait"0" lucid from"gh-r" lman for \
  lbin="rg" \
	cp="ripgrep-*/complete/_rg -> _rg" \
    BurntSushi/ripgrep

zinit wait"0" lucid from"gh-r" lbin'jq* -> jq' lman for \
  jqlang/jq

zinit wait"0" lucid as"program" blockf for \
  id-as'sdkman' \
  atclone"wget 'https://get.sdkman.io/?rcupdate=false' -O sdkman_install.sh; SDKMAN_DIR=~/.sdkman bash sdkman_install.sh" \
  atpull"SDKMAN_DIR=$HOME/.sdkman sdk selfupdate" \
  atinit"export SDKMAN_DIR=$HOME/.sdkman; source $HOME/.sdkman/bin/sdkman-init.sh" \
    z-shell/null
# just use the OMZ completions for sdkman
zinit wait"0" lucid for OMZP::"sdk"

# git stuff
zinit wait"0" lucid lbin lman for \
  Fakerr/git-recall \
  davidosomething/git-my \
  paulirish/git-open \
  paulirish/git-recent \
  arzzen/git-quick-stats
zinit wait"0" lucid lbin lman completions nocompile for \
    iwata/git-now
zinit wait"0" lucid from"gh-r" lbin lman for \
  dandavison/delta
zinit wait"0" lucid from"gh-r" lbin lman for \
  nocd atload="alias lg='lazygit'" \
    jesseduffield/lazygit
zinit wait"0" lucid lbin lman make"install PREFIX=$ZPFX" for \
  zdharma-continuum/git-url
# zinit wait"0" lucid as:"program" make"PREFIX=$ZPFX" for \
#   src"etc/git-extras-completion.zsh" \
#     tj/git-extras 
zinit wait"0" lucid as:"program" make"PREFIX=$ZPFX" for \
  lbin"!bin/git-*" \
  lman"bin/git-*" \
  src"etc/git-extras-completion.zsh" \
    tj/git-extras 
zinit wait"0" lucid make lbin lman completions nocompile for \
  cp="etc/hub.zsh_completion -> _hub" \
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

# Welcome message
if [[ -o login && -x "$(command -v fortune)" && -x "$(command -v lolcat)" ]]; then
  # wget http://skeeto.s3.amazonaws.com/share/showerthoughts -O /usr/share/fortune/showerthoughts
  # strfile /usr/share/fortune/showerthoughts /usr/share/fortune/showerthoughts.dat
  fortune showerthoughts | lolcat
fi

# History
HISTSIZE=10000000
SAVEHIST=10000000

# Fn navigation keys
bindkey "^[[7~" beginning-of-line
bindkey "^[[8~" end-of-line
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
