function _fzf_config() {
  # keys
  # bindkey '^I' fzf-completion
  # bindkey "^Y" $fzf_default_completion
  # bindkey "^[c" fzf-cd-widget
  # bindkey "^T" fzf-file-widget
  bindkey "^R" history-incremental-search-backward
  bindkey "^E" fzf-history-widget
  # config
  export FZF_PREVIEW_CMD="(highlight -O ansi --line-range 0-200 {} 2> /dev/null || bat --force-colorization --line-range 0:200 --plain {-1} || tree -C {}) 2> /dev/null | head -200"
  export FZF_COMMAND='fd --hidden --exclude .git --color=always --max-depth 12'
  # export FZF_DEFAULT_COMMAND="${FZF_COMMAND} | proximity-sort ."
  export FZF_DEFAULT_COMMAND="${FZF_COMMAND}"
  FZF_BINDINGS_OPTS="--bind 'ctrl-a:toggle-all' --bind 'ctrl-space:toggle+down' --bind 'tab:replace-query+down' --bind 'shift-tab:backward-kill-word' --bind 'right:replace-query+down' --bind 'left:backward-kill-word' --bind 'change:first' --bind 'ctrl-f:jump' --bind 'ctrl-d:delete-char/eof+clear-query'  --bind 'alt-j:down' --bind 'alt-k:up'"
  export FZF_DEFAULT_OPTS="--height 60% --border --ansi --info=inline --algo v2 ${FZF_BINDINGS_OPTS}"
  # export FZF_DEFAULT_OPTS="--height 50% --border --ansi --info=inline --algo v1 --tiebreak=index ${FZF_BINDINGS_OPTS}"
  FZF_CTRL_R_PREVIEW_OPTS="--preview 'echo {} | highlight --syntax sh -O ansi' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
  export FZF_CTRL_R_OPTS="--exact --bind 'ctrl-e:up' --bind 'ctrl-E:down' ${FZF_CTRL_R_PREVIEW_OPTS}"
  export FZF_CTRL_T_COMMAND="${FZF_COMMAND}"
  export FZF_CTRL_T_OPTS="${FZF_DEFAULT_OPTS} --select-1 --exit-0 --preview '${FZF_PREVIEW_CMD}'"
  # export FZF_ALT_C_COMMAND="${FZF_COMMAND} --type d | proximity-sort ."
  export FZF_ALT_C_COMMAND="${FZF_COMMAND} --type d"
  # export FZF_ALT_C_OPTS="${FZF_DEFAULT_OPTS} --select-1 --exit-0 --preview 'tree -C {} | head -200' --bind 'alt-c:down' --bind 'alt-C:up' --bind 'tab:down' --bind 'shift-tab:up'"
  export FZF_ALT_C_OPTS="${FZF_DEFAULT_OPTS} --select-1 --exit-0 --preview 'tree -C {} | head -200' --bind 'alt-c:down' --bind 'alt-C:up'"
  FZF_COMPLETION_BINDINGS_OPTS=""
  export FZF_COMPLETION_OPTS="${FZF_DEFAULT_OPTS} --select-1 --exit-0 --preview '${FZF_PREVIEW_CMD}' ${FZF_COMPLETION_BINDINGS_OPTS}"
  _fzf_compgen_path() {
    # fd --hidden --exclude .git --full-path --color=always . "$1" | proximity-sort .
    fd --hidden --exclude .git --color=always --max-depth 10 . "$1"
  }
  _fzf_compgen_dir() {
    # fd --hidden --exclude .git --full-path --color=always --type d . "$1" | proximity-sort .
    fd --hidden --exclude .git --color=always --max-depth 10 --type d . "$1"
  }
  export FZF_COMPLETION_TRIGGER=''
  # # Super hack to only notrigger complete for certain commands
  # # rename fzf-completion to _fzf-completion
  # eval "`declare -f fzf-completion | sed '1s/.*/_&/'`"
  # fzf-completion() {
  #   d_cmds=(${=FZF_COMPLETION_DIR_COMMANDS:-cd pushd rmdir})
  #   f_cmds=(${=FZF_COMPLETION_FILE_COMMANDS:-vim nvim cat rm})
  #   p_cmds=(${=FZF_COMPLETION_PATH_COMMANDS:-ls})
  #   cmd=$(__fzf_extract_command "$LBUFFER")
  #   cmd=$(__fzf_extract_command $(whence $cmd))
  #   if [ ${d_cmds[(i)$cmd]} -le ${#d_cmds} ]; then
  #     FZF_COMPLETION_TRIGGER='' _fzf-completion
  #   elif [ ${f_cmds[(i)$cmd]} -le ${#f_cmds} ]; then
  #     FZF_COMPLETION_TRIGGER='' _fzf-completion
  #   elif [ ${p_cmds[(i)$cmd]} -le ${#p_cmds} ]; then
  #     FZF_COMPLETION_TRIGGER='' _fzf-completion
  #   else
  #     _fzf-completion
  #   fi
  # }
}