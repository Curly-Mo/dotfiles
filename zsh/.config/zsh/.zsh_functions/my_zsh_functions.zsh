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
  # local up_dirnames=(${(s:/:)pwd})
  # local up_dirs=()
  # prev=''
  # for dirname in $up_dirnames; do
  #   prev="$prev/$dirname"
  #   up_dirs+=($prev)
  # done
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
    cd (^(target|.git)/)#$@(om,/,[1])
  fi  
}
_down() {
  local pwd=${PWD}
  local down_dirs=((^(target|.git)/)#(Om,/))
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

cmdargs() {
  local cmd="$@"
  local args=${${(z)cmd}:1}
  echo $args
}
lastcmd() {
  fc -ln -1
}
lastargs() {
  cmdargs $(lastcmd)
}
lastoutput() {
  local last_cmd=$(lastcmd)
  # eval "$last_cmd" | tail -n 1
  echo $(eval "$last_cmd")
}

# run a new command on the previous command's args
now() {
  local last_args=$(lastargs)
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

# run a command on the previous command's output
on() {
  local last_output=$(lastoutput)
  local cmd="$@"
  print -z $cmd $last_output
}
_on() {
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
compdef _on on

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

# Convenience wrapper around syntax highlighters like bat
colorize() {
  local cmd=(bat --style=plain --color=always --pager=never --language=sh)
  local fallback_cmd=(highlight --out-format=ansi --syntax=sh)

  local args=()
  while [ $# -gt 0 ]; do
    case "$1" in
      -l|--language) language="$2"; shift 2 ;;
      -l=*|--language=*) language="${1#*=}"; shift 1 ;;
      -s|--syntax) language="$2"; shift 2 ;;
      -s=*|--syntax=*) language="${1#*=}"; shift 1 ;;
      * ) args+=($1) ; shift 1 ;;
    esac
  done
  # echo $args[@]
  # echo $language

  local flags=( $(printf -- '%s\n' "$args" | grep -Eo '^--?.*') )
  local args=( $(printf -- '%s\n' "$args" | grep -Eo '^[^-].*') )

  setopt localoptions extended_glob
  declare -A bat_kwargs=()
  [ -n "${language}" ] && bat_kwargs[language]=${language}
  bat_opts=( ${(zkj| |)bat_kwargs/(#m)*/--$MATCH="$bat_kwargs[$MATCH]"} )
  declare -A highlight_kwargs=()
  [ -n "${language}" ] && highlight_kwargs[syntax]=${language}
  highlight_opts=( ${(zkj| |)highlight_kwargs/(#m)*/--$MATCH="$highlight_kwargs[$MATCH]"} )

  # Check to see if a pipe exists on stdin.
  if [ -p /dev/stdin ]; then
    ($cmd $bat_opts[@] $flags[@] - 2>/dev/null) || ($fallback_cmd $highlight_opts[@] $flags[@] -)
  else
    (echo $args[@] | $cmd $bat_opts[@] $flags[@]) 2>/dev/null || (echo $args[@] | $fallback_cmd $highlight_opts[@] $flags[@])
  fi
}

# Fork a repo with gh cli
fork() {
  local flags=( $(printf -- '%s\n' "$@" | grep -Eo '^--?.*') )
  local args=( $(printf -- '%s\n' "$@" | grep -Eo '^[^-].*') )
  local repo="$args[1]"
  local dir="$args[2]"
  local repo_name="${repo#*/}"
  repo_name="${repo_name%.git}"
  local dir_path=$(realpath ${dir:-$repo_name})

  gh repo fork --clone $@

  cd $dir_path

  echo
  echo $(colorize "cd $dir_path")
  echo $(colorize -l yaml "origin: $(git remote get-url origin)")
  echo $(colorize -l yaml "upstream: $(git remote get-url upstream)")
  echo $(colorize -l toml $(git status --long))
}
