# gnome config

- Alt/Super + key shortcuts to run-or-raise specific apps (Firefox, Alacritty, Slack, Spotify, IntelliJ, GlobalProtect)
- Workspace isolation mode for Firefox and Alacritty via `:isolate-workspace`
- Glide window close animation (150ms) and incinerate window open animation (550ms, amber color) via Burn My Windows

## Files

- **`run-or-raise/shortcuts.conf`**
  - `Alt+F` / `Super+F` raise or launch Firefox (wm_class `firefox_firefox`)
  - `Alt+D` / `Super+F2` raise or launch Alacritty
  - `Alt+A` raise or launch Slack
  - `Alt+S` raise or launch Spotify
  - `Alt+Shift+S` / `Super+Shift+S` raise or launch IntelliJ IDEA
  - `Alt+Shift+G` / `Super+G` raise or launch GlobalProtect VPN client
  - Firefox and Alacritty use `:isolate-workspace` mode to scope to current workspace

- **`burn-my-windows/profiles/1788375648165730.conf`**
  - Window close animation: glide effect at 150ms, fire disabled

- **`burn-my-windows/profiles/1788375926566868.conf`**
  - Window open animation: incinerate effect at 550ms with amber color (`rgb(184,94,44)`), fire disabled

## Docs

- [run-or-raise Configuration](https://github.com/CZ-NIC/run-or-raise#configuration)
- [Burn My Windows](https://github.com/Schneegans/Burn-My-Windows)
