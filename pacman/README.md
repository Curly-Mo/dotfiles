# pacman config

- Uses half the available CPU cores for parallel builds
- Speeds up package compression with fast zstd settings

## Files

- **`.config/pacman/makepkg.conf`**
  - `MAKEFLAGS="-j$(nproc/2)"` — parallel make using half the CPU cores (minimum: all cores if 3 or fewer)
  - `COMPRESSZST=(zstd -c -T0 --fast -9 -)` — multithreaded zstd compression at fast level 9 (trades size for speed)

## Docs

- [makepkg.conf](https://man.archlinux.org/man/makepkg.conf.5)
