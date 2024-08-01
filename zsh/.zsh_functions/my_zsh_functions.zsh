up() {
  if [ -z "$1" ]; then
    echo "Usage: up [directory]";
    return
  fi
  local up=$1
  cd "${PWD/\/$up\/*//$up}"
}
_up() {
  local pwd=${PWD}
  local up_dirs=(${(s:/:)pwd})
  _alternative "dirs:directory:($up_dirs)"
}
compdef _up up

# Jump down to first matching subdirectory
down() {
  if [ -z "$1" ]; then
    echo "Usage: down [directory]";
    return 1
  else
    cd (^target/)#$@([1]/^D)
  fi  
}
_down() {
  local pwd=${PWD}
  local down_dirs=((^target/)#(/^D))
  local down_dirs=(${down_dirs##(*/_*)})
  local down_dir_names=(${${down_dirs%%(/)}##(*/)})
  local down_dir_names=(${^down_dir_names}/)
  _alternative "dirs:directory:($down_dir_names $down_dirs)"
}
compdef _down down

attach() {
  if [[ -z "$TMUX" ]] ;then
    ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
    if [[ -z "$ID" ]] ;then # if not available create a new one
      tmux new-session
    else
      tmux attach-session -t "$ID" # if available attach to it
    fi
  fi
}

# fd() {
#   local dir
#   dir=$(find ${1:-.} -path '*/\.*' -prune \
#                   -o -type d -print 2> /dev/null | fzf +m) &&
#   cd "$dir"
# }

now() {
  local lastcmd=$(fc -l -1)
  local lastargs=${${(z)lastcmd}:2}
  local cmd="$@"
  print -z $cmd $lastargs
}
_now() {
  # _alternative _command_names
  local context state state_descr line
  _arguments -C ':any:_command_names -e'
  # _arguments -C '*::_command_names->cmd' 
  # case "$state" in
  #     cmd)
  #         local -a music_files
  #         music_files=( Music/**/*.{mp3,wav,flac,ogg} )
  #         _arguments -C 'wut:any:_files'
  #         ;;
  # esac
}
compdef _now now

# recommand() {
#   local lastcmd=$(fc -l -1)
#   local lastargs=${${(z)lastcmd}:2}
#   local cmd="$@"
#   print -z $cmd $lastargs
# }
alias recommand="now"

# Fix last n args to previous command
fix() {
  local lastcmd=$(fc -l -1)
  local args=$@
  local n_args=${1:-1}
  local other_args="${args:2}"
  local lastcmd=${${(z)lastcmd}:1}
  local lastcmd_minus_nargs=${${(z)lastcmd}:0:-${n_args}}
  print -z $lastcmd_minus_nargs $other_args ""
}
_fix() {
  local lastcmd=$history[$[HISTCMD-1]]
  local cmdlen=${#${(z)lastcmd}[@]}
  lastcmd=${${(z)lastcmd}:0:1}

  _arguments \
    "1:nargs:_numbers -l 0 -m $cmdlen -d 1" \
    "*::passthrough:$_comps[$lastcmd]"
}
compdef _fix fix

# Replace last args to previous command
with() {
  local lastcmd=$(fc -l -1)
  local args=$@
  local n_args=$#
  local lastcmd=${${(z)lastcmd}:1}
  local lastcmd_minus_nargs=${${(z)lastcmd}:0:-${n_args}}
  print -z $lastcmd_minus_nargs $args
}
_with() {
  local lastcmd=$history[$[HISTCMD-1]]
  lastcmd=${${(z)lastcmd}:0:1}
  $_comps[$lastcmd]
}
compdef _with with

ppgrep() {
  pgrep -f "$@" | xargs ps -efp;
}

# Open a note
note() {
  local args=$@
  local n_args=$#
  local notes_dir=$NOTES_FZFVIM_DIR
  local filename="${args%.*}"
  # strip off the extension
  local filename="${filename%.*}"

  $EDITOR ${notes_dir}/${filename}.md
}
_note() {
  local notes_dir=$NOTES_FZFVIM_DIR
  _files -W $notes_dir -g '*.md(:r)'
}
compdef _note note
