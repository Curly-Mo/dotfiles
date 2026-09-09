# swhkd config

- Alt+key shortcuts to launch-or-focus apps: Alacritty, Firefox, Spotify, Slack, IntelliJ IDEA, GlobalProtect
- Alt+V / Alt+Shift+V paste from Wayland clipboard via `wl-paste`
- Autostart entry launches swhkd via pkexec with swhks IPC server

## Files

- **`swhkdrc`**
  - `alt + d` / `alt + F2` — launch or focus Alacritty
  - `alt + f` — launch or focus Firefox
  - `alt + s` — launch or focus Spotify
  - `alt + a` — launch or focus Slack
  - `alt + shift + s` — launch or focus IntelliJ IDEA
  - `alt + shift + g` — launch or focus GlobalProtect VPN
  - `alt + v` / `alt + shift + v` — paste Wayland clipboard contents via `wl-paste`

- **`hotkeys.sh`**
  - Kills any existing swhks process, then starts swhks and launches swhkd via pkexec

- **`swhkd-start.sh`**
  - Starts swhkd in daemon mode with explicit config path via pkexec

- **`swhks-start.sh`**
  - Kills existing swhks and restarts the IPC server in the background

- **`autostart/swhkd.desktop`**
  - XDG autostart entry that launches swhks + swhkd on login

## Docs

- [swhkd Configuration](https://github.com/waycrate/swhkd#configuration)
