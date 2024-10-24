# :fzf-tab:complete:git-checkout:argument-rest --height=70% --border --ansi --info=inline --algo=v2 --color='hl:67,hl:italic' --bind 'ctrl-a:toggle-all' --bind 'ctrl-space:toggle+down' --bind 'tab:replace-query+down' --bind 'shift-tab:backward-kill-word' --bind 'right:replace-query+down' --bind 'left:backward-kill-word' --bind 'change:first' --bind 'ctrl-f:jump' --bind 'ctrl-d:delete-char/eof+clear-query' --bind 'alt-j:down' --bind 'alt-k:up' --bind '?:toggle-preview' --preview-window=right,45% 
case $group in
'modified file')
  git diff $word | delta
  ;;
'recent commit object name')
  git show --color=always $word | delta
  ;;
*)
  git log --color=always $word
  ;;
esac
