# git config

- Uses delta as the pager with side-by-side diffs, line numbers, and a base16 syntax theme
- Neovim as diff and merge tool with `diff3` conflict style
- Credential caching for ~30 days, GitHub/GHE authentication via `gh auth`
- Extensive aliases for branch archiving, upstream rebasing, and cleanup
- Global ignore for compiled files, archives, OS junk, IDE metadata, and `.env`
- Work email override for `~/workspace/` via conditional include

## Files

- **`.gitconfig`**
  - `core.editor = vim`, `core.pager = delta`
  - `diff.tool = nvimdiff`, `merge.tool = nvimdiff`, `merge.conflictstyle = diff3`
  - `push.default = simple`, `pull.rebase = false`
  - `credential.helper = cache --timeout=2600000` (~30 days)
  - GitHub credentials via `gh auth git-credential` for `github.com` and `gist.github.com`
  - GHE username: `colinfahy`
  - **delta config:** side-by-side view, line numbers, base16 syntax theme, dark mode, Apprentice-style diff colors (`#8787af` plus/minus, `#5f875f` emphasis, `#af5f00` minus emphasis)
  - **Aliases:**
      - `remaster`/`remain` — rebase onto upstream master/main with autostash
    - `memaster`/`memain` — merge from upstream master/main with autostash
    - `arc`/`unarc`/`arcl` — archive branches as tags with date prefix, list/restore them
    - `cleanup` — archive branches already merged to master
    - `cleansquashed` — clean up squash-merged branches via `git_cleanup`
    - `fresh` — stash, checkout master, pull upstream
    - `new` — create a new branch from upstream master
    - `monofresh` — fresh + cleansquashed + sparse worktree (monorepo workflow)
    - `git-extras.default-branch = master`
    - `help.autocorrect = prompt`
    - `rerere.enabled = true` — remembers conflict resolutions
    - `filter.lfs` — Git LFS configured
    - `url."https://".insteadOf = git://` — forces HTTPS over git protocol
    - `[includeIf "gitdir:~/workspace/"]` — includes `.gituser` for work repos

- **`.gituser`**
  - `user.name = Colin Fahy`, `user.email = colinfahy@spotify.com` — work identity
  - `url."git@ghe.spotify.net:".insteadOf = https://ghe.spotify.net/` — forces SSH for GHE
  - Maintenance repo: `~/workspace/services-pilot`

- **`.gitignore`**
  - Ignores: `.env`, `.out`, `tags`, `.vim`, compiled binaries (`*.o`, `*.so`, `*.pyc`, `*.class`), archives (`*.zip`, `*.tar`, `*.gz`), logs/databases (`*.log`, `*.sqlite`), OS files (`.DS_Store`, `Thumbs.db`), env managers (`.java-version`, `.python-version`, `.sdkmanrc`), IDE metadata (`.classpath`, `.project`, `.settings/`, `.bloop`, `.metals`), Claude local settings

- **`.config/git/.gitignore`**
  - Same as above without `.sdkmanrc` and Claude entries (XDG location variant)

## Docs

- [git-config](https://git-scm.com/docs/git-config)
- [gitignore](https://git-scm.com/docs/gitignore)
- [delta](https://github.com/dandavison/delta)
