# alacritty config

- Sets font to RobotoMono Nerd Font at 14.3pt
- Uses a dark Apprentice-inspired color scheme (background `#171717`, foreground `#bcbcbc`)
- Disables window decorations and starts maximized
- Sets default shell to `/usr/bin/zsh --login`
- Increases scrollback history to 100,000 lines
- Renders bold text with bright colors

## Files

- **`alacritty.toml`**
  - `[font]` - RobotoMono Nerd Font, size 14.3, with Regular/Bold/Italic/Bold Italic variants
  - `[colors]` - Apprentice-style dark palette with muted normal colors and brighter bold variants
  - `[window]` - No title bar decorations, starts maximized
  - `[terminal.shell]` - Launches zsh as a login shell
  - `[scrolling]` - 100k line scrollback buffer

- **`alacritty.yml` / `default.yml`**
  - Legacy YAML configs (superseded by `alacritty.toml`)

## Docs

- [Alacritty Configuration](https://alacritty.org/config-alacritty.html)
