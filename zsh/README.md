# zsh config

- Auto-attaches to a detached tmux session or creates a new one on shell start
- Zinit plugin manager with turbo-loaded (lazy) plugins
- Vi mode via zsh-vi-mode with 0.3s key timeout, insert mode by default, system clipboard
- 10M line history, fortune/lolcat login greeting
- Extensive tool installation via zinit (fzf, bat, fd, ripgrep, delta, lazygit, eza, jq, zoxide, etc.)

## Files

- **`.zshrc` / `.config/zsh/.zshrc`**
  - **Shell options**
    - `promptsubst`, `globdots`, `extendedglob`, `interactive_comments`
    - `HISTSIZE=10000000` / `SAVEHIST=10000000`

  - **Zinit annexes**
    - bin-gem-node, binary-symlink, link-man, default-ice, rust, submods, patch-dl, man, z-a-eval

  - **Oh My Zsh modules**
    - Libs: history, prompt_info_functions, git, completion
    - Plugins: colored-man-pages, command-not-found, sudo (bound to Ctrl+\`)

  - **Zsh plugins**
    - `zsh-vi-mode` — vi keybindings with lazy loading and system clipboard
    - `last-working-dir-tmux` — remembers CWD per tmux pane
    - `zsh-poetry`, `zsh-pyenv-lazy` — Python environment integration
    - `zsh-nvm` — lazy-loaded Node version manager with NVM_AUTO_USE
    - `fzf-marks` — named directory bookmarks
    - `zsh_codex` — AI completions (Ctrl+X)
    - `zsh-ask` — AI chat from shell
    - `igit` — interactive git
    - `zsh-autopair` — auto-close brackets/quotes
    - `zsh-manydots-magic` — expands `...` to `../..`
    - `fast-syntax-highlighting` — real-time syntax coloring
    - `zsh-completions` — additional completion definitions
    - `zsh-autosuggestions` — fish-style suggestions (strategy: match_prev_cmd, history, completion; max buffer 50)

  - **Programs installed via zinit**
    - `fzf` + `fzf-tab` + `fzf-tab-source` — fuzzy finder with tab completion
    - `fzy` — alternative fuzzy finder
    - `direnv` — per-directory environment
    - `zoxide` — smart cd
    - `LS_COLORS` — colored ls output
    - `eza` — modern ls replacement
    - `gtrash` — trash CLI
    - `bat`, `fd`, `hexyl`, `hyperfine`, `vivid` — sharkdp tools
    - `yank`, `nnn`, `peco`, `ripgrep`, `jq` — CLI utilities
    - `sdkman` — JVM version manager
    - `delta`, `lazygit`, `hub`, `git-extras`, `git-open`, `git-recent`, `git-recall`, `git-my`, `git-quick-stats`, `git-now`, `git-url`, `forgit` — git tools

  - **Key bindings**
    - Home/End keys mapped across terminal types
    - `Ctrl+Q` — push line (park current command)
    - `Ctrl+D` — exit (overridden to work after spaces)
    - `Shift+Tab` — reverse menu complete

  - **Login greeting**
    - `fortune` (showerthoughts, handey, hitchhiker, billwurtz, definitions, drugs) piped through `lolcat`

- **`.zshenv` / `.config/zsh/.zshenv`**
  - Sets `$ZDOTDIR` and early environment variables

- **`.zprofile` / `.config/zsh/.zprofile`**
  - Login shell environment (sources `.profile`)

- **`.zsh_aliases` / `.aliases`**
  - See `bash/.bash_aliases` for shared aliases (same file, sourced by both shells)

- **`.zsh_theme` / `.config/zsh/.zsh_theme`**
  - Custom prompt theme using `git-prompt.zsh`

- **`.zsh_functions` / `.config/zsh/.zsh_functions/`**
  - `zsh_functions.plugin.zsh` — plugin loader
  - `my_zsh_functions.zsh` — custom shell functions

- **`.config/zsh/fzf.zsh`**
  - Custom fzf configuration and key bindings

- **`.config/zsh/fzf-tab/`**
  - fzf-tab completion config and source scripts (git-checkout preview, etc.)

- **`.config/zsh/custom-zsh-fast-theme*.ini`**
  - Custom syntax highlighting color themes for fast-syntax-highlighting

## Docs

- [Zsh Documentation](https://zsh.sourceforge.io/Doc/)
- [Zsh Startup Files](https://zsh.sourceforge.io/Intro/intro_3.html)
- [zinit](https://github.com/zdharma-continuum/zinit)
