export VISUAL="vim"
export EDITOR="vim"

export PATH="$HOME/.cargo/bin:$PATH"

export NOTES_CLI_HOME="$HOME/sync/Notes/notescli"
export TODO_DIR="$HOME/sync/Notes/todo"
export TODO_FILE="$TODO_DIR/todo.txt"
export DONE_FILE="$TODO_DIR/done.txt"

# fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --color=always'
export FZF_DEFAULT_OPTS='--height 50% --border --ansi'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--height 50% --border --preview '(highlight -O ansi -l {} 2> /dev/null || bat --color=always --plain {-1} || tree -C {}) 2> /dev/null | head -200'"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export FZF_COMPLETION_OPTS='--border --info=inline'
