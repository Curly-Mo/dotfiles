# python config

- Adds tab completion and persistent command history to the interactive interpreter
- pip config is a placeholder (extra index URL commented out)

## Files

- **`.pystartup`**
  - Binds `Tab` to readline autocomplete (with libedit compatibility)
  - Persists command history to `~/.pyhistory` across sessions
  - Cleans up imported modules from the interpreter namespace on exit

- **`.config/pip/pip.conf`**
  - `[global]` section with an optional extra index URL (currently commented out)

## Docs

- [Python Startup File](https://docs.python.org/3/using/cmdline.html#envvar-PYTHONSTARTUP)
- [pip Configuration](https://pip.pypa.io/en/stable/topics/configuration/)
