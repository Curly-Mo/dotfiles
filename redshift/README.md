# redshift config

- Applies warm 3000K color temperature during the day via a dusk-time hack (swaps day/night values)
- Uses manual location (Munich area) instead of geolocation
- Smooth fade between temperature transitions

## Files

- **`.config/redshift/redshift.conf`**
  - `temp-day = 3000` / `temp-night = 7000` — swapped from defaults as part of a dusk-time workaround
  - `dusk-time = 8:30-10:00` / `dawn-time = 00:00-1:30` — custom dawn/dusk to work around the pre-midnight dusk-time limitation
  - `fade = 1` — gradual transition between temperature states
  - `location-provider = manual` — disables geolocation
  - `lat = 48.1` / `lon = 11.6` — manual coordinates (Munich area)

- **`.config/gammastep/.config.ini`**
  - Empty placeholder for Gammastep (Wayland-compatible Redshift fork)

## Docs

- [Redshift Configuration](https://github.com/jonls/redshift#configuration)
- [Gammastep](https://gitlab.com/chinstrap/gammastep)
