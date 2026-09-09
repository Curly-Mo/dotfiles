# openai config

- Uses `o4-mini` as the default model
- Runs in `suggest` approval mode (proposes changes but doesn't auto-apply)
- Prompts the user on full-auto errors
- Enables desktop notifications on completion

## Files

- **`.codex/config.yaml`**
  - `model: o4-mini` — default model for Codex CLI
  - `approvalMode: suggest` — requires user approval before applying changes
  - `fullAutoErrorMode: ask-user` — prompts on errors during full-auto mode
  - `notify: true` — sends desktop notifications when tasks complete

- **`.codex/AGENTS.md`**
  - Agent instructions (currently commented out)

## Docs

- [Codex CLI](https://github.com/openai/codex)
