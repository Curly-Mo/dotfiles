export VISUAL="vim"
export EDITOR="vim"
export MANPAGER='vim +Man!'
if hash nvim 2>/dev/null; then
    export VISUAL="nvim"
    export EDITOR="nvim"
    export MANPAGER='nvim +Man!'
fi
# export MANPAGER="page -C -e 'au User PageDisconnect sleep 100m|%y p|enew! |bd! #|pu p|set ft=man'"
# export PAGER="page -q 90000"

export XDG_CONFIG_HOME="$HOME/.config"

# nvim-conf
export NVIM_CONF_DIR="$XDG_CONFIG_HOME/nvim"
export NVIM_LUA_DIR="$XDG_CONFIG_HOME/nvim/lua"
# dotfiles
export DOTFILES_DIR="$HOME/dotfiles"
export DOTS_DIR="$DOTFILES_DIR"
export DOT_DIR="$DOTFILES_DIR"
# syncthing
export SYNC_DIR="$HOME/sync"
export SYNC="$SYNC_DIR"
# notes
export NOTES_DIR="$SYNC_DIR/notes"
export NOTES_FZFVIM_DIR="$SYNC_DIR/notes/fzfvim"
export NOTES_CLI_HOME="$SYNC_DIR/notes/notescli"
export TODO_DIR_PERSONAL="$SYNC_DIR/notes/todo"
export TODOTXT_CFG_FILE_PERSONAL="$TODO_DIR_PERSONAL/.config/config"
export TODO_DIR_WORK="$SYNC_DIR/notes/todo/work"
export TODOTXT_CFG_FILE_WORK="$TODO_DIR_WORK/.config/config"
export TODO_DIR="$TODO_DIR_PERSONAL"
export TODO_FILE="$TODO_DIR/todo.txt"
export DONE_FILE="$TODO_DIR/done.txt"
export TODO_ACTIONS_DIR="$TODO_DIR/actions.d"
export TODOTXT_CFG_FILE="$TODO_DIR/.config/config"
# workspace
export WORK_DIR="$HOME/workspace"
export PERSONAL_DIR="$HOME/personal"
export PACKAGES_DIR="$HOME/packages"
# various
export DOWNLOADS_DIR="$HOME/downloads"
export DL="$DOWNLOADS_DIR"

# ssh-agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# ruby
export GEM_HOME="$(gem env user_gemhome)"
export PATH="$PATH:$GEM_HOME/bin"

# cargo
export PATH="$PATH:$HOME/.cargo/bin"
# go
export PATH="$PATH:$HOME/go/bin"

# ripgrep
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/.ripgreprc"
