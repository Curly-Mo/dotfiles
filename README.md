# dotfiles

Colin's dotfiles, managed with symlinks using GNU stow

## Requirements
GNU Stow

## Usage

Create all symlinks:  
```
./create_symlinks.sh
```

Manage individual targets:
```
#link
stow ./vim --verbose=2 --no-folding -d . --target $HOME
#unlink
stow ./vim -D --verbose=2 --no-folding -d . --target $HOME
```

