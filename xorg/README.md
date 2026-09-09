# xorg config

- Caps Lock remapped to Escape via `setxkbmap`
- Multi-monitor layout profiles for docked/undocked via autorandr
- GTK/font settings reference for xsettingsd (all commented out, used as reference)

## Files

- **`.xinitrc`**
  - Contains commented-out xrandr commands for multi-monitor setups (eDP-1 + DP-1 with 1.5x scaling)
  - Not actively used (display manager handles session startup)

- **`.xprofile`**
  - `setxkbmap -layout us -option caps:escape` — remaps Caps Lock to Escape on X11 session start

- **`.Xmodmap`**
  - Empty (key remapping handled by `.xprofile` instead)

- **`autorandr/`**
  - Monitor layout profiles with `config` (xrandr settings) and `setup` (EDID fingerprints):
  - `default/` — fallback layout
  - `docked/` — external monitor configuration
  - `docked2/` — alternate docked layout
  - `undocked/` — laptop-only layout
  - `settings.ini` — autorandr global settings

- **`xsettingsd/xsettingsd.conf`**
  - All settings commented out (reference for Breeze-Dark theme, Noto Sans 10pt, breeze cursors 24px, KDE-style window decorations)

## Docs

- [Xorg](https://wiki.archlinux.org/title/Xorg)
- [xprofile](https://wiki.archlinux.org/title/Xprofile)
- [Xmodmap](https://wiki.archlinux.org/title/Xmodmap)
- [autorandr Configuration](https://github.com/phillipberndt/autorandr#how-to-use)
