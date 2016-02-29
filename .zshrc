HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt HIST_IGNORE_DUPS
setopt appendhistory autocd extendedglob
unsetopt beep
bindkey -v

zstyle :compinstall filename '/home/colin/.zshrc'
autoload -Uz compinit promptinit colors
compinit
promptinit
colors
prompt walters

zstyle ':completion:*' menu select


# Dirstack
DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}
DIRSTACKSIZE=20
setopt autopushd pushdsilent pushdtohome
## Remove duplicate entries
setopt pushdignoredups
## This reverts the +/- operators.
setopt pushdminus

# Alias definitions
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi
