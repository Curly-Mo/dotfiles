# idea config

- Vim emulation in JetBrains IDEs with surround, commentary, and ReplaceWithRegister plugins
- Case-insensitive smart search, system clipboard integration, typo-tolerant command aliases

## Files

- **`.ideavimrc`**
  - Enables line numbers, highlight search, incremental search, smart case
  - `Space` clears search highlight
  - Python files use 4-space indentation; default is 2-space (commented out)
  - Typo-tolerant command aliases: `:WQ`, `:Wq`, `:Q`, `:CQ`, `:Bd`, etc.
  - `:W` mapped to `:SudoWrite`, `:Wd` creates parent dirs then writes
  - Clipboard set to `unnamedplus` (system clipboard), `ideaput` disabled
  - 50,000 undo levels with persistent undo
  - Auto-opens readonly on swap file conflict
  - Remembers last cursor position per file
  - Disables auto-commenting on new lines (`formatoptions-=cro`)
  - Emulated plugins: `surround`, `commentary`, `ReplaceWithRegister`

## Docs

- [IdeaVim Configuration](https://github.com/JetBrains/ideavim/wiki/Configuration)
