# pipewire config

- Limits link buffers for compatibility with older clients
- Enables realtime scheduling with elevated priority
- Loads PulseAudio compatibility modules for device and stream management
- Includes application-specific quirks (Teams S16 format, Firefox capture fix)

## Files

- **`.config/pipewire/pipewire.conf`**
  - `link.max-buffers = 16` — limits buffer count for pre-v3 client compatibility
  - `core.daemon = true` — runs as a socket-listening daemon
  - `module-rt: nice.level = -11, rt.prio = 88` — realtime thread priority and nice level
  - `module.x11.bell = true` — enables X11 bell sound via libcanberra
  - `module.jackdbus-detect = true` — auto-detects JACK via D-Bus
  - Standard module set: protocol-native, profiler, metadata, adapter, link-factory, session-manager, access, portal

- **`.config/pipewire/pipewire-pulse.conf`**
  - `module-rt: nice.level = -11` — realtime scheduling for the PulseAudio layer
  - `pulse.cmd` loads:
  - `module-always-sink` — creates a fallback sink when none exists
  - `module-device-manager` — tracks device priorities
  - `module-device-restore` — restores per-device volume/mute
  - `module-stream-restore` — restores per-stream volume/routing
  - Application quirks:
  - Teams/Skype: forces S16 format info
  - Firefox: removes `DONT_MOVE` flag from capture streams
  - speech-dispatcher: increases minimum quantum to prevent underruns

- **`.config/pipewire/pipewire-pulse.conf.d/combined-stream.conf`**
  - Template for a combined sink (simultaneous audio output to all sinks), currently commented out

## Docs

- [PipeWire Wiki](https://gitlab.freedesktop.org/pipewire/pipewire/-/wikis/Config-PipeWire)
