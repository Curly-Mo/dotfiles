# accept and run
zstyle ':fzf-tab:*' print-query alt-enter
# zstyle ':fzf-tab:*' print-query alt-space # unbind from alt-enter
# zstyle ':fzf-tab:*' accept-line alt-enter
zstyle ':fzf-tab:*' accept-line ctrl-x
zstyle ':fzf-tab:*' continuous-trigger 'right'
zstyle ':fzf-tab:*' continuous-trigger 'tab'

# # fzf-command
# # zstyle ':fzf-tab:*' fzf-command fzf
# # zstyle ':fzf-tab:*' fzf-flags fzf
# # fzf-preview
# zstyle ':fzf-tab:*' fzf-preview "(bat --color=always --line-range :200 --plain ${(Q)realpath} || highlight --out-format=ansi --line-range 0-200 $realpath || eza --tree --level=4 --all --color=always $realpath) 2> /dev/null | head -200"

# # tmux
# # zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
# zstyle ':fzf-tab:complete:cd:*' popup-pad 30 0
# zstyle ':fzf-tab:*' popup-min-size 50 8

# # looks
# # NOTE: don't use escape sequences here, fzf-tab will ignore them
# zstyle ':fzf-tab:*' fzf-min-height '20'

# set descriptions format to enable group support
# NOTE: don't use escape sequences here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'
# zstyle ':fzf-tab:*' switch-group ',' '.'

# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no

# previews
# # show file contents
# # zstyle ':fzf-tab:complete:*:*' fzf-preview 'bat --color=always --plain ${(Q)realpath}'
# zstyle ':fzf-tab:complete:*:*' fzf-preview '(bat --color=always --line-range :200 --plain ${(Q)realpath} || highlight --out-format=ansi --line-range 0-200 $realpath || eza --tree --level=4 --all --color=always $realpath) 2> /dev/null | head -200'

# # preview directory's content with eza when completing cd
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --tree --level 4 --all --color=always $realpath'
# # zstyle ':fzf-tab:complete:cd:*' fzf-preview 'tree -C ${(Q)realpath} | head -200'

# zstyle ':fzf-tab:complete:*' fzf-preview "$FZF_PREVIEW_CMD"

zstyle ':fzf-tab:complete:*:*' fzf-preview \
  '(bat --color=always --line-range 0:200 --plain ${realpath} 2> /dev/null || (eza --tree --level=5 --all --color=always ${realpath})) 2> /dev/null | head -200'
zstyle ':fzf-tab:complete:*' fzf-flags \
  --height=70% --border --ansi --info=inline --algo=v2 --color='hl:67,hl:italic' \
  --bind 'ctrl-a:toggle-all' --bind 'ctrl-space:toggle+down' --bind 'tab:replace-query+down' --bind 'shift-tab:backward-kill-word' --bind 'right:replace-query+down' --bind 'left:backward-kill-word' --bind 'change:first' --bind 'ctrl-f:jump' --bind 'ctrl-d:delete-char/eof+clear-query' --bind 'alt-j:down' --bind 'alt-k:up' --bind '?:toggle-preview' \
  --preview-window=right,45% 
zstyle ':fzf-tab:complete:*:*' fzf-flags \
  --height=70% --border --ansi --info=inline --algo=v2 --color='hl:67,hl:italic' \
  --bind 'ctrl-a:toggle-all' --bind 'ctrl-space:toggle+down' --bind 'tab:replace-query+down' --bind 'shift-tab:backward-kill-word' --bind 'right:replace-query+down' --bind 'left:backward-kill-word' --bind 'change:first' --bind 'ctrl-f:jump' --bind 'ctrl-d:delete-char/eof+clear-query' --bind 'alt-j:down' --bind 'alt-k:up' --bind '?:toggle-preview' \
  --preview-window=right,45% 
 

# # give a preview of commandline arguments when completing `kill`
# zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
# zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
# zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap

# # show systemd unit status
# zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

# # environment variable
# zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' \
#   fzf-preview 'echo ${(P)word}'

# git
# zstyle ':fzf-tab:complete:
#   'git diff $word | delta'
# zstyle ':fzf-tab:complete:git-log:*' fzf-preview \
#   'git log --color=always $word'
# zstyle ':fzf-tab:complete:git-help:*' fzf-preview \
#   'git help $word | bat -plman --color=always'
# zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
#   'case "$group" in
#   "commit tag") git show --color=always $word ;;
#   *) git show --color=always $word | delta ;;
#   esac'
# zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
#   'case "$group" in
#   "modified file") git diff $word | delta ;;
#   "recent commit object name") git show --color=always $word | delta ;;
#   *) git log --color=always $word ;;
#   esac'
# # disable sort when completing `git checkout`
# zstyle ':completion:*:git-checkout:*' sort false
# zstyle ':fzf-tab:complete:git-checkout:argument-rest' fzf-flags \
#   --height=70% --border --ansi --info=inline --algo=v2 --color='hl:67,hl:italic' \
#   --bind 'ctrl-a:toggle-all' --bind 'ctrl-space:toggle+down' --bind 'tab:replace-query+down' --bind 'shift-tab:backward-kill-word' --bind 'right:replace-query+down' --bind 'left:backward-kill-word' --bind 'change:first' --bind 'ctrl-f:jump' --bind 'ctrl-d:delete-char/eof+clear-query' --bind 'alt-j:down' --bind 'alt-k:up' --bind '?:toggle-preview' \
#   --preview-window=right,45% 

# commands
# zstyle ':fzf-tab:complete:-command-:*' fzf-preview ¦ '(out=$(tldr --color always "$word") 2>/dev/null && echo $out) || (out=$(MANWIDTH=$FZF_PREVIEW_COLUMNS man "$word") 2>/dev/null && echo $out) || (out=$(which "$word") && echo $out) || echo "${(P)word}"'

# # fix man
# zstyle ':fzf-tab:complete:(\\|)run-help:*' fzf-preview 'run-help $word'
# zstyle ':fzf-tab:complete:(\\|*/|)man:*' fzf-preview 'man $word'
# # looks
# zstyle ':fzf-tab:complete:*' fzf-pad 4
# # zstyle ':fzf-tab:complete:*' fzf-flags --tiebreak=index

