# xdg config

- Lowercase user directories (downloads, documents, etc.)
- Firefox as default browser, nvim as default text editor
- Claude URL scheme handlers registered
- Alacritty as preferred terminal
- Autostart entries for Firefox, Chrome, Alacritty, Spotify, Deskflow, and Cadence

## Files

- **`user-dirs.dirs`**
  - Maps XDG directories to lowercase names: `~/desktop`, `~/downloads`, `~/documents`, `~/music`, `~/pictures`, `~/videos`, `~/templates`, `~/public`

- **`user-dirs.conf`**
  - Controls whether `xdg-user-dirs-update` is enabled

- **`mimeapps.list`**
  - `x-scheme-handler/http(s)` — Firefox as default browser
  - `text/plain` — Neovim (`nvim_nvim.desktop`) as default text editor
  - `application/pdf`, `image/jpeg`, `image/png` — Firefox
  - `x-scheme-handler/slack` — Slack
  - `x-scheme-handler/jetbrains` — JetBrains Toolbox
  - `x-scheme-handler/claude` — Claude desktop app
  - `x-scheme-handler/claude-cli` — Claude Code URL handler

- **`xdg-terminals.list`**
  - `alacritty.desktop` — Alacritty as preferred XDG terminal

- **`autostart/`**
  - `.desktop` entries for: Alacritty, Firefox, Google Chrome, Spotify, Deskflow, Cadence (JACK audio), custom autostart script, screensaver

- **`.local/share/applications/`**
  - Custom `.desktop` launchers: Alacritty (regular + prime-run), Firefox (personal + work profiles), Deskflow, Cadence, Join (Android push), dex, screensaver, Spotify

## Docs

- [XDG Base Directory Spec](https://specifications.freedesktop.org/basedir-spec/latest/)
- [XDG MIME Applications](https://wiki.archlinux.org/title/XDG_MIME_Applications)
- [Desktop Entry Spec](https://specifications.freedesktop.org/desktop-entry-spec/latest/)
