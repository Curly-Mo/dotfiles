# Set this when ready to move
# ZDOTDIR=$HOME/.config/zsh

# init paths
typeset -U path fpath manpath cdpath
typeset -UT INFOPATH infopath
typeset -UT XDG_DATA_DIRS xdg_data_dirs
typeset -UT XDG_CONFIG_DIRS xdg_config_dirs

# path
path=(
  ~/bin
  ~/.local/bin
  "${path[@]}"
)

# fpath
fpath=(
  "${fpath[@]}"
)

# manpath
manpath=(
  "${manpath[@]}"
)

# infopath
infopath=(
  "${infopath[@]}"
)

# cdpath
cdpath=(
  "${cdpath[@]}"
)
