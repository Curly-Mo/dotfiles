# accept and run
# zstyle ':fzf-tab:*' print-query alt-space # unbind from alt-enter
# zstyle ':fzf-tab:*' accept-line alt-enter
zstyle ':fzf-tab:*' accept-line ctrl-x
zstyle ':fzf-tab:*' continuous-trigger 'right'
zstyle ':fzf-tab:*' continuous-trigger 'tab'

# fzf-command
# zstyle ':fzf-tab:*' fzf-command fzf
# zstyle ':fzf-tab:*' fzf-flags fzf
# fzf-preview
zstyle ':fzf-tab:*' fzf-preview "(highlight -O ansi --line-range 0-200 {} 2> /dev/null || bat --force-colorization --line-range 0:200 --plain {-1} || tree -C {}) 2> /dev/null | head -200"

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'tree -C ${(Q)realpath} | head -200'
# switch group using `<` and `>`
# zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:*' switch-group ',' '.'

# give a preview of commandline arguments when completing `kill`
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap

# show systemd unit status
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

# show file contents
# zstyle ':fzf-tab:complete:*:*' fzf-preview 'bat --color=always --plain ${(Q)realpath}'
zstyle ':fzf-tab:complete:*:*' fzf-preview '(highlight -O ansi --line-range 0-200 $realpath || bat --color=always --line-range :200 --plain ${(Q)realpath} || tree -C $realpath) 2> /dev/null | head -200'

# environment variable
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' \
  fzf-preview 'echo ${(P)word}'

# git
zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview \
  'git diff $word | delta'
zstyle ':fzf-tab:complete:git-log:*' fzf-preview \
  'git log --color=always $word'
zstyle ':fzf-tab:complete:git-help:*' fzf-preview \
  'git help $word | bat -plman --color=always'
zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
  'case "$group" in
  "commit tag") git show --color=always $word ;;
  *) git show --color=always $word | delta ;;
  esac'
zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
  'case "$group" in
  "modified file") git diff $word | delta ;;
  "recent commit object name") git show --color=always $word | delta ;;
  *) git log --color=always $word ;;
  esac'

# commands
# zstyle ':fzf-tab:complete:-command-:*' fzf-preview ¦ '(out=$(tldr --color always "$word") 2>/dev/null && echo $out) || (out=$(MANWIDTH=$FZF_PREVIEW_COLUMNS man "$word") 2>/dev/null && echo $out) || (out=$(which "$word") && echo $out) || echo "${(P)word}"'

# fix man
zstyle ':fzf-tab:complete:(\\|)run-help:*' fzf-preview 'run-help $word'
zstyle ':fzf-tab:complete:(\\|*/|)man:*' fzf-preview 'man $word'
# looks
zstyle ':fzf-tab:complete:*' fzf-pad 4
# zstyle ':fzf-tab:complete:*' fzf-flags --tiebreak=index

# use fd
# _files() {
#   # fd --hidden --exclude .git --type=f | {
#   fd --hidden --exclude .git --type=f | proximity-sort . | {
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
# second attempt to use fd
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
