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
  zdharma-continuum/zinit-annex-default-ice \
  zdharma-continuum/zinit-annex-meta-plugins \
  zdharma-continuum/zinit-annex-rust \
  zdharma-continuum/zinit-annex-submods \
  zdharma-continuum/zinit-annex-man


# Load Oh My Zsh Libs
zinit snippet OMZ::"lib/history.zsh"
zinit ice wait"0" lucid
zinit snippet OMZ::"lib/prompt_info_functions.zsh"
zinit ice wait"0" lucid
zinit snippet OMZ::"lib/completion.zsh"


# Load Oh My Zsh Plugins
zinit ice wait"0" lucid
zinit snippet OMZ::"plugins/colored-man-pages/colored-man-pages.plugin.zsh"
zinit ice wait"5" lucid
zinit snippet OMZ::"plugins/jenv/jenv.plugin.zsh"


# Load meta plugins
# from zdharma-continuum/zinit-annex-meta-plugins
zinit wait lucid skip'fzf-go' for \
  `# fzf, fzy, lotabout/skim, peco/peco` \
  fuzzy-src \
  `# Fakerr/git-recall, paulirish/git-open, paulirish/git-recent, davidosomething/git-my, arzzen/git-quick-stats, iwata/git-now, tj/git-extras, wfxr/forgit` \
  ext-git \
  `# dircolors-material, sharkdp, ogham/exa, BurntSushi/ripgrep, jonas/tig` \
  console-tools
  # `# sharkdp/fd, sharkdp/bat, sharkdp/hexyl, sharkdp/hyperfine, sharkdp/vivid` \
  # sharkdp


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
# zinit ice lucid if"[[ -f $HOME/.localrc ]]"
zinit snippet "$HOME/.localrc"

zinit ice wait"0" lucid if"[[ -f $HOME/.aliases ]]"
# zinit ice lucid if"[[ -f $HOME/.aliases ]]"
zinit snippet "$HOME/.aliases"

# completions
zinit ice wait"0" lucid if"[[ -d $HOME/bin/_completions ]]" creinstall for \
  "$HOME/bin/_completions"

# Load all my functions and completions
# zinit ice wait"0" lucid if"[[ -d $HOME/.zsh_functions ]]"
# zinit snippet "$HOME/.zsh_functions/my_zsh_functions.zsh"
# from dotfiles
zinit wait"0" lucid light-mode for \
  pick:"zsh/.zsh_functions/.zsh_functions.plugin.zsh" \
  src:"zsh/.zsh_functions/my_zsh_functions.zsh" \
  Curly-Mo/dotfiles
# zinit ice wait"0" lucid if"[[ -f $HOME/.zsh_functions/my_zsh_functions.zsh ]]" creinstall for \
#   "$HOME/.zsh_functions/my_zsh_functions.zsh"

# Config
zinit ice lucid if"[[ -f $HOME/dotfiles/zsh/.config/zsh/fzf.zsh ]]"
zinit snippet "$HOME/dotfiles/zsh/.config/zsh/fzf.zsh"
zinit ice lucid if"[[ -f $HOME/dotfiles/zsh/.config/zsh/fzf-tab.zsh ]]"
zinit snippet "$HOME/dotfiles/zsh/.config/zsh/fzf-tab.zsh"
zinit ice lucid if"[[ -f $HOME/dotfiles/zsh/.config/zsh/fzy.zsh ]]"
zinit snippet "$HOME/dotfiles/zsh/.config/zsh/fzy.zsh"


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

zinit ice wait"0" lucid
zinit light darvid/zsh-poetry

zinit ice wait"0" lucid
zinit light davidparsson/zsh-pyenv-lazy

zinit ice wait"0" lucid
zinit light shihyuho/zsh-jenv-lazy
# jenv-lazy caused issues, fine I'll just load it non-lazily for now
# zinit ice wait"10" lucid
# zinit snippet OMZ::"plugins/jenv/jenv.plugin.zsh"

export NVM_LAZY_LOAD=true
zinit ice wait'0' lucid
zinit light lukechilds/zsh-nvm

# new style
# curses console `ziconsole`
zinit wait lucid light-mode for \
  zdharma-continuum/zui \
  zdharma-continuum/zinit-console

zinit wait lucid light-mode for \
  urbainvaes/fzf-marks

# Programs
zinit wait'0' lucid light-mode for \
  multisrc'shell/{completion,key-bindings}.zsh' \
  atload"_fzf_config" \
  id-as"junegunn/fzf_completions" \
    junegunn/fzf

zinit wait"1" lucid light-mode for \
  atinit"_fzf_tab_config" \
    Aloxaf/fzf-tab

zinit wait lucid light-mode for \
  atinit"_zsh_fzy_config" \
    aperezdc/zsh-fzy

zinit as"program" wait lucid light-mode make"!" for \
  atclone"./direnv hook zsh > zhook.zsh" atpull"%atclone" pick"direnv" src"zhook.zsh" \
    direnv/direnv

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
