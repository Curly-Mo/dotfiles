HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt HIST_IGNORE_DUPS
setopt appendhistory autocd extendedglob
unsetopt beep
bindkey -v

zstyle :compinstall filename '/home/colin/.zshrc'
autoload -Uz compinit promptinit colors vcs_info
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
    source ~/.aliases
fi

# Custom prompt
if [ -f ~/.zsh_theme ]; then
    source ~/.zsh_theme
fi

# Show current git branch in prompt.
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}  


#Store last directory
declare -r PROMPT_COMMAND='printf %s "$PWD" > ~/.lastdir'
#Init in last directory
cd "$(<~/.lastdir)"

# Python
export PYTHONSTARTUP=/home/colin/.pystartup
#Python Virtual Environment
export VIRTUAL_ENV_DISABLE_PROMPT='1'
source ~/.virtualenv/personal/bin/activate

#Less for viewing wide queries
export PAGER=less
export LESS="-iMSx4 -FX"
