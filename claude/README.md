# claude config

- Enforces strict commit/push safety rules (never auto-commit, never force-push main)
- Prefers functional, immutable code style with concise writing (no em dashes, bullet-heavy)
- Grants broad read/search/build permissions while requiring confirmation for destructive actions
- Uses Fable model with vim editor mode in fullscreen TUI

## Files

- **`.claude/CLAUDE.md`**
  - Commit rules: never commit/push/stage/amend without explicit permission, stage files by name only
  - Safety: always confirm destructive or ambiguous actions
  - PR format: concise What/Why bulleted lists, no trivial diffs
  - Code style: functional over imperative, immutable types, method chaining, docstrings
  - Writing: no em/en dashes, no filler, bullet points over paragraphs

- **`.claude/settings.json`**
  - `model: fable[1m]` — uses Fable model
  - `editorMode: vim` — vim keybindings
  - `tui: fullscreen` — fullscreen terminal UI
  - `ANTHROPIC_DEFAULT_OPUS_MODEL: claude-opus-4-7` — Opus model override
  - `GH_HOST: ghe.spotify.net` — GitHub Enterprise host
  - Auto-allows: file read/write/edit, git read commands, `gh pr`, bazel, pytest, rg, curl, gsutil, bq, jhurl, various MCP servers
  - Enabled MCP servers: AiKA search, BigQuery, Cloud Logging, code search, deployments, Oliver, music metadata, and others
  - Enabled plugins: jdtls-lsp, storm-audit, impact-log, team-update, groove-epic-sync, pr-jira-sync, utility
  - Custom marketplaces: `after-data-storm-bet` and `sessions-claude-marketplace` from GHE

## Docs

- [Claude Code Documentation](https://docs.anthropic.com/en/docs/claude-code)
