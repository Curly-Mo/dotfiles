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
  _alternative _command_names
}
compdef _now now

recommand() {
  local lastcmd=$(fc -l -1)
  local lastargs=${${(z)lastcmd}:2}
  local cmd=$1
  print -z $cmd $lastargs
}

ppgrep() {
  pgrep -f "$@" | xargs ps -efp;
}

