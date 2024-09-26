# keys
# bindkey '^I' fzf-completion
# bindkey "^Y" $fzf_default_completion
# bindkey "^[c" fzf-cd-widget
bindkey "^[j" fzf-cd-widget
# bindkey "^T" fzf-file-widget
bindkey "^[t" fzf-file-widget
bindkey "^R" history-incremental-search-backward
bindkey -M vicmd "^R" history-incremental-search-backward
bindkey "^E" fzf-history-widget
bindkey -M vicmd "^E" fzf-history-widget

# config
export FZF_FILE_PREVIEW_CMD="(bat --color=always --line-range 0:200 --plain {-1} 2> /dev/null || highlight --out-format=ansi --line-range 0-200 {} )"
export FZF_DIR_PREVIEW_CMD="(eza --tree --level=5 --all --color=always {})"
export FZF_FALLBACK_PREVIEW_CMD="(highlight --out-format=ansi --syntax=sh)"
export FZF_PREVIEW_CMD="($FZF_FILE_PREVIEW_CMD 2> /dev/null || $FZF_DIR_PREVIEW_CMD 2> /dev/null || $FZF_FALLBACK_PREVIEW_CMD) | head -200"
export FZF_PREVIEW_OPTS="--preview-window=right,45%"

export LS_TIME_SORT="atime"
export LS_SORT_AND_COLOR_CMD="/bin/ls --directory --sort=time --time=$LS_TIME_SORT --color=always"
export FD_COMMAND='fd --hidden --follow --exclude=.git --color=always --max-depth 12 --strip-cwd-prefix'
export FD_FILES_COMMAND="${FD_COMMAND} --type=f"
export FD_DIR_COMMAND="${FD_COMMAND} --type=d"
export SORTED_FD_COMMAND="${FD_COMMAND} --exec-batch $LS_SORT_AND_COLOR_CMD"
export SORTED_FD_FILES_COMMAND="${FD_FILES_COMMAND} --exec-batch $LS_SORT_AND_COLOR_CMD"
export SORTED_FD_DIR_COMMAND="${FD_DIR_COMMAND} --exec-batch $LS_SORT_AND_COLOR_CMD"
export RG_COMMAND='rg --glob="!*.git*" --max-depth=12 --sort=accessed --color=always'
export RG_FILES_COMMAND="${RG_COMMAND} --files"
export FZF_COMMAND="${FD_COMMAND}"
# export FZF_COMMAND="${SORTED_FD_COMMAND}"
# export FZF_COMMAND="${RG_COMMAND}"
# export FZF_FILES_COMMAND="${FD_FILES_COMMAND}"
export FZF_FILES_COMMAND="${SORTED_FD_FILES_COMMAND}"
# export FZF_FILES_COMMAND="${RG_FILES_COMMAND}"
# export FZF_DIR_COMMAND="${FD_DIR_COMMAND}"
export FZF_DIR_COMMAND="${SORTED_FD_DIR_COMMAND}"
# export FZF_DIR_COMMAND="${RG_DIR_COMMAND}"
export FZF_DEFAULT_COMMAND="${FZF_COMMAND}"

# export FZF_TIEBREAK_OPTS_OPTS="--tiebreak=index,length"
export FZF_TIEBREAK_OPTS_OPTS="--tiebreak=index"

FZF_BINDINGS_OPTS="--bind 'ctrl-a:toggle-all' --bind 'ctrl-space:toggle+down' --bind 'tab:replace-query+down' --bind 'shift-tab:backward-kill-word' --bind 'right:replace-query+down' --bind 'left:backward-kill-word' --bind 'change:first' --bind 'ctrl-f:jump' --bind 'ctrl-d:delete-char/eof+clear-query' --bind 'alt-j:down' --bind 'alt-k:up' --bind '?:toggle-preview'"
FZF_COLOR_OPTS="--color='hl:67,hl:italic'"
export FZF_DEFAULT_OPTS="--height=70% --border --ansi --info=inline --algo=v2 ${FZF_BINDINGS_OPTS} ${FZF_COLOR_OPTS}"
export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} $FZF_TIEBREAK_OPTS_OPTS"
# always have a preview
export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} --preview '${FZF_PREVIEW_CMD}' ${FZF_PREVIEW_OPTS}"
# use tmux popup
# export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} --tmux 100%,60%"

