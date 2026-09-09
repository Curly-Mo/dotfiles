# kde config

- 4 virtual desktops (Work, Project, Hack, Personal) with keyboard shortcuts
- Night color at 2800K always on, Xwayland scale 2.55
- Borderless maximized windows with Breeze decoration (MN buttons on left)
- Tiling layout 25%/50%/25%, click-to-focus, diminactive plugin
- Extensive keyboard shortcuts for desktops, tiling, and window management
- KWallet disabled

## Files

- **`kwinrc`**
  - OpenGL compositing backend with low latency mode
  - 4 named desktops: Work, Project, Hack, Personal
  - Night color: 2800K, always on mode
  - DimInactive effect enabled (dims unfocused windows)
  - Borderless maximized windows
  - Tiling layout: 25% / 50% / 25% column split
  - Click-to-focus policy, focus follows mouse disabled
  - Xwayland scale factor 2.55
  - Breeze window decoration with Minimize (M) and Close (N) buttons on the left, none on right
  - Centered window placement strategy

- **`kglobalshortcutsrc`**
  - `Meta+1` through `Meta+9` activate task manager entries (app switching)
  - `Ctrl+F1` through `Ctrl+F4` switch to desktops 1-4
  - `Meta+Arrow` keys for quick tiling (left/right/top/bottom halves)
  - `Meta+Ctrl+Arrow` keys switch between virtual desktops
  - `Alt+Tab` / `Alt+Shift+Tab` walk through windows
  - `Meta+W` overview, `Meta+D` show desktop
  - `Meta+PgUp` maximize, `Meta+PgDown` minimize
  - Meta-only app launcher trigger disabled
  - `Ctrl+Alt+L` locks the screen

- **`kwalletrc`**
  - KWallet disabled (`Enabled=false`, `First Use=false`)

- **`window_rules.kwinrule`**
  - Fixes windows starting on wrong monitor by ignoring saved geometry (`ignoregeometry=true`)
  - Requires Centered placement strategy to take effect

- **`environment.d/ssh_askpass.conf`**
  - SSH askpass agent settings (currently commented out)

## Docs

- [KWin Configuration](https://userbase.kde.org/KWin)
- [KDE Plasma Shortcuts](https://docs.kde.org/stable5/en/plasma-desktop/plasma-desktop/shortcuts.html)
