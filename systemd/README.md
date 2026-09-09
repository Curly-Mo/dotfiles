# systemd config

- Reduces user service stop timeout to 10s (from 90s default) for faster shutdown
- Faster service restarts with 500ms restart delay (from 100ms default)
- Adds `~/bin` to PATH for user services
- Custom user service units for Input Leap, LAN Mouse, swhkd, and sxhkd

## Files

- **`system.conf`**
  - All defaults, no custom overrides (shipped as reference)

- **`user.conf`**
  - `DefaultTimeoutStopSec=10s` — services killed after 10s instead of 90s
  - `DefaultDeviceTimeoutSec=10s` — device wait reduced from 90s
  - `DefaultRestartSec=500ms` — restart delay after failure

- **`environment.d/profile.conf`**
  - `PATH=$PATH:~/bin` — adds custom scripts directory to PATH for systemd user services

- **`user/input-leap.service`**
  - Runs Input Leap client, restarts on any failure with 3s delay, bound to graphical session

- **`user/lan-mouse.service`**
  - Runs `lan-mouse --daemon`, restarts on failure, bound to graphical session

- **`user/swhkd.service`**
  - Runs swhkd hotkey daemon via `hotkeys.sh` with a 10s startup delay, bound to graphical session

- **`user/sxhkd.service`**
  - Runs sxhkd, restarts every 1s on failure, rate-limited to 10 starts per 60s

## Docs

- [systemd User Units](https://wiki.archlinux.org/title/Systemd/User)
- [systemd.conf](https://www.freedesktop.org/software/systemd/man/latest/systemd-system.conf.html)
- [environment.d](https://www.freedesktop.org/software/systemd/man/latest/environment.d.html)
