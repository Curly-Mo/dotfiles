# screen config

- Suppresses the startup splash message
- Uses the user's default shell as the screen shell
- Increases scrollback to 9000 lines

## Files

- **`.screenrc`**
  - `shell -$SHELL` — runs the user's login shell inside screen windows
  - `startup_message off` — disables the GNU Screen splash on attach
  - `defscrollback 9000` — sets scrollback buffer to 9000 lines (default is 100)

## Docs

- [GNU Screen Manual](https://www.gnu.org/software/screen/manual/screen.html)
