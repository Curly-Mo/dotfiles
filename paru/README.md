# paru config

- Skips PKGBUILD review prompts for faster installs
- Auto-fetches PGP keys and tracks VCS (`-git`, `-svn`, etc.) packages
- Shows search results bottom-up for easier selection

## Files

- **`.config/paru/paru.conf`**
  - `SkipReview` — suppresses the PKGBUILD review prompt before building
  - `PgpFetch` — automatically imports missing PGP keys from keyservers
  - `Devel` — treats VCS packages as upgradable during `paru -Syu`
  - `Provides` — resolves AUR packages by what they provide, not just name
  - `DevelSuffixes` — suffixes that mark a package as VCS (`-git`, `-cvs`, `-svn`, `-bzr`, `-darcs`, `-always`)
  - `BottomUp` — displays search results with the most relevant at the bottom (closest to the cursor)

## Docs

- [Paru Configuration](https://github.com/Morganamilo/paru#configuration)
