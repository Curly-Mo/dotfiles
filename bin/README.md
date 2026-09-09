# bin config

- Custom scripts placed in `~/bin` (must be on `$PATH`)
- Includes workspace management, build helpers, editor wrappers, and system utilities

## Files

- **`vim_wrapper`**
  - Opens `$EDITOR` with Telescope file finder when called with no args
  - With args, opens the specified files normally

- **`build`**
  - Detects project type (Maven, sbt, Bazel) and runs the appropriate build command
  - Supports subcommands: `c` (compile), `v` (verify), `t` (test), `r` (run)

- **`git_cleanup`**
  - Prunes local branches that have been squash-merged into a target branch (default: master)
  - Skips protected branches (master, main)

- **`swap`**
  - Atomically swaps two files using a temp file

- **`launch_or_focus` / `run-or-raise`**
  - Focuses an existing window matching a class/title, or launches the app if not found
  - `launch_or_focus` restricts to current workspace for non-global apps

- **`desktop_personal` / `desktop_work` / `gaming` / `school`**
  - Switches to a named virtual desktop, creating it if it doesn't exist

- **`vpn`**
  - Connects to SpotiVPN via NetworkManager (`nmcli`)

- **`windows`**
  - Sets EFI next boot to Windows and reboots

- **`autostart`**
  - Launches dependent startup applications in order (used by XDG autostart)

- **`colorize`**
  - Pipes input through `bat` (or `highlight` as fallback) for syntax-highlighted output

- **`jh` / `spjhurl`**
  - Wrappers for Spotify's internal `jhurl` HTTP client with default site/user args

- **`keyboard_backlight.py`**
  - Controls keyboard backlight brightness via D-Bus

- **`kreboot` / `kshutdown`**
  - KDE session-aware reboot/shutdown via `qdbus`

- **`init-conda-env`**
  - Bootstraps a conda environment from a `environment.yml` in the current directory

- **`find_symlinks`**
  - Lists all symlinks under `$HOME` pointing into the current directory

- **`rename_workspace.py`**
  - Renames the current virtual desktop

- **`_completions/`**
  - Zsh completions for `swap` and `vim_wrapper`
