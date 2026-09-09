# ulauncher config

- Alt+Space opens the launcher
- Ubuntu theme, 750px width, hjkl arrow key navigation
- Shows 4 recent apps, hides tray icon
- Custom shortcuts for quick-access IDs and session save/restore
- 25 installed extensions

## Files

- **`settings.json`**
  - `hotkey-show-app: <Alt>space` — toggle launcher
  - `arrow-key-aliases: hjkl` — vim-style navigation
  - `base-width: 750` — launcher width
  - `theme-name: ubuntu` — visual theme
  - `show-recent-apps: 4` — recent app count
  - `clear-previous-query: false` — keeps last query on reopen
  - `show-tray-icon: false` / `show-indicator-icon: false` — no tray presence

- **`shortcuts.json`**
  - `g` — Google search
  - `so` — Stack Overflow search
  - `wiki` — Wikipedia search
  - `userid` — copies a user ID to clipboard
  - `save` / `restore` — KDE window session save/restore scripts
  - `daylist` / `daylist` — copies Spotify daylist playlist ID/URI to clipboard

- **`extensions.json`**
  - emoji, system management, fzf, translate, ukill, GitHub search, nmcli (wifi), Jira, Bluetooth, timestamp, weather, GCP, JetBrains projects, calculator, Spotify API, wiki search, Home Assistant, string utils, zoxide, Font Awesome, thesaurus, case converter, system monitor, Gemini, gitmoji, file browser, extension list, myip, timer

## Docs

- [Ulauncher Preferences](https://ulauncher.io/#Features)
