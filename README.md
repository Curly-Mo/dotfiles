# dotfiles

Personal configuration files, managed with symlinks.
Each top-level directory is a self-contained package mirroring its target path under `$HOME`.

## Quick Start

```bash
# Full setup: installs zinit, vim-plug, tmux plugins, then symlinks everything
./setup.sh

# Symlink individual packages (interactive, confirms each one)
./create_symlinks.sh zsh tmux neovim

# Symlink all packages
./create_symlinks.sh
```

An alternative `stow_symlinks.sh` is available if you prefer [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

Each directory maps to a package. Files inside mirror their destination relative to `$HOME`:

```
zsh/
  .zshrc          -> ~/.zshrc
  .zsh_aliases    -> ~/.zsh_aliases
neovim/
  .config/nvim/   -> ~/.config/nvim/
```

### Packages

| Package | Description |
|---|---|
| `alacritty` | [Alacritty](https://alacritty.org/) terminal emulator config |
| `bash` | [Bash](https://www.gnu.org/software/bash/) shell (`.bashrc`, `.bash_profile`, `.inputrc`) |
| `bat` | [bat](https://github.com/sharkdp/bat) (cat replacement) config |
| `bazel` | [Bazel](https://bazel.build/) build settings |
| `bin` | Custom scripts added to `~/bin` |
| `claude` | [Claude Code](https://docs.anthropic.com/en/docs/claude-code) settings |
| `cowfortune` | [Fortune](https://github.com/shlomif/fortune-mod)/[cowsay](https://github.com/cowsay-org/cowsay) config |
| `deskflow` | [Deskflow](https://github.com/deskflow/deskflow) KVM sharing |
| `env` | Shared environment (`.profile`) |
| `git` | [Git](https://git-scm.com/) config, global ignore, user identity |
| `gnome` | [GNOME](https://www.gnome.org/) run-or-raise shortcuts |
| `helix` | [Helix](https://helix-editor.com/) editor config |
| `idea` | [IdeaVim](https://github.com/JetBrains/ideavim) bindings |
| `input-leap` | [Input Leap](https://github.com/input-leap/input-leap) KVM sharing |
| `karabiner` | [Karabiner-Elements](https://karabiner-elements.pqrs.org/) macOS keyboard remapping |
| `kde` | [KDE](https://kde.org/) shortcuts, window rules, wallet |
| `lan-mouse` | [LAN Mouse](https://github.com/feschber/lan-mouse) config |
| `libinput-gestures` | [libinput-gestures](https://github.com/bulletmark/libinput-gestures) touchpad gesture bindings |
| `local` | Machine-local overrides (not committed) |
| `neovim` | [Neovim](https://neovim.io/) ([Lazy.nvim](https://github.com/folke/lazy.nvim), LSP, Telescope, Treesitter) |
| `openai` | [OpenAI Codex](https://openai.com/index/codex/) settings |
| `opencode` | [OpenCode](https://github.com/opencode-ai/opencode) config |
| `pacman` | [pacman](https://wiki.archlinux.org/title/Pacman) `makepkg.conf` |
| `paru` | [Paru](https://github.com/Morganamilo/paru) AUR helper config |
| `pipewire` | [PipeWire](https://pipewire.org/) audio config |
| `prime` | [optimus-manager](https://github.com/Askannz/optimus-manager) NVIDIA switching |
| `python` | [Python](https://www.python.org/) startup and pip config |
| `redshift` | [Redshift](https://github.com/jonls/redshift)/[Gammastep](https://gitlab.com/chinstrap/gammastep) color temperature |
| `ripgrep` | [ripgrep](https://github.com/BurntSushi/ripgrep) config |
| `screen` | [GNU Screen](https://www.gnu.org/software/screen/) config |
| `ssh` | [OpenSSH](https://www.openssh.com/) client config and environment |
| `swhkd` | [swhkd](https://github.com/waycrate/swhkd) Wayland hotkey daemon |
| `sxhkd` | [sxhkd](https://github.com/baskerville/sxhkd) X11 hotkey daemon |
| `syncthing` | [Syncthing](https://syncthing.net/) tray config |
| `systemd` | [systemd](https://systemd.io/) user overrides and environment |
| `tmux` | [tmux](https://github.com/tmux/tmux) config with [TPM](https://github.com/tmux-plugins/tpm) |
| `ubuntu` | Ubuntu-specific XDG terminal list |
| `ulauncher` | [Ulauncher](https://ulauncher.io/) app launcher |
| `urxvt` | [URxvt](https://wiki.archlinux.org/title/Rxvt-unicode) terminal and color schemes |
| `vim` | [Vim](https://www.vim.org/) config |
| `xdg` | [XDG](https://wiki.archlinux.org/title/XDG_Base_Directory) directories, MIME defaults, autostart |
| `xorg` | [Xorg](https://wiki.archlinux.org/title/Xorg) init, profile, key remapping, [autorandr](https://github.com/phillipberndt/autorandr) |
| `zsh` | [Zsh](https://www.zsh.org/) shell (`.zshrc`, `.zprofile`, aliases, theme) |

### Utility Scripts

| Script | Description |
|---|---|
| `create_symlinks.sh` | Interactive symlink creator. Accepts package names as args, or symlinks everything. |
| `stow_symlinks.sh` | GNU Stow alternative for symlinking. |
| `setup.sh` | Full bootstrap: zinit, vim-plug, tmux plugins, then runs `create_symlinks.sh`. |
| `install_fonts.sh` | Installs Powerline fonts (deprecated, prefer `powerline-fonts-git` on Arch). |

### System-level Config

The `.sudo/` directory contains files that require root access. See `.sudo/README.md`.

## Adding a New Package

1. Create a directory named after the package.
2. Mirror the target file paths relative to `$HOME` inside it.
3. Run `./create_symlinks.sh <package-name>`.
