# syncthing config

- Syncthing tray connects to local instance at `http://127.0.0.1:8384`
- Desktop notifications on disconnect and errors
- Uses Ubuntu Sans 11pt font with Yaru-prussiangreen-dark icon theme

## Files

- **`syncthingtray.ini`**
  - `syncthingUrl=http://127.0.0.1:8384` — connects to the local Syncthing API
  - `autoConnect=true` — automatically connects on startup
  - `syncthingAutostart=false` — tray does not start the Syncthing daemon (managed by systemd)
  - `notifyOnDisconnect=true` / `notifyOnErrors=true` — desktop notifications for connection loss and errors
  - `notifyOnLocalSyncComplete=false` — suppresses notifications for completed syncs
  - `font="Ubuntu Sans,11"` — tray UI font
  - `icontheme=Yaru-prussiangreen-dark` — matches the system icon theme

## Docs

- [Syncthing Documentation](https://docs.syncthing.net/)
