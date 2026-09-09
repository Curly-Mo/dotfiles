# lan-mouse config

- Shares mouse/keyboard with a machine called `windoze` positioned to the right
- Layer-shell capture backend for Wayland, port 4242
- TLS with authorized fingerprint for the remote host

## Files

- **`config.toml`**
  - Capture backend: `layer-shell` (Wayland-native)
  - Port: 4242
  - Authorized fingerprint for `windoze` (TLS peer verification)
  - Right-side client: hostname `windoze`, activate on startup disabled

## Docs

- [LAN Mouse Configuration](https://github.com/feschber/lan-mouse#configuration)
