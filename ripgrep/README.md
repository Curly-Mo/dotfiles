# ripgrep config

- Follows symlinks, searches hidden files, and uses smart-case matching by default
- Excludes `.git/` directories from search results

## Files

- **`.config/ripgrep/.ripgreprc`**
  - `--follow` — follows symbolic links
  - `--hidden` — searches hidden files and directories
  - `--smart-case` — case-insensitive unless the pattern contains uppercase
  - `--glob=!.git/` — excludes `.git/` directories
  - `--color=auto` — colorized output when writing to a terminal

## Docs

- [ripgrep User Guide](https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md#configuration-file)
