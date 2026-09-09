# bash config

- Auto-attaches to an existing tmux session or creates a new one on shell start
- Enables vi mode for command line editing
- Saves and restores the last working directory across sessions
- Sets a colored prompt with timestamp, hostname, path, and git branch
- Adds extensive aliases for ls, git, vim, pacman, and navigation

## Files

- **`.bashrc`**
  - Automatically attaches to a detached tmux session on interactive shell start
  - Sets history to 1M entries with `ignoreboth:erasedups`
  - Colored prompt showing `[HH:MM:SS] user@host:path (branch)`
  - Adds `~/bin` to `$PATH`, sets `less` as pager with `-iMSx4 -FX`
  - Enables vi mode (`set -o vi`)
  - Saves `$PWD` to `~/.lastdir` on each prompt, restores it on startup
  - Sources fzf, aliases, bash completion, and local overrides

- **`.bash_profile`**
  - Sources `.bashrc`
  - Adds `~/.cargo/bin` to `$PATH`

- **`.bash_aliases`**
  - `vi`/`vim`/`e` alias to nvim when available, `v` to `vim_wrapper` (Telescope launcher)
  - `ls` with color, human-readable sizes, grouped directories, long ISO timestamps
  - `rm -I` safety alias, `pacman` auto-sudo
  - Git shortcuts: `g`, `status`, `groot` (cd to repo root), `gremaster`
  - Navigation: `..`, `-`, `work`, `dot`, `conf`, `newdir` (mkdir + cd)
  - Arch: `yay`/`yeet`/`yolo` for paru/package management, `sys`/`sysu` for systemctl
  - Process: `ps` with custom column format, `psgrep`, `pse` (forest view)
  - Search: `ag` with follow/hidden, `fzv` (fzf into vim)
  - `latest`/`lf`/`rc` to find and act on the most recently modified file
  - Various sudo aliases: `sudont`/`doit`/`svim`

- **`.inputrc`**
  - Includes system inputrc
  - Marks symlinked directories with a trailing slash

- **`.bash_logout`**
  - Empty (placeholder)

## Docs

- [Bash Reference Manual](https://www.gnu.org/software/bash/manual/bash.html)
- [Readline Init File](https://www.gnu.org/software/bash/manual/bash.html#Readline-Init-File)
