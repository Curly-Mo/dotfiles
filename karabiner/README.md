# karabiner config

- Caps Lock remapped to Escape, Fn remapped to Left Control
- Cmd+H/L mapped to Ctrl+Shift+Tab / Ctrl+Tab for tab navigation
- Standard F1-F12 function key mappings retained

## Files

- **`karabiner.json`**
  - **Simple modifications:**
      - Caps Lock to Escape
    - Fn to Left Control
  - **Complex rules:**
      - `Cmd+L` sends `Ctrl+Tab` (next tab)
    - `Cmd+H` sends `Ctrl+Shift+Tab` (previous tab)
    - Escape sends `Fn+Escape` (pass-through with function modifier)
    - F1-F12 mapped to standard macOS media/brightness keys
    - ANSI keyboard type, 1000ms device open delay
    - Two Apple keyboards registered (product IDs 34304, 632)

## Docs

- [Karabiner-Elements Configuration](https://karabiner-elements.pqrs.org/docs/)
