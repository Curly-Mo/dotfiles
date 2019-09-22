# Set this when ready to move
# ZDOTDIR=$HOME/config/zsh
typeset -U path
path=(~/bin $path)
path=(/home/colin/.local/bin $path)
path=(/usr/local/opt/coreutils/libexec/gnubin $path)
manpath=(/usr/local/opt/coreutils/libexec/gnuman $manpath)
