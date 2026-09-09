# urxvt config

- Roboto Mono for Powerline font at 16pt with Symbola fallback
- Apprentice color scheme (dark)
- Scrollbar disabled, 50k line scrollback
- Alt+C / Alt+V clipboard integration via xsel
- URL clicking opens Google Chrome

## Files

- **`.Xresources`**
  - `font: xft:Roboto Mono for Powerline:size=16, xft:Symbola` — primary font with symbol fallback
  - `#include ".Xresources.d/apprentice"` — loads the Apprentice color scheme
  - `scrollBar: false` — scrollbar hidden
  - `saveLines: 50000` — 50k line scrollback buffer
  - `scrollTtyOutput: false` — does not auto-scroll on output
  - `scrollWithBuffer: true` / `scrollTtyKeypress: true` — scroll with buffer on mouse/keypress
  - `internalBorder: 2` / `externalBorder: 0` — 2px internal padding, no external border
  - `perl-ext-common: default,matcher,clipboard` — enables URL matching and clipboard extensions
  - `clipboard.copycmd: xsel --input --clipboard` / `clipboard.pastecmd: xsel --output --clipboard` — clipboard via xsel
  - `clipboard.autocopy: true` — selections auto-copied to clipboard
  - `keysym.M-c: perl:clipboard:copy` / `keysym.M-v: perl:clipboard:paste` — Alt+C/V for copy/paste
  - `url-launcher: /usr/bin/google-chrome-stable` — click URLs to open in Chrome
  - `iconFile: /usr/share/pixmaps/terminal.png` — window icon

- **`.Xresources.d/`**
  - Color scheme files: `apprentice` (active), `base16-default`, `base16-railscasts`, `base16-monokai`, `base16-eighties`

  Reload with `xrdb -merge ~/.Xresources`.

## Docs

- [URxvt](https://wiki.archlinux.org/title/Rxvt-unicode)
- [Xresources](https://wiki.archlinux.org/title/X_resources)
