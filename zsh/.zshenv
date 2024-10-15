# Set this when ready to move
# ZDOTDIR=$HOME/config/zsh

# init paths
typeset -U path manpath

# path
path=(
  ~/bin
  ~/.local/bin
  "${path[@]}"
  /opt/brew/bin
)

# manpath
manpath=(
  "${manpath[@]}"
)
