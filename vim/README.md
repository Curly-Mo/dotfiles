# vim config

- 2-space tabs (4 for Python), spaces not tabs
- Case-insensitive smart search with incsearch.vim
- Persistent undo across sessions
- System clipboard integration via `unnamedplus`
- Auto-commenting disabled on all filetypes

## Files

- **`.vimrc`**

  - **Plugins (vim-plug)**
    - `incsearch.vim` — incremental search with `/`, `?`, `g/` mapped to forward/backward/stay
    - `vim-colortemplate` — color scheme development tool

  - **Appearance**
    - `colorscheme default` — built-in default scheme
    - `syntax on` / `number` — syntax highlighting and line numbers
    - Custom vimdiff highlight colors (blue for add/change, red for changed text)

  - **Search**
    - `hlsearch` — highlight matches
    - `Space` clears search highlighting
    - `ignorecase` + `smartcase` — case-insensitive unless uppercase is typed

  - **Tabs/indentation**
    - `tabstop=2` / `softtabstop=2` / `shiftwidth=2` / `expandtab` — 2-space soft tabs globally
    - Python override: 4-space tabs

  - **Editing**
    - `formatoptions-=c,r,o` on all filetypes — disables auto-commenting on new lines
    - `clipboard+=unnamedplus` — yank/paste uses system clipboard
    - `F2` / `F10` — toggle paste mode
    - `:W` — write file with sudo

  - **Undo/swap**
    - `undofile` — persistent undo saved to `~/.vim/tmp/undo/`
    - Backup files in `~/.vim/tmp/backup/`, swap in `~/.vim/tmp/swap/`

## Docs

- [Vim Documentation](https://www.vim.org/docs.php)