FZF_CTRL_R_PREVIEW_CMD="echo {} | highlight --syntax=sh --out-format=ansi"
FZF_CTRL_R_PREVIEW_OPTS="--preview '$FZF_CTRL_R_PREVIEW_CMD' --preview-window down:4:wrap"
export FZF_CTRL_R_OPTS="--exact --bind 'ctrl-e:up' --bind 'ctrl-E:down' --height=80% $FZF_CTRL_R_PREVIEW_OPTS"

export FZF_CTRL_T_COMMAND="${FZF_FILES_COMMAND}"
export FZF_CTRL_T_OPTS="--select-1 --exit-0 --preview '${FZF_FILE_PREVIEW_CMD}' $FZF_TIEBREAK_OPTS_OPTS"

export FZF_ALT_C_COMMAND="${FZF_DIR_COMMAND}"
# export FZF_ALT_C_OPTS="${FZF_DEFAULT_OPTS} --select-1 --exit-0 --preview 'tree -C {} | head -200' --bind 'alt-c:down' --bind 'alt-C:up' --bind 'tab:down' --bind 'shift-tab:up'"
export FZF_ALT_C_OPTS="--select-1 --exit-0 --preview 'eza --tree --level=5 --all --color=always {}' --bind 'alt-c:down' --bind 'alt-C:up' --preview '${FZF_DIR_PREVIEW_CMD}' $FZF_TIEBREAK_OPTS_OPTS"
FZF_COMPLETION_BINDINGS_OPTS=""
export FZF_COMPLETION_OPTS="--select-1 --exit-0 ${FZF_COMPLETION_BINDINGS_OPTS}"


FZF_COMPLETION_TRIGGER=''

FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir"
FZF_COMPLETION_PATH_COMMANDS="ls ll"
FZF_COMPLETION_FILE_COMMANDS="vi vim nvim v cat bat"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  local cmd=( $(echo $FZF_COMMAND) )
  "${cmd[@]}"
}
_fzf_compgen_dir() {
  local cmd=( $(echo $FZF_DIR_COMMAND) )
  "${cmd[@]}"
}
_fzf_compgen_file() {
  local cmd=( $(echo $FZF_FILES_COMMAND) )
  "${cmd[@]}"
}

_fzf_file_completion() {
  __fzf_generic_path_completion "$1" "$2" _fzf_compgen_file \
    "-m" "" " "
}

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    export|unset) fzf --preview "eval 'echo \$'{} | $FZF_FALLBACK_PREVIEW_CMD" "$@" ;;
    ssh)          fzf --preview "dig {}" "$@" ;;
    # up)           fzf --preview "fd --hidden --follow --type d --full-path {} / -1 | eza --stdin --tree --level 2 --all --color=always" "$@" ;;
    # down)         fzf --preview "fd --hidden --follow --type d --full-path {} . -1 | eza --stdin --tree --level 4 --all --color=always" "$@" ;;
    *)            fzf "$@" ;;
  esac
  # case "$command" in
  #   cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
  #   export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
  #   ssh)          fzf --preview 'dig {}'                   "$@" ;;
  #   *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
  # esac
}

# # # exclude commands from completion
# _fzf_complete_notrigger() {
#   FZF_COMPLETION_TRIGGER='**' _fzf_complete -- "$@"
# }
# _fzf_complete_vim() {
#   _fzf_complete_notrigger "$@"
# }


