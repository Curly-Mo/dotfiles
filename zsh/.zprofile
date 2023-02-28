export VISUAL="vim"
export EDITOR="vim"
export MANPAGER='nvim +Man!'
# export MANPAGER="page -C -e 'au User PageDisconnect sleep 100m|%y p|enew! |bd! #|pu p|set ft=man'"
# export PAGER="page -q 90000"

export PATH="$HOME/.cargo/bin:$PATH"

export NOTES_CLI_HOME="$HOME/sync/Notes/notescli"
export TODO_DIR="$HOME/sync/Notes/todo"
export TODO_FILE="$TODO_DIR/todo.txt"
export DONE_FILE="$TODO_DIR/done.txt"

export XDG_CONFIG_HOME="$HOME/.config"

# ssh-agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
