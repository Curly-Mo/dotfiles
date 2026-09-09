# sxhkd config

- Alt+key shortcuts to launch-or-focus apps (same layout as swhkd, for X11)
- Alt+C / Alt+Shift+C copies primary selection to clipboard
- Alt+V on release types clipboard contents into the focused window via xdotool

## Files

- **`sxhkdrc`**
  - `alt + d` / `alt + F2` — launch or focus Alacritty
  - `alt + f` — launch or focus Firefox
  - `alt + s` — launch or focus Spotify
  - `alt + a` — launch or focus Slack
  - `alt + shift + s` — launch or focus IntelliJ IDEA
  - `alt + shift + g` — launch or focus GlobalProtect VPN
  - `alt + c` / `alt + shift + c` — copy primary selection to clipboard via xsel
  - `alt + @v` / `alt + shift + @v` — type clipboard contents into focused window via xdotool (on key release)

- **`autostart/sxhkd.desktop`**
  - XDG autostart entry that launches sxhkd on login

## Docs

- [sxhkd Configuration](https://github.com/baskerville/sxhkd#configuration)
