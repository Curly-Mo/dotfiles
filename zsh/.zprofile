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

# notes
export NOTES_DIR="$HOME/sync/notes"
export NOTES_FZFVIM_DIR="$HOME/sync/notes/fzfvim"
export NOTES_CLI_HOME="$HOME/sync/notes/notescli"
export TODO_DIR_PERSONAL="$HOME/sync/notes/todo"
export TODOTXT_CFG_FILE_PERSONAL="$TODO_DIR_PERSONAL/.config/config"
export TODO_DIR_WORK="$HOME/sync/notes/todo/work"
export TODOTXT_CFG_FILE_WORK="$TODO_DIR_WORK/.config/config"
export TODO_DIR="$TODO_DIR_PERSONAL"
export TODO_FILE="$TODO_DIR/todo.txt"
export DONE_FILE="$TODO_DIR/done.txt"
export TODO_ACTIONS_DIR="$TODO_DIR/actions.d"
export TODOTXT_CFG_FILE="$TODO_DIR/.config/config"

export XDG_CONFIG_HOME="$HOME/.config"

# ssh-agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# ruby
export GEM_HOME="$(gem env user_gemhome)"
export PATH="$PATH:$GEM_HOME/bin"

# cargo
export PATH="$PATH:$HOME/.cargo/bin"
# go
export PATH="$PATH:$HOME/go/bin"
