# sudo

Custom sudoers configuration. Not symlinked automatically since it requires root.

## What it configures

- No password prompt timeout (waits indefinitely)
- Global sudo timestamp (shared across terminals)
- 120-minute credential cache
- Password feedback (asterisks while typing)
- Insults on incorrect password
- Passwordless `gpclient` (GlobalProtect VPN)

## Install

```bash
sudo visudo -f /etc/sudoers.d/custom
```

Copy the contents of `custom` into the editor. Always use `visudo` to validate syntax.
