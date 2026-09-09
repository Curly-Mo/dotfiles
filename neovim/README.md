# neovim config

- Custom `phlebotinum` colorscheme, 2-space tabs (4 for Python), persistent undo (50k levels)
- Diagnostics shown in floating windows on hover (no inline virtual text)
- 20+ LSP servers via Mason (basedpyright, jdtls, lua_ls, rust_analyzer, ts_ls, and more)
- Telescope with frecency scoring, repo finder, file browser, and undo history
- Treesitter textobjects for navigating/selecting by function, class, block, and scope
- nvim-cmp + blink.cmp completion with LSP, snippet, and git sources
- AI integrations: Claude/Aider/Goose terminals, CodeCompanion, Sidekick

## Files

- **`lua/config/options.lua`**
  - Line numbers, cursorline, `termguicolors`
  - Persistent undo to `stdpath('state')` with 50,000 undo levels
  - Highlight search with `Space` to clear, ignorecase + smartcase
  - 2-space tabs default, 4-space for Python
  - System clipboard (`unnamedplus`), mouse enabled
  - Diagnostics: virtual text off, underline errors only, severity-sorted, float on `CursorHold` (2s delay)
  - Split navigation via `Ctrl+H/J/K/L`
  - `leader+d` deletes without yanking

- **`lua/config/keymaps.lua`**
  - `[d` / `]d` navigate diagnostics, `[D` / `]D` for errors only
  - LSP keymaps on attach: `gd` definition, `gD` declaration, `gi` implementation, `gwr` references
  - `leader+rn` rename, `ga` code action, `K` hover, `Ctrl+K` signature help
  - `leader+F` format, `gk` peek definition in floating window
  - `0` key cycles between column 0, first non-blank, and end of line

- **`lua/plugins/init.lua`**
  - `phlebotinum` custom colorscheme
  - `which-key` with 1s timeout
  - tpope suite: fugitive (GHE support + `GBrowse` keymaps), surround, commentary, obsession, speeddating, repeat, dadbod, eunuch, rhubarb, abolish, capslock, vinegar, projectionist
  - `lualine` with custom filename color on modified, aerial integration, gitsigns diff source
  - `aerial` code outline (LSP + treesitter), toggled with `Alt+;`
  - `neo-tree` file explorer with auto-close on open, follow current file, toggled with `Alt+\`
  - `quick-scope` highlights unique characters for `f`/`F`/`t`/`T`
  - `nvim-tmux-navigation` for seamless Ctrl+HJKL across tmux panes
  - `vim-move` with Ctrl modifier for line/block moving
  - `black` formatter: skip string normalization, 120 line length
  - `localvimrc` whitelisted to `~/workspace`

- **`lua/plugins/lsp.lua`**
  - `fidget.nvim` for LSP progress indicators
  - `trouble.nvim` for diagnostics list
  - `nvim-dap` for debugging
  - `formatter.nvim`: stylua, black, prettier, eslint, shfmt, google-java-format
  - `nvim-metals` for Scala with inlay hints
  - Mason ensures: jdtls, basedpyright, lua_ls
  - LSP servers configured:
  - `basedpyright`: standard type checking, workspace diagnostics enabled
  - `jdtls`: Google Java style, signature help, null analysis
  - `lua_ls`: inlay hints enabled
  - `rust_analyzer`, `ts_ls`, `bashls` (sh/bash/zsh), `yamlls`, `jsonls`, `vimls`
  - `eslint`, `cmake`, `cssls`, `sqlls`, `marksman`, `awk_ls`, `pbls`, `jinja_lsp`, `dprint`

- **`lua/plugins/telescope.lua`**
  - Finder uses `fd` and `rg`, 99% width window, filename-first path display
  - Extensions: fzf-native, ui-select, file-browser, undo, frecency (workspace-aware recency scoring), smart-open, github, swap-files
  - `repo` extension searches `~/workspace`, `~/personal`, `~/packages`

- **`lua/plugins/treesitter.lua`**
  - Textobjects: swap parameters, move by function/block/scope, select by statement/function/class/conditional/loop/comment/call
  - `nvim-dap-virtual-text` shows debug values inline
  - `vim-matchup` enhanced with treesitter
  - `treesitter-context` shows 2 lines of surrounding scope
  - `refactoring.nvim`, `ssr.nvim` (structural search/replace)
  - `rainbow-delimiters`, `ts-context-commentstring`, `nvim-ts-autotag`
  - `mini.splitjoin` + `treesj` with fallback chain
  - 60+ parsers auto-installed

- **`lua/plugins/cmp.lua`**
  - `nvim-autopairs` for bracket auto-close
  - `LuaSnip` snippet engine
  - `cmp-git` with GitHub Enterprise support
  - `nvim-cmp`: manual trigger, ghost text preview, LSP + luasnip + lazydev sources
  - Navigation: `Tab`/`S-Tab`, `Up`/`Down`, `C-j`/`C-k`, `CR` to confirm
  - Cmdline completion for `/`, `?`, `:`
  - `blink.cmp` also configured as an alternative engine

- **`lua/plugins/ai.lua`**
  - `ai-terminals.nvim`: Claude, Aider, and Goose terminal integrations
  - `opencode.nvim`: full TUI config for OpenCode
  - `codecompanion.nvim`: chat-based AI assistant
  - `sidekick.nvim`: tmux mux backend with Claude toggle

## Docs

- [Neovim Configuration](https://neovim.io/doc/user/lua-guide.html)
- [Lazy.nvim Plugin Manager](https://github.com/folke/lazy.nvim)
- [Mason](https://github.com/williamboman/mason.nvim)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