# export FZF_COMPLETION_TRIGGER=''
# # Super hack to only notrigger complete for certain commands
# # rename fzf-completion to _fzf-completion
# # eval "`declare -f fzf-completion | sed '1s/.*/_&/'`"
# functions -c fzf-completion fzf-completion-orig
# _fzf-completion () {
#   d_cmds=(${=FZF_COMPLETION_DIR_COMMANDS:-cd pushd rmdir})
#   f_cmds=(${=FZF_COMPLETION_FILE_COMMANDS:-vim nvim cat rm})
#   p_cmds=(${=FZF_COMPLETION_PATH_COMMANDS:-ls})
#   cmd=$(__fzf_extract_command "$LBUFFER")
#   cmd=$(__fzf_extract_command $(whence $cmd))
#   if [ ${d_cmds[(i)$cmd]} -le ${#d_cmds} ]; then
#     FZF_COMPLETION_TRIGGER='' fzf-completion-orig
#   elif [ ${f_cmds[(i)$cmd]} -le ${#f_cmds} ]; then
#     FZF_COMPLETION_TRIGGER='' fzf-completion-orig
#   elif [ ${p_cmds[(i)$cmd]} -le ${#p_cmds} ]; then
#     FZF_COMPLETION_TRIGGER='' fzf-completion-orig
#   else
#     fzf-completion-orig
#   fi
# }
# functions[fzf-completion]=$functions[_fzf-completion]

# new hack to exclude git only
# FZF_COMPLETION_TRIGGER=''
# _fzf_complete_git() {
#   ARGS="$@"
#   local branches
#   branches=$(git branch -vv --all)
#   if [[ $ARGS == 'git co'* ]]; then
#     _fzf_complete --reverse --multi -- "$@" < <(
#       echo $branches
#     )
#   else
#     eval "zle ${fzf_default_completion:-expand-or-complete}"
#   fi
# }
# _fzf_complete_git_post() {
#   awk '{print $1}'
# }


# # another hack https://github.com/Aloxaf/fzf-tab/issues/65
# _files() {
#   # fd --hidden --exclude .git --type=f | {
#     while read line; do
#       compadd -f -- $line
#     done
#   }
# }
# _cd() {
#   fd --hidden --exclude .git --type=d | proximity-sort . | {
#     while read line; do
#       compadd -f -- $line
#     done
#   }
#   # local dirs=($(fd --hidden --exclude .git --type=d | proximity-sort .))
#   # compadd -a -f dirs
# }
# second hack attempt
# _files() {
#   compadd -f -- "$(fd --hidden --exclude .git --follow --type=f | fzf)"
# }
# _cd() {
#   compadd -f -- "$(fd --hidden --exclude .git --follow --type=d | fzf)"
# }

# yet another awful hack
# autoload +X -Uz _files
# autoload +X -Uz _dirs
# autoload +X -Uz _path_files
# functions[_files_orig]=$functions[_files]
# functions[_cd_orig]=$functions[_cd]
# functions[_path_files_orig]=$functions[_path_files_orig]
# FZF_FILE_CMDS=(vim nvim cat v)
# _files() {
#   if (( $FZF_FILE_CMDS[(I)$words[1]] )); then
#     compadd -f -- "$(fd --hidden --follow --exclude .git --color=always --max-depth 12 --type=f | fzf --preview 'bat --force-colorization --line-range 0:200 --plain {-1} 2> /dev/null || highlight -O ansi --line-range 0-200 {}')"
#   else
#     _files_orig
#   fi
# }
# FZF_DIR_CMDS=(cd pushd rmdir)
# _cd() {
#   if (( $FZF_DIR_CMDS[(I)$words[1]] )); then
#     compadd -f -- "$(fd --hidden --follow --exclude .git --color=always --max-depth 12 --type=d | fzf --preview 'tree -C {} | head -200')"
#   else
#     _cd_orig
#   fi
# }
# FZF_PATH_CMDS=(ls)
# _path_files() {
#   if (( $FZF_PATH_CMDS[(I)$words[1]] )); then
#     compadd -f -- "$(fd --hidden --follow --exclude .git --color=always --max-depth 12 | fzf --preview 'bat --force-colorization --line-range 0:200 --plain {-1} 2> /dev/null || tree -C {} 2> /dev/null | head -200 || highlight -O ansi --line-range 0-200 {}')"
#   else
#     _path_files_orig
#   fi
# }

