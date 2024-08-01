function _fzf_tab_config() {
  # accept and run
  # zstyle ':fzf-tab:*' print-query alt-space # unbind from alt-enter
  # zstyle ':fzf-tab:*' accept-line alt-enter
  zstyle ':fzf-tab:*' accept-line ctrl-x
  zstyle ':fzf-tab:*' continuous-trigger 'right'
  zstyle ':fzf-tab:*' continuous-trigger 'tab'
  # disable sort when completing `git checkout`
  zstyle ':completion:*:git-checkout:*' sort false
  # set list-colors to enable filename colorizing
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
  # preview directory's content with exa when completing cd
  # zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
  zstyle ':fzf-tab:complete:cd:*' fzf-preview 'tree -C ${(Q)realpath} | head -200'
  # set descriptions format to enable group support
  zstyle ':completion:*:descriptions' format '[%d]'
  # switch group using `,` and `.`
  zstyle ':fzf-tab:*' switch-group ',' '.'
  # give a preview of commandline arguments when completing `kill`
  zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
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
}
