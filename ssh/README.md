# ssh config

- Prompts before adding keys to the agent (no silent caching)
- Sets `TERM=tmux-256color` for all SSH sessions
- Enables agent forwarding for internal hosts

## Files

- **`.ssh/config`**
  - `AddKeysToAgent confirm` — asks for confirmation before caching keys in the agent
  - `SetEnv TERM=tmux-256color` — sends the terminal type to all remote hosts
  - Enables `ForwardAgent` for specific internal host patterns

- **`.ssh/environment`**
  - `TERM=tmux-256color` — sets the terminal type for non-interactive SSH sessions

## Docs

- [ssh_config](https://man.openbsd.org/ssh_config)
