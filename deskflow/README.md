# deskflow config

- Client mode connecting to `192.168.1.173` on port 24800 with TLS encryption
- Auto-hides to system tray, clipboard sharing enabled (3MB limit)
- Screen name `lappybara`, Barrier protocol compatibility

## Files

- **`Deskflow.conf`**
  - `remoteHost=192.168.1.173` — server IP for client mode
  - `coreMode=1` — runs as client
  - `screenName=lappybara` — this machine's screen name
  - `port=24800` — connection port
  - `tlsEnabled=true` — TLS encryption with 2048-bit key
  - `autoHide=true`, `closeToTray=true` — minimizes to tray
  - `enableUpdateCheck=false` — disables auto-update checks
  - `clipboardSharing=true` — shares clipboard between machines
  - `logExpanded=true`, `guiDebug=true`, `toFile=true` — verbose logging to `~/deskflow.log`

- **`deskflow-server.conf`**
  - Server layout skeleton with Barrier protocol
  - `clipboardSharing=true`, `clipboardSharingSize=3072` (3MB)
  - `relativeMouseMoves=false`, `disableLockToScreen=false`

- **`deskflow.toml`**
  - Server/client args template (currently commented out)

## Docs

- [Deskflow Documentation](https://github.com/deskflow/deskflow/wiki)
