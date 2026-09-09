# cowfortune config

- Displays short fortunes (max 200 chars, 120 col width) from curated sources: showerthoughts, handey, hitchhiker, billwurtz, definitions, drugs
- Blocks a specific set of cow files via blacklist

## Files

- **`config`**
  - `LENGTH_USE=short` — only short fortunes
  - `LENGTH_SHORT=200` — max 200 characters
  - `COLUMN_WIDTH=120` — wrap at 120 columns
  - `OFFENSIVE_ONLY=0` — non-offensive fortunes only
  - `LOLCAT_IGNORE=0` — allows lolcat colorization
  - `FORTUNES=` — sources: showerthoughts, handey, hitchhiker, billwurtz, definitions, drugs

- **`whitelist`**
  - Empty (no whitelist filtering)

- **`blacklist`**
  - Blocked cow files: beavis.zen, calvin, cheese, daemon, dragon-and-cow, dragon, eyes, ghostbusters, gnu, kiss, kosh, mech-and-cow, milk, pony, turkey, turtle, head-in, meow, stegosaurus, surgery

## Docs

- [fortune-mod](https://github.com/shlomif/fortune-mod)
- [cowsay](https://github.com/cowsay-org/cowsay)
