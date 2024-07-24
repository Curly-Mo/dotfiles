export VISUAL="vim"
export EDITOR="vim"
export MANPAGER='nvim +Man!'
# export MANPAGER="page -C -e 'au User PageDisconnect sleep 100m|%y p|enew! |bd! #|pu p|set ft=man'"
# export PAGER="page -q 90000"

export PATH="$PATH:$HOME/.cargo/bin"

export NOTES_CLI_HOME="$HOME/sync/notes/notescli"
export TODO_DIR="$HOME/sync/notes/todo"
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