# custom keybinds
fzf-edit-file-widget() {
  local cmd=( $(echo $FZF_FILES_COMMAND) )
  local result=$(${cmd[@]} | fzf)
  local ret=$?
  if [[ -n $result ]]
  then
    $EDITOR $result
    ret=$?
  fi
  zle reset-prompt
  return $ret
}
zle -N fzf-edit-file-widget
bindkey "^P" fzf-edit-file-widget
bindkey "^[p" fzf-edit-file-widget
bindkey "^V" fzf-edit-file-widget
bindkey -M vicmd "^P" fzf-edit-file-widget
bindkey -M vicmd "^[p" fzf-edit-file-widget
bindkey -M vicmd "^V" fzf-edit-file-widget


# custom override of fzf-completion https://github.com/junegunn/fzf/pull/1299
# declare -A -x FZF_PER_CMD_COMPLETION_TRIGGERS
# FZF_PER_CMD_COMPLETION_TRIGGERS[man]="**"
# export FZF_PER_CMD_COMPLETION_TRIGGERS_EXPORT=$(declare -p FZF_PER_CMD_COMPLETION_TRIGGERS)
fzf-completion () {
	local tokens cmd prefix trigger tail matches lbuf d_cmds
	setopt localoptions noshwordsplit noksh_arrays noposixbuiltins
	tokens=(${(z)LBUFFER}) 
	if [ ${#tokens} -lt 1 ]
	then
		zle ${fzf_default_completion:-expand-or-complete}
		return
	fi
	cmd=$(__fzf_extract_command "$LBUFFER") 

  # Use a per-command completion trigger if available. Otherwise, fall
  # back to $FZF_COMPLETION_TRIGGER.
  source <(printf "%s" "$FZF_PER_CMD_COMPLETION_TRIGGERS_EXPORT")
  trigger=${FZF_PER_CMD_COMPLETION_TRIGGERS[$cmd]-${FZF_COMPLETION_TRIGGER-'**'}}

	[ -z "$trigger" -a ${LBUFFER[-1]} = ' ' ] && tokens+=("") 
	if [[ ${LBUFFER} = *"${tokens[-2]-}${tokens[-1]}" ]]
	then
		tokens[-2]="${tokens[-2]-}${tokens[-1]}" 
		tokens=(${tokens[0,-2]}) 
	fi
	lbuf=$LBUFFER 
	tail=${LBUFFER:$(( ${#LBUFFER} - ${#trigger} ))} 
	if [ ${#tokens} -gt 1 -a "$tail" = "$trigger" ]
	then
		d_cmds=(${=FZF_COMPLETION_DIR_COMMANDS-cd pushd rmdir}) 
		p_cmds=(${=FZF_COMPLETION_PATH_COMMANDS-ls}) 
		f_cmds=(${=FZF_COMPLETION_FILE_COMMANDS-vi vim cat}) 
		[ -z "$trigger" ] && prefix=${tokens[-1]}  || prefix=${tokens[-1]:0:-${#trigger}} 
		if [[ $prefix = *'$('* ]] || [[ $prefix = *'<('* ]] || [[ $prefix = *'>('* ]] || [[ $prefix = *':='* ]] || [[ $prefix = *'`'* ]]
		then
			return
		fi
		[ -n "${tokens[-1]}" ] && lbuf=${lbuf:0:-${#tokens[-1]}} 
		if eval "type _fzf_complete_${cmd} > /dev/null"
		then
			prefix="$prefix" eval _fzf_complete_${cmd} ${(q)lbuf}
			zle reset-prompt
		elif [ ${d_cmds[(i)$cmd]} -le ${#d_cmds} ]
		then
			_fzf_dir_completion "$prefix" "$lbuf"
		elif [ ${p_cmds[(i)$cmd]} -le ${#p_cmds} ]
		then
			_fzf_path_completion "$prefix" "$lbuf"
		elif [ ${f_cmds[(i)$cmd]} -le ${#f_cmds} ]
		then
			_fzf_file_completion "$prefix" "$lbuf"
		else
			# _fzf_path_completion "$prefix" "$lbuf"
      zle ${fzf_default_completion:-expand-or-complete}
		fi
	else
		zle ${fzf_default_completion:-expand-or-complete}
	fi
}
