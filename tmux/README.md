# tmux config

- Prefix rebound to `Alt+B` (C-b unbound)
- Vi copy-mode with `v` to select, `y` to yank
- Dark status bar at top with session name, user@host, battery, and date
- Mouse support enabled with single-line scroll speed
- Alacritty as default terminal with true color support
- 100k line scrollback history

## Files

- **`.tmux.conf`**

  - **Prefix and basics**
    - `prefix M-b` — primary prefix is Alt+B (C-b is unbound)
    - `prefix2 M-B` — secondary prefix is Alt+Shift+B
    - `escape-time 0` — no delay after Escape key
    - `default-terminal 'alacritty'` with true color overrides for Alacritty and 256color terminals
    - `history-limit 100000` — 100k line scrollback
    - `base-index 1` / `pane-base-index 1` — windows and panes start at 1

  - **Navigation**
    - `Shift+Left/Right` or `Ctrl+H/L` — previous/next window
    - `Ctrl+Shift+Left/Right` — swap window position
    - `Ctrl+Shift+Up` — last window
    - `Ctrl+N` — new window; `Alt+N` — new window after current
    - `Ctrl+\` or `|` / `\` — horizontal split; `-` — vertical split
    - `Alt+Shift+Left/Right` or `Alt+Shift+H/L` — select pane left/right
    - `=` — break pane to new window; `+` — join pane from previous window

  - **Copy mode**
    - `Ctrl+K` — enter copy mode
    - `Alt+/` / `Alt+?` — enter copy mode and search backward
    - `v` starts selection, `y` copies to clipboard
    - Mouse drag selects without clearing on drag end

  - **Status bar**
    - Top position, dark background (`#111111`), gray text
    - Left: session name
    - Right: user@host, battery icon/percentage, day/date/time
    - Active window highlighted in blue (`#6080b0`)

  - **Plugins (via TPM)**
    - `tmux-sensible` — sensible defaults
    - `tmux-battery` — battery indicator
    - `tmux-better-mouse-mode` — single-line scroll, scroll-without-changing-pane, alternate buffer scroll emulation
    - `tmux-resurrect` — save/restore sessions (nvim session strategy)

## Docs

- [tmux Manual](https://man.openbsd.org/tmux)
- [TPM Usage](https://github.com/tmux-plugins/tpm#installing-plugins)
